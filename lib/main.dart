import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/app.dart';
import 'package:orientation_app/constants/routes.dart';
import 'package:orientation_app/controllers/activities_controller.dart';
import 'package:orientation_app/controllers/attendance_controller.dart';
import 'package:orientation_app/controllers/family_controller.dart';
import 'package:orientation_app/controllers/notifications_controller.dart';
import 'package:orientation_app/controllers/posts_controller.dart';
import 'package:orientation_app/controllers/statistic_controller.dart';
import 'package:orientation_app/controllers/usercontroller.dart';
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
    OneSignal.initialize("7fac2b4a-4d01-4665-ad44-ee8497ca8922");
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
