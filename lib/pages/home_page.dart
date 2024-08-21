import 'package:flutter/material.dart';
import 'package:orientation_app/widgets/custom_appbar.dart';
import 'package:orientation_app/widgets/recentnotifications.dart';
import 'package:orientation_app/pages/freshman_dashboard_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // The Top Profile Part
            // const CustomAppBar(),
            const SizedBox(height: 20),
            // Spacer(),
            // const FreshmanDashboardPage(),
            // const G9dashboard(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: const RecentNotificationsPage(),
            ),
          ],
        ),
      ),
    );
  }
}
