import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/widgets/eventnotification.dart';

class RecentNotificationsPage extends StatelessWidget {
  const RecentNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Text(
                "Recent notifications",
                style: TextStyle(
                  color: CustomColors.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: TextButton(
                child: const Text(
                  "See all",
                  style: TextStyle(
                    color: CustomColors.highlightedTextColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                onPressed: () => Get.toNamed('/notifications'),
              ),
            ),
          ],
        ),
        // TODO fix spacing
        const SizedBox(
          height: 10,
        ),
        // Wrapping the notifications section in a SingleChildScrollView
        const Expanded(
          child: SingleChildScrollView(
            child: Homepagenotifications(),
          ),
        ),
      ],
    );
  }
}

class Homepagenotifications extends StatelessWidget {
  const Homepagenotifications({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NotificationCard(
            senderName: 'Senders-Name',
            title: 'Notification Title',
            content:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit pulor por',
            onSeeMore: () {
              Get.toNamed('/notifications');
            }),
        const EventsNotification(
          event: 'Event name',
          content:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit pulor por',
        ),
        NotificationCard(
            senderName: 'Senders-Name',
            title: 'Notification Title',
            content:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit pulor por',
            onSeeMore: () {
              Get.toNamed('/notifications');
            })
      ],
    );
  }
}

// TODO make this one card for modularity
class NotificationCard extends StatelessWidget {
  final String senderName;
  final String title;
  final String content;
  final VoidCallback onSeeMore;

  const NotificationCard({
    super.key,
    required this.senderName,
    required this.title,
    required this.content,
    required this.onSeeMore,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColors.backgroundColor,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.circle_notifications_rounded,
              size: 45,
              color: CustomColors.buttonColor,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4.0),
                  RichText(
                    text: TextSpan(
                      text: content,
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: ' See more',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: CustomColors.buttonColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                          recognizer: TapGestureRecognizer()..onTap = onSeeMore,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
