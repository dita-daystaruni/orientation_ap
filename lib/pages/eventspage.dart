import 'package:flutter/material.dart';
import '../models/daystile.dart';
import '../models/events_tile.dart';

class Routines extends StatelessWidget {
  const Routines({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Routines & Events'),
            centerTitle: true,
            bottom: const TabBar(
              tabs: [
                Text(
                  'Routine',
                ),
                Text(
                  'Events',
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Column(
                children: [
                  SingleChildScrollView(
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
                  SizedBox(
                    height: 22,
                  ),
                  Column(
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
              ), //end of first tabview column

              Column(
                children: [Text('hello World!')],
              ), //end of second tabview column
            ],
          ),
        ),
      ),
    );
  }
}
