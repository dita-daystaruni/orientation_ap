import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

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
                icon: const Icon(Icons.navigate_before),
                onPressed: () {
                  Get.offNamed('/landing_page');
                },
              ),
              title: const Text('Notifications'),
              trailing: const Icon(Icons.edit),
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: IconButton(
                icon: const Icon(Icons.notifications_none_outlined),
                onPressed: () {},
              ),
              title: const Text('Notification title'),
              subtitle: const Text(
                  'Lorem ipsum dolor sit amet,consectetur adipiscing elit pulor por'),
              trailing: const Column(
                children: [
                  Icon(Icons.navigate_next),
                  Spacer(),
                  Text('8.00 AM')
                ],
              ),
            ),
            const Divider(),
            ListTile(
              leading: IconButton(
                icon: const Icon(Icons.notifications_none_outlined),
                onPressed: () {},
              ),
              title: const Text('Notification title'),
              subtitle: const Text(
                  'Lorem ipsum dolor sit amet,consectetur adipiscing elit pulor por'),
              trailing: const Column(
                children: [
                  Icon(Icons.navigate_next),
                  Spacer(),
                  Text('10.00 AM'),
                ],
              ),
            ),
            const Divider(),
          ],
        ),
      )),
    );
  }
}
