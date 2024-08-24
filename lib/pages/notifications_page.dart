import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/pages/add_notifications_page.dart';
import 'package:orientation_app/widgets/notificationslide.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({
    super.key,
    this.canEdit = false,
    this.isG9 = false,
  });

  final bool canEdit;
  final bool isG9;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: CustomColors.backgroundColor,
          title: const Text(
            'Send Notifications',
            style: TextStyle(
              color: CustomColors.textColor,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          actions: canEdit
              ? [
                  IconButton(
                    onPressed: () {
                      Get.to(
                        AddNotificationsPage(
                          isG9: isG9,
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit_notifications_outlined),
                  ),
                ]
              : null,
          centerTitle: true,
          automaticallyImplyLeading: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return const NotificationSlide(
                title: "Notification Title",
                contents:
                    "Luch will be at 4pm sorry for delay",
                time: "8:00",
              );
            },
            itemCount: 10,
          ),
        ));
  }
}
