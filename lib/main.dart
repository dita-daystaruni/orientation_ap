import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:orientation_app/constants/routes.dart';
import 'package:orientation_app/controllers/activites_session_controller.dart';
import 'package:orientation_app/controllers/contacts_controller.dart';
import 'package:orientation_app/controllers/courses_controller.dart';
import 'package:orientation_app/controllers/faqs_controller.dart';
import 'package:orientation_app/controllers/statistic_controller.dart';
import 'package:orientation_app/firebase_options.dart';

void main() async {

  // Putting controllers
  Get.put(UserContactController());
  Get.put(FaqController());
  Get.put(ActivitySessionController());
  Get.put(CourseController());
  Get.put(StatisticsController());

  // Initialize Firebase Messaging
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Request permission for notifications
  NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');

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
      initialRoute: "splash_screen",
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
