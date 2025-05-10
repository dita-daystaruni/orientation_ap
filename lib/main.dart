import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/constants/routes.dart';
import 'package:orientation_app/controllers/activities_controller.dart';
import 'package:orientation_app/controllers/attendance_controller.dart';
import 'package:orientation_app/controllers/family_controller.dart';
import 'package:orientation_app/controllers/notifications_controller.dart';
import 'package:orientation_app/controllers/posts_controller.dart';
import 'package:orientation_app/controllers/statistic_controller.dart';
import 'package:orientation_app/controllers/usercontroller.dart';
import 'package:orientation_app/pages/home_page.dart';
import 'package:orientation_app/pages/splash_screen.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Putting controllers

  Get.put(UserController());
  Get.put(AttendanceController());
  Get.put(StatisticsController());
  Get.put(PostsController());
  Get.put(FamilyController());
  Get.put(NotificationController());
  Get.put(ActivityController());

  if (kIsWeb) {
// Enable verbose logging for debugging (remove in production)
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    // Initialize with your OneSignal App ID
    OneSignal.initialize("38534632-4801-4630-83b4-247fa15d02af");
  }

  runApp(
    GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        brightness: Brightness.dark,
      ),
      home: const OrientationApp(),
      getPages: AppRoutes.routes,
    ),
  );
}

class OrientationApp extends StatelessWidget {
  const OrientationApp({super.key});
  @override
  Widget build(BuildContext context) {
    // Getting user controller
    UserController userController = Get.find<UserController>();
    return Obx(
      () => userController.user.value != null
          ? const HomePage()
          : const SplashScreen(),
    );
  }
}
