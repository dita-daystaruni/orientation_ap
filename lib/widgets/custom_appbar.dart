import 'package:flutter/material.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/widgets/custom_notification_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.firstName,
    required this.gender,
    required this.token,
    this.isG9 = false,
    this.canEdit = false,
  });

  final String firstName;
  final String gender;
  final String token;
  final bool isG9;
  final bool canEdit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
      ),
      child: ListTile(
          leading: Image.asset(
            gender == "Male"
                ? 'assets/images/profile.png'
                : 'assets/images/female_student.png',
            height: 60,
          ),
          title: Text(
            "Hello $firstName",
            style: const TextStyle(
              color: CustomColors.textColor,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          trailing: CustomNotificationIcon(
            isG9: isG9,
            canEdit: canEdit,
            userToken: token,
          )),
    );
  }
}
