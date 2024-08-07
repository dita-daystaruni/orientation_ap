import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:orientation_app/models/contact_tile.dart';
import 'package:orientation_app/models/custom_appbar.dart';
import 'package:orientation_app/models/eventnotification.dart';
import 'package:orientation_app/models/freshmandashboard.dart';
import 'package:orientation_app/models/g9dashb.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),
              const SizedBox(
                height: 20,
              ),

              const FreshmanDashboard(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      "Recent notifications",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
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
                      onPressed: () => {Get.toNamed('/notifications')},
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.circle_notifications_rounded,
                        size: 45,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 80,
                        width: 320,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Noticication Title - Senders_Name",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet,consectetur adipiscing elit pulor por",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Card(
                child: EventsNotification(
                  event: 'Event name',
                  content:
                      'Lorem ipsum dolor sit amet,consectetur adipiscing elit pulor por',
                ),
              ),
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.circle_notifications_rounded,
                        size: 45,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 80,
                        width: 320,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Noticication Title - Senders_Name",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet,consectetur adipiscing elit pulor por",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //End of card
            ],
          ),
        ),
      ),
    );
  }
}
