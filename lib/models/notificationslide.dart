import 'package:flutter/material.dart';

class NotificationSlide extends StatelessWidget {
  final String title;
  final String contents;
  const NotificationSlide({
    super.key,
    required this.title,
    required this.contents,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.notifications_none_outlined,
        color: Colors.blue,
        size: 35,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(contents),
      trailing: const Column(
        children: [
          Icon(Icons.navigate_next, color: Colors.blue),
          Spacer(),
          Text('8.00 AM')
        ],
      ),
    );
  }
}
