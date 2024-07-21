import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignIn extends StatefulWidget {
  SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController admnocontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();
  bool? ischecked = false;

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
                        "Sign in to your Account",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "You're just one step away from diving into this incredible journey. At Daystar University, we believe in your potential.",
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
                                labelText: 'Admission Number',
                              ),
                              //Controller for ADM Number
                              controller: admnocontroller,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Password',
                              ),
                              controller: passwordcontroller,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // TextFormField(
                            //   decoration: const InputDecoration(
                            //       labelText: 'Confirm Password'),
                            // ),
                            const Text("Are you a first time user & Freshman?"),
                            TextButton(
                                onPressed: navigatetosingup,
                                child: const Text("Sing Up Here"))
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
                            value: ischecked,
                            onChanged: (value) => {
                              setState(() {
                                ischecked = !false;
                              }),
                            },
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
                          onPressed: navigatetohomepage,
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

  navigatetohomepage() {
    Get.toNamed("/home_page");
  }

  navigatetosingup() {
    Get.toNamed("/sign_up");
  }
}
