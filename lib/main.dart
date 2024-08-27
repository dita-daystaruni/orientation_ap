import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/constants/routes.dart';
import 'package:orientation_app/controllers/activites_session_controller.dart';
import 'package:orientation_app/controllers/contacts_controller.dart';
import 'package:orientation_app/controllers/faqs_controller.dart';

void main() {
  // Putting controllers
  Get.put(UserContactController());
  Get.put(FaqController());
  Get.put(ActivitySessionController());

  runApp(
    GetMaterialApp(
      initialRoute: "splash_screen",
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
