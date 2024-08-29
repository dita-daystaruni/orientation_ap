import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/controllers/notifications_controller.dart';
import 'package:orientation_app/pages/add_notifications_page.dart';
import 'package:orientation_app/widgets/notificationslide.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({
    super.key,
    this.canEdit = false,
    this.isG9 = false,
    required this.userToken,
  });

  final bool canEdit;
  final bool isG9;
  final String userToken;

  @override
  Widget build(BuildContext context) {
    final NotificationController notificationController =
        Get.put(NotificationController(userToken));

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
                          userToken: userToken,
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
          child: Obx(() {
            if (notificationController.notifications.isEmpty) {
              return const Center(
                  child: CircularProgressIndicator(
                color: CustomColors.buttonColor,
              ));
            } else {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return NotificationSlide(
                    title: notificationController.notifications[index]["title"],
                    contents: notificationController.notifications[index]
                        ["description"],
                    time: "8:00",
                  );
                },
                itemCount: notificationController.notifications.length,
              );
            }
          }),
        ));
  }
}
