import 'package:flutter/material.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/models/parent_contact.dart';
import 'package:orientation_app/utils/custom_url_launchers.dart';
import 'package:orientation_app/widgets/text_icon.dart';

class StudentDetailsPage extends StatelessWidget {
  const StudentDetailsPage({
    super.key,
    required this.student,
  });

  final ParentContact student;

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
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                maxRadius: 75,
                backgroundColor: CustomColors.iconColorTwo,
                child: Text(
                  '${student.firstName[0]}${student.lastName[0]}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 24.0,
                  bottom: 8.0,
                ),
                child: Text(
                  "${student.firstName} ${student.lastName}",
                  style: const TextStyle(
                    color: CustomColors.textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  bottom: 32.0,
                ),
                child: Text(
                  student.admNo,
                  style: const TextStyle(
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    bottom: 16.0,
                  ),
                  child: Text(
                    "Course: ",
                    style: TextStyle(
                      color: CustomColors.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16.0,
                  ),
                  child: Text(
                    softWrap: true,
                    student.course,
                    style: const TextStyle(
                      color: CustomColors.textColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    bottom: 16.0,
                  ),
                  child: Text(
                    "Campus",
                    style: TextStyle(
                      color: CustomColors.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16.0,
                  ),
                  child: Text(
                    student.campus,
                    style: const TextStyle(
                      color: CustomColors.textColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
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
                label: Text(
                  student.phoneNo,
                  style: const TextStyle(
                    color: CustomColors.textColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),
                trailingIcon: IconButton(
                  onPressed: () async {
                    await makePhoneCall(student.phoneNo);
                  },
                  icon: const Icon(
                    Icons.phone,
                    color: CustomColors.buttonColor,
                  ),
                ),
                isNumber: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 0.0,
              ),
              child: CustomTextIcon(
                label: Text(
                  student.email,
                  style: const TextStyle(
                    color: CustomColors.textColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),
                trailingIcon: IconButton(
                  onPressed: () async {
                    await sendEmail(student.email);
                  },
                  icon: const Icon(
                    Icons.email,
                    color: CustomColors.buttonColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
