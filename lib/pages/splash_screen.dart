import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Colors.blue,
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
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
                  Text(
                    "Welcome to Daystar",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Welcome to  our vibrant community. Get ready to commence this journey of learning, growth, and unforgettable experiences.",
                      style: Theme.of(context).textTheme.bodyMedium,
                      selectionColor: Colors.blue,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FilledButton(
                    onPressed: gettonextsignin,
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
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
      ),
    );
  }

  gettonextsignin() {
    Get.toNamed("/sign_in");
  }
}
