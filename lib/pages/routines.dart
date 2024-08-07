import 'package:flutter/material.dart';
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
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      'Routine',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white),
                    ),
                    child: const Text(
                      "Routine",
                      style: TextStyle(color: Colors.blue),
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
                children: [
                  //card1
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('Mon'),
                          Text('17th'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //card 2
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('Tue'),
                          Text('18th'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('Wed'),
                          Text('19th'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('Thur'),
                          Text('20th'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('Fri'),
                          Text('21st'),
                        ],
                      ),
                    ),
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
