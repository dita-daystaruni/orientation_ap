import 'package:flutter/material.dart';
import 'package:orientation_app/constants/custom_colors.dart';

// notification for events
class EventsNotification extends StatelessWidget {
  final String event;
  final String content;
  const EventsNotification(
      {super.key, required this.event, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColors.backgroundColor,
      elevation: 2.0,
      child: ListTile(
        leading: Image.asset(
          'assets/images/notify.png',
          height: 80,
        ),
        // isThreeLine: true,
        title: Text(
          event,
          style: const TextStyle(
            color: CustomColors.textColor,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          content,
          style: TextStyle(
            color: CustomColors.secondaryTextColor,
            fontWeight: FontWeight.w300,
            fontSize: 14,
          ),
        ),
        // trailing: ,
      ),
    );
  }
}
