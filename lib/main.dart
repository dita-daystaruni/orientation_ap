import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/constants/routes.dart';
import 'package:orientation_app/controllers/family_controller.dart';
import 'package:orientation_app/controllers/notifications_controller.dart';
import 'package:orientation_app/controllers/posts_controller.dart';
import 'package:orientation_app/controllers/usercontroller.dart';
import 'package:orientation_app/pages/home_page.dart';
import 'package:orientation_app/pages/splash_screen.dart';

// Include the OneSignal package
import 'package:onesignal_flutter/onesignal_flutter.dart';

// TODO: change application package name
// TODO: change application name

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Putting controllers

  Get.put(UserController());
  Get.put(PostsController());
  Get.put(FamilyController());
  Get.put(NotificationController());

  if (Platform.isAndroid) {
// Enable verbose logging for debugging (remove in production)
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    // Initialize with your OneSignal App ID
    OneSignal.initialize("38534632-4801-4630-83b4-247fa15d02af");
    // Use this method to prompt for push notifications.
    // We recommend removing this method after testing and instead use In-App Messages to prompt for notification permission.
    // OneSignal.Notifications.requestPermission(true);
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
