import 'dart:convert';
import 'dart:isolate';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:orientation_app/constants/routes.dart';
import 'package:orientation_app/controllers/activites_session_controller.dart';
import 'package:orientation_app/controllers/contacts_controller.dart';
import 'package:orientation_app/controllers/courses_controller.dart';
import 'package:orientation_app/controllers/faqs_controller.dart';
import 'package:orientation_app/controllers/statistic_controller.dart';
import 'package:orientation_app/controllers/usercontrollers.dart';
import 'package:orientation_app/firebase_options.dart';
import 'package:orientation_app/models/activity_session_model.dart';
import 'package:orientation_app/pages/splash_screen.dart';
import 'package:orientation_app/utils/custom_date_parser.dart';
import 'package:orientation_app/widgets/custom_bottomnav.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Putting controllers
  Get.put(UserController());
  Get.put(UserContactController());
  Get.put(FaqController());
  Get.put(ActivitySessionController());
  Get.put(CourseController());
  Get.put(StatisticsController());

  // // Initialize Firebase Messaging
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Request permission for notifications
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'high_importance_channel',
            'High Importance Notifications',
            channelDescription:
                'This channel is used for important notifications.',
            importance: Importance.max,
            priority: Priority.high,
            icon: '@mipmap/ic_launcher',
          ),
        ),
      );
    }
  });

  runApp(
    GetMaterialApp(
      home: const OrientationApp(),
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}

class OrientationApp extends StatelessWidget {
  const OrientationApp({super.key});

  Future<dynamic> computeIsolate(Future Function() function) async {
    final receivePort = ReceivePort();
    // activity controller
    ActivitySessionController activitySessionController =
        Get.find<ActivitySessionController>();
    int count = 0;
    // ensures that the background isolate has activities before spawning it
    while (true) {
      if (activitySessionController.activities.isEmpty && count > 5) {
        break;
      } else if (activitySessionController.activities.isNotEmpty) {
        break;
      }
      await activitySessionController.getActivitiesFromSP();
      count++;
      // wait for a few seconds before retring
      await Future.delayed(const Duration(seconds: 10));
      debugPrint("retring");
    }
    // ensures the background task only runs after activities are present
    if (activitySessionController.activities.isNotEmpty) {
      RootIsolateToken rootToken = RootIsolateToken.instance!;
      Isolate backgroundIsolate = await Isolate.spawn<_IsolateData>(
        _isolateEntry,
        _IsolateData(
          token: rootToken,
          function: function,
          answerPort: receivePort.sendPort,
        ),
      );

      // listen for changes
      receivePort.listen(
        (message) {
          if (message is! SendPort) {
            if (message != null) {
              // updates the upcoming and outgoing activity
              activitySessionController.ongoingActivity.value =
                  message["ongoing"];
              activitySessionController.upcomingActivity.value =
                  message["upcoming"];
            } else {
              // kill the isolate will be restarted once the user restarts app
              backgroundIsolate.kill();
              Get.snackbar("Error",
                  "Activity Updater Killed, Need To Restart App For Correct Data");
            }
          }
        },
      );
    } else {
      // telling user to restart app so that we reinitiate the process
      Get.snackbar(
        "Error",
        "Activity Updater Killed, Need To Restart App For Correct Data",
        isDismissible: false,
      );
    }
  }

  void _isolateEntry(_IsolateData isolateData) async {
    BackgroundIsolateBinaryMessenger.ensureInitialized(isolateData.token);
    late dynamic answer;
    while (true) {
      answer = await isolateData.function();

      isolateData.answerPort.send(answer);
      // if returns null means that activites are empty
      if (answer != null) {
        await Future.delayed(answer["duration"]);
      }
      // wait for a particular time
    }
  }

  Future _backgroundTask() async {
    debugPrint("Started");
    // get activities from SP helps to update upcoming activities
    Map<String, List<ActivitySessionModel>>? activities =
        await getActivitiesFromSP();

    if (activities == null) {
      // TODO retrying after some while to cover when user logouts and has not
      // restarted application
      return null;
    }

    // Custom Date Parse
    CustomDateParser customDateParser = CustomDateParser();
    // get upcoming and ongoing activities
    List<ActivitySessionModel?> upcomingOngoing =
        customDateParser.getUpcomingActivity(activities);
    if (upcomingOngoing[1] != null && upcomingOngoing[0] != null) {
      Map<String, int> differences =
          customDateParser.getTimeDiference(upcomingOngoing[1]!);

      return {
        "upcoming": upcomingOngoing[1],
        "ongoing": upcomingOngoing[1],
        "duration": Duration(
          days: differences["days"]!,
          hours: differences["hours"]!,
          minutes: differences["minutes"]!,
          seconds: differences["seconds"]!,
        ),
      };
    }
    // Send result back to the main UI isolate
  }

  // gets activities from sp
  static Future getActivitiesFromSP() async {
    Map<String, List<ActivitySessionModel>> activities =
        <String, List<ActivitySessionModel>>{};

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? activitiesString = prefs.getString("activities");
    await prefs.reload();
    if (activitiesString != null) {
      Map<String, dynamic> decodedActivities = jsonDecode(activitiesString);
      // clear activities before adding new ones
      activities.clear();
      // adding new activities
      decodedActivities.forEach(
        (key, value) {
          List<ActivitySessionModel> decodedDayActivities = [];
          for (var day in value) {
            decodedDayActivities.add(
              ActivitySessionModel.fromJson(day),
            );
          }
          activities[key] = decodedDayActivities;
        },
      );
      return activities;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // run background task i
    computeIsolate(_backgroundTask);

    // Getting user controller
    UserController userController = Get.find<UserController>();
    return userController.isLoggedIn.value && userController.user.value != null
        ? BottomNav(user: userController.user.value!)
        : const SplashScreen();
  }
}

// class for passing Isolate data
class _IsolateData {
  final RootIsolateToken token;
  final Function function;
  final SendPort answerPort;

  _IsolateData({
    required this.token,
    required this.function,
    required this.answerPort,
  });
}
