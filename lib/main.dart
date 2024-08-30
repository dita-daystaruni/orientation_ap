import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/constants/routes.dart';
import 'package:orientation_app/controllers/activites_session_controller.dart';
import 'package:orientation_app/controllers/contacts_controller.dart';
import 'package:orientation_app/controllers/courses_controller.dart';
import 'package:orientation_app/controllers/faqs_controller.dart';
import 'package:orientation_app/controllers/statistic_controller.dart';
import 'package:orientation_app/controllers/usercontrollers.dart';
import 'package:orientation_app/pages/splash_screen.dart';
import 'package:orientation_app/widgets/custom_bottomnav.dart';

void main() {
  // Putting controllers
  Get.put(UserController());
  Get.put(UserContactController());
  Get.put(FaqController());
  Get.put(ActivitySessionController());
  Get.put(CourseController());
  Get.put(StatisticsController());

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

  @override
  Widget build(BuildContext context) {
    // start the background task

    // Getting user controller
    UserController userController = Get.find<UserController>();
    return userController.isLoggedIn.value && userController.user.value != null
        ? BottomNav(user: userController.user.value!)
        : const SplashScreen();
  }
}
