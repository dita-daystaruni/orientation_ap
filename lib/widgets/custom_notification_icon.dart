import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/pages/notifications_page.dart';

class CustomNotificationIcon extends StatelessWidget {
  const CustomNotificationIcon({
    super.key,
    this.isG9 = false,
    this.canEdit = false,
    required this.userToken,
  });

  final bool isG9;
  final bool canEdit;
  final String userToken;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => Get.to(
              NotificationsPage(
                isG9: isG9,
                canEdit: canEdit,
                userToken: userToken,
              ),
            ),
        icon: const Icon(Icons.notifications_outlined));
  }
}
