import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/constants.dart/custom_colors.dart';
import 'package:orientation_app/models/custom_appbar.dart';
import 'package:orientation_app/models/eventnotification.dart';
import 'package:orientation_app/models/freshmandashboard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            const Spacer(),
            const FreshmanDashboard(),
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
    return const Column(
      children: [
        Card(
          surfaceTintColor: CustomColors.backgroundColor,
          color: CustomColors.backgroundColor,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.circle_notifications_rounded,
                  size: 45,
                  color: Colors.blue,
                ),
                SizedBox(width: 10),
                SizedBox(
                  height: 80,
                  width: 320,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Notification Title - Senders_Name",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 15),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit pulor por",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          child: EventsNotification(
            event: 'Event name',
            content:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit pulor por',
          ),
        ),
        Card(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.circle_notifications_rounded,
                  size: 45,
                  color: Colors.blue,
                ),
                SizedBox(width: 10),
                SizedBox(
                  height: 80,
                  width: 320,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Notification Title - Senders_Name",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 15),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit pulor por",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
