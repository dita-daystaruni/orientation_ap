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
          minimum: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset(
                "assets/images/3d-casual-life-group-of-young-people-discussing-something-while-working.png",
                height: 200,
                width: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Welcome to Daystar",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Welcome to  our vibrant community. Get ready to commence this journey of learning, growth, and unforgettable experiences.",
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              // IconButton(
              //   color: Colors.white,
              //   onPressed: gettonextsignin,
              //   icon: const Icon(Icons.forward),
              //   iconSize: 30,
              // ),

              const SizedBox(height: 22),

              FilledButton(
                onPressed: () {
                  gettonextsignin();
                },
                child: const Text("Get Started"),
              ),
              const Spacer(),
              Image.asset(
                "assets/images/powered_by_dita1.png",
                height: 80,
              )
            ],
          ),
        ),
      ),
    );
  }

  gettonextsignin() {
    Get.toNamed("/sign_in");
  }
}
