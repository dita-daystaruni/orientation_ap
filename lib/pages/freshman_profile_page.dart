import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/constants/custom_icons/custom_icons.dart';
import 'package:orientation_app/models/user_model.dart';
import 'package:orientation_app/pages/notifications_page.dart';
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
              const NotificationsPage(),
            );
          },
          icon: const Icon(
            Icons.notifications_outlined,
            color: CustomColors.textColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint("Coming Soon");
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
              'assets/images/profile.png',
              height: MediaQuery.of(context).size.height * 0.2,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 16.0,
              bottom: 8.0,
            ),
            child: Center(
              child: Text(
                'Name',
                style: TextStyle(
                  color: CustomColors.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: 1.0,
                bottom: 16.0,
              ),
              child: Text(
                'Admission Number',
                style: TextStyle(
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
          const Padding(
            padding: EdgeInsets.only(bottom: 12.0),
            child: CustomTextIcon(
              leadingIcon: Icon(
                CustomIcons.graduationcap,
              ),
              label: Text(
                "Course Details",
                style: TextStyle(
                  color: CustomColors.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 12.0),
            child: CustomTextIcon(
              leadingIcon: Icon(Icons.phone),
              label: Text(
                "+2547 12 345 678",
                style: TextStyle(
                  color: CustomColors.textColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 12.0),
            child: CustomTextIcon(
              leadingIcon: Icon(
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
          ),
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
          const Padding(
            padding: EdgeInsets.only(
              bottom: 12.0,
              left: 20.0,
            ),
            child: Row(
              children: [
                Text(
                  'Parent Name: ',
                  style: TextStyle(
                    color: CustomColors.textColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Parent Name',
                  style: TextStyle(
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
      ),
    );
  }
}
