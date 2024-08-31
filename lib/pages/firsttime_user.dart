import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/models/user_model.dart';
import 'package:orientation_app/pages/preparation_page.dart';
import 'package:orientation_app/services/authentication.dart';

class FirsttimeUser extends StatefulWidget {
  const FirsttimeUser({
    super.key,
    required this.admNo,
    required this.password,
  });

  final String admNo;
  final String password;

  @override
  State<FirsttimeUser> createState() => _FirsttimeUserState();
}

class _FirsttimeUserState extends State<FirsttimeUser> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isWaiting = false;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: CustomColors.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 22.0),
            child: Image.asset(
              "assets/images/grajweshencap.png",
              height: 150,
              width: 200,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            child: Text(
              "Password Change Required",
              style: TextStyle(
                color: CustomColors.textColor,
                fontWeight: FontWeight.w500,
                fontSize: 28,
              ),
            ),
          ),
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    color: CustomColors.textColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                  children: [
                    const TextSpan(text: 'Your default password is '),
                    TextSpan(
                      text: widget.password,
                      style: const TextStyle(
                        color: CustomColors.textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    const TextSpan(
                      text:
                          '\nIf you don\'t wish to change it, you can skip to login. However, if you would like to update it, please enter your new password and confirm it.',
                    ),
                  ],
                ),
              )),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 26.0,
                  vertical: 8.0,
                ),
                child: TextFormField(
                  cursorColor: CustomColors.buttonColor,
                  controller: passwordController,
                  obscureText: isPasswordVisible,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: widget.password,
                      suffixIcon: IconButton(
                        onPressed: () => setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        }),
                        icon: Icon(isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 26.0,
                  vertical: 8.0,
                ),
                child: TextFormField(
                  cursorColor: CustomColors.buttonColor,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isConfirmPasswordVisible = !isConfirmPasswordVisible;
                        });
                      },
                      icon: Icon(isConfirmPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                  controller: confirmPasswordController,
                  obscureText: isConfirmPasswordVisible,
                ),
              ),
            ],
          ),
          isWaiting
              ? const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: CircularProgressIndicator(
                    color: CustomColors.buttonColor,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: FilledButton(
                    onPressed: () async {
                      // validating user input
                      if (passwordController.text.trim().isEmpty ||
                          confirmPasswordController.text.trim().isEmpty) {
                        Get.snackbar('Empty Field(s)',
                            'Ensure you have filled all the fiels');
                      } else if (passwordController.text.trim() !=
                          confirmPasswordController.text.trim()) {
                        Get.snackbar(
                          'Error',
                          'Password And Confirm Password Don\'t Match',
                        );
                      } else {
                        setState(() {
                          isWaiting = !isWaiting;
                        });
                        // sending request to change password
                        await sendChangePasswordRequest(
                          context,
                          widget.admNo,
                          passwordController.text.trim(),
                        );
                      }
                    },
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        CustomColors.buttonColor,
                      ),
                    ),
                    child: const Text(
                      "Change password",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
          const Spacer(),
          isWaiting
              ? const SizedBox()
              : GestureDetector(
                  onTap: () async {
                    setState(() {
                      isWaiting = !isWaiting;
                    });
                    await sendChangePasswordRequest(
                      context,
                      widget.admNo,
                      widget.password,
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 22.0,
                    ),
                    child: Text(
                      "Skip & Log In",
                      style: TextStyle(
                        color: CustomColors.buttonColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }

  Future<void> sendChangePasswordRequest(
    BuildContext context,
    String admNo,
    String password,
  ) async {
    try {
      print(admNo);
      print(password);
      var response = await changeFirstTimePassword(
        admNo,
        password,
      );
      switch (response[0]) {
        case 200:
          // successful changed password
          response = await signIn(
            admNo,
            password,
          );
          if (response[0] == 200) {
            // get user object and navigate to preparation pageobject
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
              ),
            );
          } else {
            print(response[1]);
            // debugPrint(response[0] as String);
            setState(() {
              isWaiting = !isWaiting;
            });
            Get.snackbar(
              'Something Went Wrong!🥲',
              'Retry Or Contact dita@daystar.ac.ke To Report Incidence If Issue Persists',
            );
          }

        case < 500:
          // server issues
          setState(() {
            isWaiting = !isWaiting;
          });
          Get.snackbar(
            'Something Went Wrong!!',
            response[1]['message'],
          );
        default:
          // server issues
          setState(() {
            isWaiting = !isWaiting;
          });
          Get.snackbar(
            'Something Went Wrong!🥲',
            'Retry Or Contact dita@daystar.ac.ke To Report Incidence If Issue Persists',
          );
      }
    } on ClientException catch (e) {
      // client has no internet or server might be down
      setState(() {
        isWaiting = !isWaiting;
      });
      debugPrint(
        "Exception in First Time User Page ${e.toString()}",
      );
      Get.snackbar(
        'Something Went Wrong!🥲',
        'Retry Or Contact dita@daystar.ac.ke To Report Incidence If Issue Persists',
      );
    } catch (e) {
      // exception occured
      setState(() {
        isWaiting = !isWaiting;
      });
      debugPrint(
        "Exception in First Time User  ${e.toString()}",
      );
      debugPrint(
        "Exception in First Time User  ${e.toString()}",
      );
      Get.snackbar(
        'Something Went Wrong!🥲',
        'Retry Or Contact dita@daystar.ac.ke To Report Incidence If Issue Persists',
      );
    }
  }
}
