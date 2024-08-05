import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const ListTile(
              trailing: Icon(Icons.notifications),
            ),
            Image.asset(
              'assets/images/profile.png',
              height: 150,
            ),
            Text(
              'John Kamau',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Family',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            const CircleAvatar(
              child: Text('MN'),
            ),
            const Spacer(),
            OutlinedButton(
              onPressed: () {
                const AboutDialog(
                  applicationLegalese: 'Are you sure?',
                  applicationName: 'Confrim Action',
                  applicationIcon: Icon(Icons.logout_outlined),
                );
              },
              style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(Colors.blue)),
              child: const Text(
                'Log Out',
                style: TextStyle(),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
