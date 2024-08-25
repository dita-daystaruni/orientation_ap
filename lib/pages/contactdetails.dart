import 'package:flutter/material.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/widgets/text_icon.dart';

class ContactDetails extends StatelessWidget {
  const ContactDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: CustomColors.backgroundColor,
        automaticallyImplyLeading: true,
      ),
      body: const Center(
        child: Column(
          children: [
            CircleAvatar(
              maxRadius: 70,
              backgroundColor: Color.fromRGBO(49, 125, 137, 1),
              child: Text(
                'MN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 16.0,
                bottom: 8.0,
              ),
              child: Text(
                'Name',
                style: TextStyle(
                  color: CustomColors.textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 8.0,
              ),
              child:  Text(
                'Title',
                style: TextStyle(
                  color: CustomColors.thirdTextColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 32.0,
              ),
              child: Text(
                'Description',
                style: TextStyle(
                  color: CustomColors.thirdTextColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            IntrinsicWidth(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: CustomTextIcon(
                  label: Text(
                    "+2547 12 345 678",
                    style: TextStyle(
                      color: CustomColors.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                  trailingIcon: Icon(
                    Icons.phone,
                    color: CustomColors.buttonColor,
                  ),
                ),
              ),
            ),
            IntrinsicWidth(
              child: CustomTextIcon(
                label: Text(
                  "ko@daystar.ac.ke",
                  style: TextStyle(
                    color: CustomColors.textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
                trailingIcon: Icon(
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
