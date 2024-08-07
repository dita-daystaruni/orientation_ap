import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:orientation_app/models/notificationslide.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: IconButton(
                icon: const Icon(
                  Icons.navigate_before,
                  size: 30,
                ),
                onPressed: () {
                  Get.offNamed('/landing_page');
                },
              ),
              title: Text(
                'Notifications',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              //trailing: const Icon(Icons.edit),
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            const NotificationSlide(
                title: 'Notification title',
                contents:
                    'Lorem ipsum dolor sit amet,consectetur adipiscing elit pulor por'),
            const Divider(),
            const NotificationSlide(
                title: 'Notification title',
                contents:
                    'Lorem ipsum dolor sit amet,consectetur adipiscing elit pulor por'),
            const Divider(),
          ],
        ),
      )),
    );
  }
}
