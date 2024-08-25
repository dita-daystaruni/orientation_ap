import 'package:flutter/material.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/models/user_model.dart';
import 'package:orientation_app/pages/contactdetails.dart';
import 'package:orientation_app/widgets/contact_tile.dart';
import 'package:orientation_app/widgets/custom_appbar.dart';
import 'package:orientation_app/widgets/ongoing_activity.dart';
import 'package:orientation_app/widgets/recentnotifications.dart';
import 'package:orientation_app/widgets/upcoming_acitivity.dart';

class FreshmanDashboardPage extends StatelessWidget {
  const FreshmanDashboardPage({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              firstName: user.firstName,
            ),
            const OngoingActivity(),
            const UpcomingActivity(),
            const Padding(
              padding: EdgeInsets.only(
                left: 8.0,
                bottom: 4.0,
              ),
              child: Text(
                "Contacts",
                style: TextStyle(
                  color: CustomColors.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.11,
              child: Align(
                alignment: Alignment.center,
                child: ListView.builder(
                  itemBuilder: (context, idx) {
                    return ContactTile(
                      label: "MN",
                      idx: idx,
                      sizes: 25,
                      redirectionPage: const ContactDetails(),
                    );
                  },
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.13,
              child: const RecentNotificationsPage(),
            ),
          ],
        ));
  }
}
