import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/models/user_model.dart';
import 'package:orientation_app/services/authentication.dart';
import 'package:orientation_app/widgets/custom_bottomnav.dart';

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
      backgroundColor: CustomColors.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                const Text(
                  "Sign in to your Account",
                  style: TextStyle(
                    color: CustomColors.textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 28,
                  ),
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Please enter your details to login to your account and keep track of your orientation progress.",
                    style: TextStyle(
                      color: CustomColors.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        cursorColor: CustomColors.buttonColor,
                        controller: admnocontroller,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          hintText: 'Admission Number',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        cursorColor: CustomColors.buttonColor,
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
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      activeColor: CustomColors.buttonColor,
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
                        color: CustomColors.textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                iswaiting
                    ? const CircularProgressIndicator(
                        color: CustomColors.buttonColor,
                      )
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
                            // TODO check for timeouts
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
                                      builder: (builder) => BottomNav(
                                        user: user,
                                      ),
                                    ));
                              case < 500:
                                setState(() {
                                  iswaiting = !iswaiting;
                                });
                                print(response[0]);
                                print(response[1]);
                                Get.snackbar('Error', response[1]['message']);
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
                          backgroundColor: WidgetStatePropertyAll(
                            CustomColors.buttonColor,
                          ),
                        ),
                        child: const Text(
                          "Log In",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
