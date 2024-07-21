import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15.0,
      ),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: ListTile(
          leading: Image.asset(
            "assets/images/profile.png",
            width: 60,
            height: 60,
          ),
          title: const Text(
            "Hello Maycy",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          trailing: const Icon(Icons.notifications),
        ),
      ),
    );
  }
}