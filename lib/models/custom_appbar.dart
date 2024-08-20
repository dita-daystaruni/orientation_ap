import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
      ),
      child: ListTile(
        leading: Image.asset(
          "assets/images/profile.png",
          height: 60,
        ),
        title: const Text(
          "Hello Maycy",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        trailing: const Icon(Icons.notifications_outlined),
      ),
    );
  }
}
