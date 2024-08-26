import 'package:flutter/material.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/utils/custom_url_launchers.dart';
import 'package:orientation_app/widgets/text_icon.dart';

class StudentDetailsPage extends StatelessWidget {
  const StudentDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: CustomColors.backgroundColor,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 8.0,
          left: 24.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                maxRadius: 75,
                backgroundColor: CustomColors.iconColorTwo,
                child: Text(
                  'KO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 24.0,
                  bottom: 8.0,
                ),
                child: Text(
                  "Name",
                  style: TextStyle(
                    color: CustomColors.textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 8.0,
                  bottom: 32.0,
                ),
                child: Text(
                  "Admission Number",
                  style: TextStyle(
                    color: CustomColors.thirdTextColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                bottom: 16.0,
              ),
              child: Text(
                "Personal Details",
                style: TextStyle(
                  color: CustomColors.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                bottom: 16.0,
              ),
              child: Text(
                "Course",
                style: TextStyle(
                  color: CustomColors.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                bottom: 16.0,
              ),
              child: Text(
                "Nairobi Campus",
                style: TextStyle(
                  color: CustomColors.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                bottom: 16.0,
              ),
              child: Text(
                "Contacts:",
                style: TextStyle(
                  color: CustomColors.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 0.0,
              ),
              child: CustomTextIcon(
                  label: const Text(
                    '+ 254 712 345 678',
                    style: TextStyle(
                      color: CustomColors.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  trailingIcon: IconButton(
                    onPressed: () async {
                      await makePhoneCall('+ 254 712 345 678');
                    },
                    icon: const Icon(
                      Icons.phone_callback,
                      color: CustomColors.buttonColor,
                    ),
                  )),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 0.0,
              ),
              child: CustomTextIcon(
                label: Text(
                  'ko@daystar.ac.ke',
                  style: TextStyle(
                    color: CustomColors.textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
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
