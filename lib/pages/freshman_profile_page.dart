import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/constants/custom_icons/custom_icons.dart';
import 'package:orientation_app/models/user_model.dart';
import 'package:orientation_app/pages/notifications_page.dart';
import 'package:orientation_app/pages/splash_screen.dart';
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
            Get.to(
              NotificationsPage(
                userToken: user.token,
              ),
            );
          },
          icon: const Icon(
            Icons.notifications_outlined,
            color: CustomColors.textColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              // TODO ask user if they are sure
              // clears shared prefs
              await logOutUser();
              // get user back to the beginning
              Get.offAll(const SplashScreen());
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
                    const Padding(
                      padding: EdgeInsets.only(
                        bottom: 12.0,
                        left: 20.0,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Parent phone: ',
                            style: TextStyle(
                              color: CustomColors.textColor,
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                          // TODO parents phone number
                          CustomTextIcon(
                            trailingIcon: Icon(Icons.phone),
                            label: Text(
                              "+2547 12 345 678",
                              style: TextStyle(
                                color: CustomColors.textColor,
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        bottom: 12.0,
                        left: 20.0,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Parent email: ',
                            style: TextStyle(
                              color: CustomColors.textColor,
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                          // TODO parents email
                          CustomTextIcon(
                            trailingIcon: Icon(
                              Icons.email_outlined,
                            ),
                            label: Text(
                              'user@daystar.ac.ke',
                              style: TextStyle(
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
}
