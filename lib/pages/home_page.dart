import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/models/custom_appbar.dart';
import 'package:orientation_app/models/eventnotification.dart';
import 'package:orientation_app/models/g9dashb.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            const SizedBox(height: 20),
            const G9dashboard(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Recent notifications",
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: TextButton(
                    child: const Text(
                      "See all",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.blue,
                      ),
                    ),
                    onPressed: () => Get.toNamed('/notifications'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Wrapping the notifications section in a SingleChildScrollView
            const Expanded(
              child: SingleChildScrollView(
                child: Homepagenotifications(),
              ),
            ),
          ],
        ),
      ),
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
        const Card(
          child: EventsNotification(
            event: 'Event name',
            content:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit pulor por',
          ),
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
              color: Colors.blue,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(senderName,
                      style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 4.0),
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
                              Theme.of(context).textTheme.bodyText2?.copyWith(
                                    color: Colors.blue,
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
