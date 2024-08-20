import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/constants.dart/custom_colors.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: IconButton(
                icon: const Icon(
                  Icons.navigate_before,
                  size: 30,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
              title: Text(
                'Activivty Name',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              //trailing: const Icon(Icons.edit),
            ),
            const Divider(),
            const SizedBox(
              height: 30,
            ),
            Text(
              '8.00 AM',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.place_outlined,
                  color: Colors.blue,
                ),
                Text(
                  "Location",
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              'Description',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "You're just one step away from diving into this incredible journey. At Daystar University, we believe in your potential.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
