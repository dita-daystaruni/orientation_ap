import 'package:flutter/material.dart';

class ContactTile extends StatelessWidget {
  final String label;
  final String? name;
  final String? contact;

  ContactTile({super.key, required this.label, this.name, this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                child: Text(label),
              ),
              const SizedBox(
                height: 18,
              ),
              name != null ? Text(name!) : const Text(''),
              const SizedBox(
                height: 18,
              ),
              contact != null ? Text(contact!) : const Text(''),
            ],
          ),
        ),
      ),
    );
  }
}
