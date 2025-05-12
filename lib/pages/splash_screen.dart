import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 12,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                const CircleAvatar(
                  radius: 120,
                  backgroundImage: AssetImage(
                    "assets/icons/du-logo.jpg",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome to Daystar University",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontFamily: GoogleFonts.inter().fontFamily,
                      ),
                ),
                const Spacer(),
                // const Spacer(),
                FilledButton.icon(
                  iconAlignment: IconAlignment.end,
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () => Get.toNamed("/login"),
                  label: const Text('Get Started'),
                ),
                const Spacer(),
                Image.asset(
                  "assets/images/powered_by_dita1.png",
                  height: 65,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
