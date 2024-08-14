import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/services/authentication.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController admnocontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();
  bool ischecked = false;
  bool ispasswordvisible = true;
  bool iswaiting = false;

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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/grajweshencap.png",
                      height: 150,
                      width: 200,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Sign in to your Account",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "Please enter your details to login to your account and keep track of your orientation progress.",
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
                            controller: admnocontroller,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              hintText: 'Enter Admission number',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    ispasswordvisible = !ispasswordvisible;
                                  });
                                },
                                icon: Icon(ispasswordvisible
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                            ),
                            controller: passwordcontroller,
                            obscureText: ispasswordvisible,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextButton(
                            onPressed: () {
                              Get.offAllNamed('/sign_up');
                            },
                            child: const Text(
                              "First time user or freshman ? Click Here",
                              // style: TextStyle(
                              //   decoration: TextDecoration.underline,

                              // ),
                            ),
                          )
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
                          onChanged: (value) {
                            setState(() {
                              ischecked = !ischecked;
                            });
                          },
                        ),
                        const Text(
                          "I agree to Terms & Conditions",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    iswaiting
                        ? const CircularProgressIndicator()
                        : FilledButton(
                            onPressed: () async {
                              // validating user input
                              Get.offAllNamed('/landing_page');
                              if (admnocontroller.text.trim().isEmpty ||
                                  passwordcontroller.text.trim().isEmpty) {
                                Get.snackbar('Empty Field(s)',
                                    'Ensure you have filled all the fiels');
                              } else if (!ischecked) {
                                Get.snackbar('Required',
                                    'Please Accept Terms And Conditions');
                              } else {
                                setState(() {
                                  iswaiting = !iswaiting;
                                });
                                // sending login request
                                var response = await signIn(
                                  admnocontroller.text.trim(),
                                  passwordcontroller.text.trim(),
                                );
                                switch (response[0]) {
                                  case 200:
                                    // required processes for login
                                    Get.offAndToNamed('/landing_page');
                                    print(response[1]);
                                  case < 500:
                                    setState(() {
                                      iswaiting = !iswaiting;
                                    });
                                    Get.snackbar('Error', response[1]['error']);
                                  default:
                                    // server problems
                                    debugPrint(response[0] as String);
                                    setState(() {
                                      iswaiting = !iswaiting;
                                    });
                                    Get.snackbar(
                                      'Something Went Wrong!!',
                                      'Retry Or Contact dita@daystar.ac.ke To Report Incidence',
                                    );
                                }
                              }
                            },
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.blue),
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

  navigatetosingup() {
    Get.toNamed("/sign_up");
  }
}
