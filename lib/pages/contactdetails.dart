import 'package:flutter/material.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/models/user_contact.dart';
import 'package:orientation_app/utils/custom_url_launchers.dart';
import 'package:orientation_app/widgets/text_icon.dart';

class ContactDetails extends StatelessWidget {
  const ContactDetails({
    super.key,
    required this.user,
  });

  final UserContact user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: CustomColors.backgroundColor,
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              maxRadius: 70,
              backgroundColor: CustomColors.iconColorTwo,
              child: Text(
                '${user.firstName[0]}${user.lastName[0]}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
                bottom: 8.0,
              ),
              child: Text(
                user.firstName,
                style: const TextStyle(
                  color: CustomColors.textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 8.0,
              ),
              child: Text(
                user.title,
                style: const TextStyle(
                  color: CustomColors.thirdTextColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 32.0,
              ),
              child: Text(
                '${user.firstName} ${user.lastName}',
                style: const TextStyle(
                  color: CustomColors.thirdTextColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            IntrinsicWidth(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: CustomTextIcon(
                    label: Text(
                      user.phoneNo,
                      style: const TextStyle(
                        color: CustomColors.textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    trailingIcon: IconButton(
                      onPressed: () async {
                        makePhoneCall(user.phoneNo);
                      },
                      icon: const Icon(
                        Icons.phone,
                        color: CustomColors.buttonColor,
                      ),
                    )),
              ),
            ),
            IntrinsicWidth(
              child: CustomTextIcon(
                label: Text(
                  user.email,
                  style: const TextStyle(
                    color: CustomColors.textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                trailingIcon: const Icon(
                  Icons.email,
                  color: CustomColors.buttonColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
