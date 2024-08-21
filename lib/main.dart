import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:orientation_app/constants.dart/routes.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialRoute: "splash_screen",
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      //Get.to()and offnamed
    ),
  );
}
