import 'package:flutter/material.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/models/user_contact.dart';
import 'package:orientation_app/pages/student_details_page.dart';
import 'package:orientation_app/utils/custom_url_launchers.dart';
import 'package:orientation_app/widgets/contact_tile.dart';
import 'package:orientation_app/widgets/text_icon.dart';

class G9FamilyViewPage extends StatelessWidget {
  const G9FamilyViewPage({super.key, required this.parent});

  final UserContact parent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: CustomColors.backgroundColor,
        title: Text(
          "Family For ${parent.firstName}",
          style: const TextStyle(
            color: CustomColors.textColor,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 40.0,
          left: 24.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${parent.firstName} ${parent.lastName}",
              style: const TextStyle(
                color: CustomColors.textColor,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 0.0,
              ),
              child: CustomTextIcon(
                  label: Text(
                    parent.phoneNo,
                    style: const TextStyle(
                      color: CustomColors.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  trailingIcon: IconButton(
                    onPressed: () {
                      makePhoneCall(parent.phoneNo);
                    },
                    icon: const Icon(
                      Icons.phone,
                      color: CustomColors.buttonColor,
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 0.0,
              ),
              child: CustomTextIcon(
                label: Text(
                  parent.email,
                  style: const TextStyle(
                    color: CustomColors.textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                trailingIcon: IconButton(
                  onPressed: () {
                    print("pressed");
                    sendEmail("rodney@gmail.com");
                  },
                  icon: const Icon(
                    Icons.email,
                    color: CustomColors.buttonColor,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 32.0,
                bottom: 8.0,
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: 32.0,
                  ),
                  child: Text(
                    'Family members',
                    style: TextStyle(
                      color: CustomColors.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 24,
                ),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                  ),
                  itemBuilder: (context, idx) {
                    return ContactTile(
                      label: "RM",
                      idx: idx,
                      sizes: 30,
                      redirectionPage: const StudentDetailsPage(),
                    );
                  },
                  itemCount: 9,
                  scrollDirection: Axis.vertical,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
