import 'package:flutter/material.dart';
import 'package:orientation_app/pages/profile.dart';

class ContactDetails extends StatelessWidget {
  const ContactDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              maxRadius: 130,
              backgroundColor: Color.fromRGBO(49, 125, 137, 1),
              child: Text(
                'Name',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              'Name',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 18,
            ),
            const Text(
              'Title',
              style: TextStyle(fontWeight: FontWeight.w200),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Description',
              style: TextStyle(fontWeight: FontWeight.w200),
            ),
            const SizedBox(
              height: 20,
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
      ),
    );
  }
}
