import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:orientation_app/constants/routes.dart';
import 'package:orientation_app/controllers/contacts_controller.dart';

void main() {
    // Putting controllers
  Get.put(UserContactController());

  runApp(
    GetMaterialApp(
      initialRoute: "splash_screen",
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
