import 'package:flutter/material.dart';

class EventsTile extends StatelessWidget {
  final String time;
  final String eventtitle;
  final String eventdesc;
  //constructor
  const EventsTile({
    super.key,
    required this.time,
    required this.eventdesc,
    required this.eventtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Divider(),
        Text(time),
        const SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              eventtitle,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              eventdesc,
              style: const TextStyle(
                fontStyle: FontStyle.normal,
              ),
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.navigate_next),
          onPressed: () {},
        ),
        const Divider(),
      ],

    );
  }
}
