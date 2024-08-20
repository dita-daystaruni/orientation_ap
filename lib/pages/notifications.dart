import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orientation_app/constants.dart/custom_colors.dart';
import 'package:orientation_app/models/notificationslide.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: const SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(16.0),
        child: G9Notifications(),
      )),
    );
  }
}

class G9Notifications extends StatelessWidget {
  const G9Notifications({super.key});
  final bool isdropped = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Title'),
        const SizedBox(
          height: 10,
        ),
        const CupertinoTextField(
          textAlign: TextAlign.center,
          placeholder: 'Enter notification title',
        ),
        const SizedBox(
          height: 10,
        ),
        const Text('Description'),
        const SizedBox(
          height: 10,
        ),
        const CupertinoTextField(
          textAlign: TextAlign.center,
          maxLines: 5,
          placeholder:
              'Lorem ipsum dolor sit amet,consectetur adipiscing elit pulor por',
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Text(
              'Who can see?',
              style: TextStyle(color: Colors.grey),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                isdropped ? Icons.keyboard_arrow_down : Icons.navigate_next,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class FreshmanNotifications extends StatelessWidget {
  const FreshmanNotifications({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Divider(),
        SizedBox(
          height: 20,
        ),
        NotificationSlide(
            title: 'Notification title',
            contents:
                'Lorem ipsum dolor sit amet,consectetur adipiscing elit pulor por'),
        Divider(),
        NotificationSlide(
            title: 'Notification title',
            contents:
                'Lorem ipsum dolor sit amet,consectetur adipiscing elit pulor por'),
        Divider(),
      ],
    );
  }
}
