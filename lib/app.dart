import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/controllers/usercontroller.dart';
import 'package:orientation_app/pages/home_page.dart';
import 'package:orientation_app/pages/splash_screen.dart';

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
