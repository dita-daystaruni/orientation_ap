import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController admnocontroller = TextEditingController();

  final TextEditingController firsttimepassword = TextEditingController();

  final TextEditingController confirmpassword = TextEditingController();

  bool isvisible = false;
  bool ischecked = false;

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
                                labelText: 'Admission Number',
                              ),
                              controller: admnocontroller,
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
                              controller: firsttimepassword,
                              decoration: InputDecoration(
                                labelText: 'First time password',
                                icon: IconButton(
                                  onPressed: togglepasswordvisibility,
                                  icon: Icon(
                                    isvisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                              ),
                              obscureText: true,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: confirmpassword,
                              decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                icon: IconButton(
                                  onPressed: togglepasswordvisibility(),
                                  icon: Icon(
                                    isvisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                              ),
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
                            value: ischecked,
                            onChanged: toggleischecked(),
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

  toggleischecked() {
    ischecked = !ischecked;
  }

  navigatetosingin() {
    Get.toNamed("/sign_in");
  }

  togglepasswordvisibility() {
    setState(() {
      isvisible = !isvisible;
    });
  }
}
