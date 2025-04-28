import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:orientation_app/models/user_model.dart';
import 'package:orientation_app/pages/firsttime_user.dart';
import 'package:orientation_app/pages/preparation_page.dart';
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
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Sign in into your account"),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 18,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/icon.png",
                  height: 150,
                  width: 200,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "To continue and track your orientation progress, please enter your admission number below.",
                    textAlign: TextAlign.center,
                  ),
                ),
                TextFormField(
                  controller: admnocontroller,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: 'e.g 00-0000',
                    label: Text("Admission Number"),
                  ),
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
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                iswaiting
                    ? const CircularProgressIndicator()
                    : FilledButton(
                        onPressed: () async {
                          // validating user input
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
                            try {
                              var response = await signIn(
                                admnocontroller.text.trim(),
                                passwordcontroller.text.trim(),
                              );
                              switch (response[0]) {
                                case 200:
                                  // successful login take user to login page
                                  User user = User.fromJson(response[1]);
                                  // Get.offAndToNamed("/landing_page");
                                  if (!context.mounted) return;
                                  // drop the current page
                                  Navigator.pop(context);
                                  // move to the next page
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (builder) => PreparationPage(
                                          user: user,
                                        ),
                                      ));
                                case 412:
                                  // first time user take them back to login
                                  String randompass =
                                      "${generateRandomLetters()}-${admnocontroller.text.trim()}";
                                  if (!context.mounted) return;
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (builder) => FirsttimeUser(
                                        admNo: admnocontroller.text.trim(),
                                        password: randompass,
                                      ),
                                    ),
                                  );
                                case < 500:
                                  // server issues
                                  setState(() {
                                    iswaiting = !iswaiting;
                                  });
                                  Get.snackbar(
                                    'Something Went Wrong!!',
                                    response[1]['message'],
                                  );
                                default:
                                  // server issues
                                  setState(() {
                                    iswaiting = !iswaiting;
                                  });
                                  Get.snackbar(
                                    'Something Went Wrong!!',
                                    'Retry Or Contact dita@daystar.ac.ke To Report Incidence',
                                  );
                              }
                            } on ClientException catch (e) {
                              // client has no internet or server might be down

                              debugPrint(
                                "Exception in Log in Page ${e.toString()}",
                              );
                              setState(() {
                                iswaiting = !iswaiting;
                              });
                              Get.snackbar(
                                'Kindly Check Your Internet Connection And Retry',
                                'If Your Connection Is Great, Contact dita@daystar.ac.ke To Report Incidence',
                              );
                            } catch (e) {
                              // exception occured
                              // rethrow;
                              debugPrint(
                                "Exception in Log in Page ${e.toString()}",
                              );
                              setState(() {
                                iswaiting = !iswaiting;
                              });
                              Get.snackbar(
                                'Something Went Wrong!🥲',
                                'Retry Or Contact dita@daystar.ac.ke To Report Incidence If Issue Persists',
                              );
                            }
                          }
                        },
                        child: const Text(
                          "Log In",
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String generateRandomLetters() {
    const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    Random random = Random();

    String randomLetters = '';
    for (int i = 0; i < 3; i++) {
      randomLetters += letters[random.nextInt(letters.length)];
    }

    return randomLetters;
  }
}
