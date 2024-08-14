import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return InkWell(
      onTap: () {
        Get.toNamed('activity_page');
      },
      child: ListTile(
        leading: Text(
          time,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        horizontalTitleGap: 40,
        title: Text(
          eventtitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Row(
          children: [
            const Icon(
              Icons.place_outlined,
              color: Colors.blue,
            ),
            Text(
              eventdesc,
              style: const TextStyle(fontWeight: FontWeight.w300),
            )
          ],
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.navigate_next,
            size: 30,
          ),
          onPressed: () {
            Get.toNamed('/activity_page');
          },
        ),
      ),
    );
  }
}
