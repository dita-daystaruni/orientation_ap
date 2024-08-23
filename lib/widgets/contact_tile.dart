import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/pages/contactdetails.dart';

class ContactTile extends StatelessWidget {
  const ContactTile({
    super.key,
    required this.label,
    this.name,
    this.contact,
    this.title,
    required this.idx,
    required this.sizes,
    required this.redirectionPage,
  });

  final String label;
  final String? name;
  final String? contact;
  final int idx;
  final String? title;
  final double sizes;
  final Widget redirectionPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 8),
      child: GestureDetector(
        onTap: () => Get.to(redirectionPage),
        child: Column(
          children: [
            CircleAvatar(
              radius: sizes,
              backgroundColor: idx % 2 == 0
                  ? CustomColors.iconColorOne
                  : CustomColors.iconColorTwo,
              child: Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: sizes,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            name != null
                ? Text(
                    name!,
                    style: TextStyle(
                      color: CustomColors.textColor,
                      fontSize: sizes,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                : const Text(
                    "Title",
                    style: TextStyle(
                      color: CustomColors.thirdTextColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

// example contact list
var contacts = const [
  ContactTile(
    label: "RM",
    idx: 0,
    sizes: 20,
    redirectionPage: ContactDetails(),
  ),
  ContactTile(
    label: "RM",
    idx: 1,
    sizes: 20,
    redirectionPage: ContactDetails(),
  ),
  ContactTile(
    label: "RM",
    idx: 2,
    sizes: 20,
    redirectionPage: ContactDetails(),
  ),
  ContactTile(
    label: "RM",
    idx: 3,
    sizes: 20,
    redirectionPage: ContactDetails(),
  ),
  ContactTile(
    label: "RM",
    idx: 4,
    sizes: 20,
    redirectionPage: ContactDetails(),
  ),
  ContactTile(
    label: "RM",
    idx: 5,
    sizes: 20,
    redirectionPage: ContactDetails(),
  ),
  ContactTile(
    label: "RM",
    idx: 6,
    sizes: 20,
    redirectionPage: ContactDetails(),
  ),
  ContactTile(
    label: "RM",
    idx: 7,
    sizes: 20,
    redirectionPage: ContactDetails(),
  ),
  ContactTile(
    label: "RM",
    idx: 8,
    sizes: 20,
    redirectionPage: ContactDetails(),
  )
];
