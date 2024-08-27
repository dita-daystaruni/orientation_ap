import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/constants/routes.dart';
import 'package:orientation_app/controllers/activites_session_controller.dart';
import 'package:orientation_app/controllers/contacts_controller.dart';
import 'package:orientation_app/controllers/courses_controller.dart';
import 'package:orientation_app/controllers/faqs_controller.dart';
import 'package:orientation_app/controllers/statistic_controller.dart';

void main() {
  // TODO  all controllers to have a oninit method that are here
  // Putting controllers
  Get.put(UserContactController());
  Get.put(FaqController());
  Get.put(ActivitySessionController());
  Get.put(CourseController());
  Get.put(StatisticsController());

  runApp(
    GetMaterialApp(
      initialRoute: "splash_screen",
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
