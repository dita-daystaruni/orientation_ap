import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/business-3d-black-graduation-cap.png",
                        height: 150,
                        width: 200,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Confirm your details",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "Please enter your admission number",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                  labelText: 'Admission Number'),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextButton.icon(
                                onPressed: () => {},
                                icon: const Icon(
                                  Icons.done_rounded,
                                  color: Colors.green,
                                ),
                                label: const Text("Confirm")),
                            TextFormField(
                              decoration: const InputDecoration(
                                  labelText: 'First time password'),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                  labelText: 'Confirm Password'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (value) => {},
                          ),
                          const Text(
                            "I agree to Terms & Conditions",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Positioned(
                        bottom: 10,
                        right: 120,
                        left: 120,
                        child: ElevatedButton(
                          onPressed: navigatetosingin,
                          child: const Text(
                            "Sign In",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  navigatetosingin() {
    Get.toNamed("/sign_in");
  }
}
