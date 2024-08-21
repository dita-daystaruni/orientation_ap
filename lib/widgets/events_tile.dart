import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/constants.dart/custom_colors.dart';

class EventsTile extends StatelessWidget {
  const EventsTile({
    super.key,
    required this.eventdesc,
    required this.eventtitle,
  });

  final String eventtitle;
  final String eventdesc;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 20,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: CustomColors.iconColorOne,
        ),
      ),
      horizontalTitleGap: 40,
      title: Text(
        eventtitle,
        style: const TextStyle(
          color: CustomColors.textColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Row(
        children: [
          const Icon(
            Icons.place_outlined,
            color: CustomColors.buttonColor,
          ),
          Text(
            eventdesc,
            style: const TextStyle(
              color: CustomColors.secondaryTextColor,
              fontWeight: FontWeight.w300,
              fontSize: 15,
            ),
          )
        ],
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.navigate_next,
          size: 40,
        ),
        onPressed: () {
          Get.toNamed('/activity_page');
        },
      ),
    );
  }
}
