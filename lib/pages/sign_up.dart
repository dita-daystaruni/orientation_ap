import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/services/authentication.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController admnocontroller = TextEditingController();

  final TextEditingController passwordcontroller = TextEditingController();

  final TextEditingController confirmpasswordcontroller =
      TextEditingController();

  bool ispasswordvisible = true;
  bool isconfirmpasswordvisible = true;
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
        child: Center(
          child: SafeArea(
            minimum: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/business-3d-black-graduation-cap.png",
                      height: 150,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Create an account",
                      style: Theme.of(context).textTheme.headlineMedium,
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

                    const SizedBox(width: 16), // Add spacing between the fields
                    TextFormField(
                      controller: admnocontroller,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: 'Enter Admission number',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.done_rounded,
                        color: Colors.green,
                      ),
                      label: const Text("Confrim"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Please Enter your first time password',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordcontroller,
                      obscureText: ispasswordvisible,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        //labelText: 'Enter Password',
                        hintText: 'Enter Password',

                        suffixIcon: IconButton(
                          icon: Icon(ispasswordvisible
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              ispasswordvisible = !ispasswordvisible;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: isconfirmpasswordvisible,
                      controller: confirmpasswordcontroller,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isconfirmpasswordvisible =
                                  !isconfirmpasswordvisible;
                            });
                          },
                          icon: Icon(
                            isconfirmpasswordvisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
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
                            onChanged: (value) {
                              setState(() {
                                ischecked = !ischecked;
                              });
                            }),
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
                    FilledButton(
                      onPressed: ()async{
                        var response = await singUp(admnocontroller.text.trim(), emailcon, userName)
                      },
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue),
                      ),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void toggleischecked() {
    ischecked = !ischecked;
  }

  navigatetosingin() {
    Get.toNamed("/sign_in");
  }

  togglepasswordvisibility() {
    setState(() {
      ispasswordvisible = !ispasswordvisible;
    });
  }
}
