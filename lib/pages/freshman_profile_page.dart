import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/constants/custom_icons/custom_icons.dart';
import 'package:orientation_app/models/user_model.dart';
import 'package:orientation_app/pages/reload_page.dart';
import 'package:orientation_app/pages/splash_screen.dart';
import 'package:orientation_app/utils/custom_url_launchers.dart';
import 'package:orientation_app/utils/logout.dart';
import 'package:orientation_app/widgets/text_icon.dart';

class FreshmanProfilePage extends StatelessWidget {
  const FreshmanProfilePage({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: CustomColors.backgroundColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.to(ReloadPage(user: user));
          },
          icon: const Icon(
            Icons.replay_outlined,
            color: CustomColors.textColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              // Call the dialog function and wait for user response
              bool shouldLogout = await showLogoutConfirmationDialog(context);

              if (shouldLogout) {
                // Clears shared prefs and log out
                await logOutUser();
                // Navigate user back to the beginning
                Get.offAll(const SplashScreen());
              }
            },
            icon: const Icon(
              Icons.logout,
              color: CustomColors.textColor,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              user.gender == "Male"
                  ? 'assets/images/profile.png'
                  : 'assets/images/female_student.png',
              height: MediaQuery.of(context).size.height * 0.2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
              bottom: 8.0,
            ),
            child: Center(
              child: Text(
                '${user.firstName} ${user.lastName}',
                style: const TextStyle(
                  color: CustomColors.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 1.0,
                bottom: 16.0,
              ),
              child: Text(
                user.admNo,
                style: const TextStyle(
                  color: CustomColors.textColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 8.0,
            ),
            child: Text(
              'Personal Details',
              style: TextStyle(
                color: CustomColors.textColor,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: CustomTextIcon(
              leadingIcon: const Icon(
                CustomIcons.graduationcap,
              ),
              label: Text(
                user.course,
                style: const TextStyle(
                  color: CustomColors.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: CustomTextIcon(
              leadingIcon: const Icon(Icons.phone),
              label: Text(
                user.phoneNo,
                style: const TextStyle(
                  color: CustomColors.textColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: CustomTextIcon(
              leadingIcon: const Icon(
                Icons.email_outlined,
              ),
              label: Text(
                user.email,
                style: const TextStyle(
                  color: CustomColors.textColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          user.parent != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 8.0,
                      ),
                      child: Text(
                        'Orientation Details',
                        style: TextStyle(
                          color: CustomColors.textColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 12.0,
                        left: 20.0,
                      ),
                      child: Row(
                        children: [
                          const Text(
                            'Parent Name: ',
                            style: TextStyle(
                              color: CustomColors.textColor,
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '${user.parent!.firstName} ${user.parent!.lastName}',
                            style: const TextStyle(
                              color: CustomColors.textColor,
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 12.0,
                        left: 20.0,
                      ),
                      child: Row(
                        children: [
                          const Text(
                            'Parent phone: ',
                            style: TextStyle(
                              color: CustomColors.textColor,
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                          CustomTextIcon(
                            trailingIcon: IconButton(
                              onPressed: () async {
                                await makePhoneCall(user.parent!.phoneNo);
                              },
                              icon: const Icon(
                                Icons.phone,
                                color: CustomColors.buttonColor,
                              ),
                            ),
                            label: Text(
                              user.parent!.phoneNo,
                              style: const TextStyle(
                                color: CustomColors.textColor,
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                              ),
                            ),
                            isNumber: true,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 12.0,
                        left: 20.0,
                      ),
                      child: Row(
                        children: [
                          const Text(
                            'Parent email: ',
                            style: TextStyle(
                              color: CustomColors.textColor,
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                          CustomTextIcon(
                            trailingIcon: IconButton(
                              onPressed: () async {
                                await sendEmail(user.parent!.email);
                              },
                              icon: const Icon(
                                Icons.email_outlined,
                                color: CustomColors.buttonColor,
                              ),
                            ),
                            label: Text(
                              user.parent!.email,
                              style: const TextStyle(
                                color: CustomColors.textColor,
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: Lottie.asset("assets/lotties/error.json")),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "No Parent yet",
                        style: TextStyle(
                          color: CustomColors.secondaryTextColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
        ],
      ),
    );
  }

  // Function to show a logout confirmation dialog
  Future<bool> showLogoutConfirmationDialog(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: CustomColors.backgroundColor,
              title: const Text('Confirm Logout'),
              content: const Text('Are you sure you want to log out?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: CustomColors.eventsColor),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: CustomColors.buttonColor),
                  child: const Text('Logout'),
                ),
              ],
            );
          },
        ) ??
        false;
  }
}
