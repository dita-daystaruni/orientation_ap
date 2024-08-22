import 'package:flutter/material.dart';
import 'package:orientation_app/constants/custom_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.firstName,
  });

  final String firstName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
      ),
      child: ListTile(
        leading: Image.asset(
          "assets/images/female_student.png",
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
        trailing: const Icon(Icons.notifications_outlined),
      ),
    );
  }
}
