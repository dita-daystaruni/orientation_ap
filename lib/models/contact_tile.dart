import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:orientation_app/pages/contactdetails.dart';

class ContactTile extends StatelessWidget {
  final String label;
  final String? name;
  final String? contact;
  final Color bgColor;

  const ContactTile(
      {super.key,
      required this.label,
      this.name,
      this.contact,
      required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 8, bottom: 8),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Get.to(const ContactDetails());
              },
              child: CircleAvatar(
                maxRadius: 27,
                backgroundColor: bgColor,
                child: Text(
                  label,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            name != null
                ? Text(
                    name!,
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                : const Text(
                    'Title',
                    style: TextStyle(fontWeight: FontWeight.w200),
                  ),
            contact != null
                ? Text(
                    contact!,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.grey),
                  )
                : const Text(''),
          ],
        ),
      ),
    );
  }
}
