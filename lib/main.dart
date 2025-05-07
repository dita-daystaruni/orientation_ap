import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/constants/routes.dart';
import 'package:orientation_app/controllers/family_controller.dart';
import 'package:orientation_app/controllers/posts_controller.dart';
import 'package:orientation_app/controllers/usercontroller.dart';
import 'package:orientation_app/pages/home_page.dart';
import 'package:orientation_app/pages/splash_screen.dart';

// TODO: change application package name
// TODO: change application name

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Putting controllers

  Get.put(UserController());
  Get.put(PostsController());
  Get.put(FamilyController());

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
