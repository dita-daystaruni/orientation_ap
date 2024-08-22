import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:orientation_app/constants/custom_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Image.asset(
                  "assets/images/3d-casual-life-group-of-young-people-discussing-something-while-working.png",
                  height: 210,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Welcome To Daystar",
                  style: TextStyle(
                    color: CustomColors.textColor,
                    fontSize: 35,
                  ),
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Welcome to  our vibrant community. Get ready to commence this journey of learning, growth, and unforgettable experiences.",
                    style: TextStyle(
                      color: CustomColors.textColor,
                    ),
                    selectionColor: Colors.blue,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                FilledButton(
                  onPressed: () => Get.toNamed("/sign_in"),
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(CustomColors.buttonColor),
                  ),
                  child: const Text('Get Started'),
                ),
                const Spacer(),
                Image.asset(
                  "assets/images/powered_by_dita1.png",
                  height: 120,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
