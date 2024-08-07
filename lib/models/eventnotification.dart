import 'package:flutter/material.dart';

class EventsNotification extends StatelessWidget {
  final String event;
  final String content;
  const EventsNotification(
      {super.key, required this.event, required this.content});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        'assets/images/notify.png',
        height: 80,
      ),
      title: Text(
        event,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(content),
      // trailing: ,
    );
  }
}
