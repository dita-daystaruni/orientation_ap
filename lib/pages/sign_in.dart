import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:orientation_app/controllers/notifications_controller.dart';
import 'package:orientation_app/controllers/usercontroller.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final UserController _userController = Get.find<UserController>();
  final NotificationController _notificationController =
      Get.find<NotificationController>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool consent = false;
  bool _showPassword = true;

  Future<bool?> _promptConsent() => showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Just a minute before you continue"),
          content: const Text(
            "By continuing, you consent to Academia processing your data to enhance your experience during your time at Daystar University.",
          ),
          actions: [
            FilledButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text("I Agree")),
            OutlinedButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text("Decline"))
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Lets find you and set you up for school"),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(12),
            sliver: MultiSliver(
              children: [
                CircleAvatar(
                  radius: 80,
                  child: Lottie.asset(
                    height: 350,
                    "assets/lotties/profile.json",
                    repeat: false,
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  "Please provide your admission number and password to get onboarded into Daystar University",
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: emailController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Admission Number",
                    hintText: "e.g. 00-0000",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  obscureText: _showPassword,
                  controller: passwordcontroller,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      icon: Icon(_showPassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    labelText: "Password",
                    hintText: "Please provide your password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                FilledButton(
                  onPressed: () async {
                    final consent = (await _promptConsent() ?? false);
                    if (!consent) return;
                    final result = await _userController.login(
                      emailController.text,
                      passwordcontroller.text,
                    );

                    if (result.isLeft() && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          (result as dartz.Left).value,
                        ),
                      ));
                    }

                    if (result.isRight() &&
                        (result as dartz.Right).value == true) {
                      if (_userController.user.value!.verified) {
                      _notificationController.requestPermission(_userController.user.value!);
                        Get.offAllNamed("/home");
                        return;
                      }
                      if (!context.mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text("Please visit the registration desk")),
                      );
                      await _userController.logout();
                    }

                    if (!context.mounted) return;
                  },
                  child: Obx(
                    () => _userController.isLoading.value
                        ? const CircularProgressIndicator.adaptive(
                            backgroundColor: Colors.white,
                          )
                        : const Text("Sign into Academia"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
