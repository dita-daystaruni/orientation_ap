import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_outlined)),
              trailing: const Icon(Icons.logout),
            ),
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/images/profile.png',
              height: 150,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'John Kamau',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            //const FamilyList(),
            Text(
              'contact',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Personal Details',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
