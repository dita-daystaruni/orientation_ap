import 'package:flutter/material.dart';
import 'package:orientation_app/models/contact_tile.dart';
import 'package:orientation_app/pages/profile.dart';

class ContactDetails extends StatelessWidget {
  const ContactDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          const ContactTile(
            label: 'KO',
            bgColor: Color.fromRGBO(49, 125, 137, 1),
            name: 'Name',
          ),
          const SizedBox(
            height: 18,
          ),
          TextIcon(
            leadingIcon: null,
            label: '+ 254 712 345 678',
            trailingIcon: Image.asset(
              'assets/images/call.png',
              height: 30,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextIcon(
            label: 'user@daystar.ac.ke',
            trailingIcon:
                Image.asset('assets/images/fluent-emoji-flat_e-mail.png'),
          ),
        ],
      ),
    );
  }
}
