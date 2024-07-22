import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  int x = 0;
  bool showPassword = false;
  bool showConfirmPassword = false;

  TextEditingController admnoController = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/images/profile.png",
                height: 200,
              ),
              const SizedBox(height: 22),
              Text(
                "Hi there!",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 32),
              TextFormField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.person_2),
                  hintText: "Admission Number",
                ),
              ),
              const SizedBox(height: 22),
              TextFormField(
                controller: password,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      showPassword ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
                obscureText: showPassword,
              ),
              const SizedBox(height: 22),
              TextFormField(
                controller: confirmPassword,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        showConfirmPassword = !showConfirmPassword;
                      });
                    },
                    icon: Icon(
                      showConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),
                obscureText: showConfirmPassword,
              ),
              const SizedBox(height: 22),
              FilledButton(
                onPressed: () {
                  setState(() {});
                },
                child: const Text("Sign up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
