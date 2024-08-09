import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:orientation_app/models/daystile.dart';
import 'package:orientation_app/models/events_tile.dart';

class Routines extends StatelessWidget {
  const Routines({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const ListTile(
              trailing: Icon(Icons.notifications_outlined),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    height: 48,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        'Routine',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                  SizedBox(
                    width: 120,
                    height: 48,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        'Events',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //card1
                  DaysTile(day: 'Mon', date: '17'),
                  SizedBox(
                    height: 20,
                  ),
                  DaysTile(day: 'Tue', date: '18'),
                  SizedBox(
                    height: 20,
                  ),
                  DaysTile(day: 'Wed', date: '19'),
                  SizedBox(
                    height: 20,
                  ),
                  DaysTile(day: 'Thur', date: '20'),
                  SizedBox(
                    height: 20,
                  ),
                  DaysTile(day: 'Fri', date: '21'),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            const Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Divider(),
                EventsTile(
                  time: '8:00AM',
                  eventtitle: 'Activity name',
                  eventdesc: 'Location',
                ),
                Divider(),
                EventsTile(
                  time: '10:00AM',
                  eventtitle: 'Activity name',
                  eventdesc: 'Location',
                ),
                Divider(),
                EventsTile(
                    time: '13.00PM',
                    eventtitle: 'Activity name',
                    eventdesc: 'Location'),
                Divider(),
                EventsTile(
                    time: '16.00PM',
                    eventtitle: 'Activity name',
                    eventdesc: 'Location'),
                Divider(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
