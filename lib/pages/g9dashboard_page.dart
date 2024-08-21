import 'package:flutter/material.dart';
import 'package:orientation_app/constants.dart/custom_colors.dart';
import 'package:orientation_app/models/user_model.dart';
import 'package:orientation_app/widgets/contact_tile.dart';
import 'package:orientation_app/widgets/custom_appbar.dart';
import 'package:orientation_app/widgets/recentnotifications.dart';
import 'package:orientation_app/widgets/upcoming_acitivity.dart';

class G9DashboardPage extends StatelessWidget {
  const G9DashboardPage({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: Column(
        children: [
          CustomAppBar(
            firstName: user.firstName,
          ),
          // statistics page
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                    left: 4.0,
                    right: 4.0,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.47,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: CustomColors.iconColorOne,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Statistics",
                          style: TextStyle(
                            color: CustomColors.textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "327",
                          style: TextStyle(
                            color: CustomColors.textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 64,
                          ),
                        ),
                        Text("New Students"),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                    left: 0,
                    right: 4.0,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.47,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: CustomColors.iconColorTwo,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Families",
                            style: TextStyle(
                              color: CustomColors.textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 5,
                            ),
                            itemBuilder: (context, idx) {
                              return contacts[idx];
                            },
                            itemCount: 5,
                            scrollDirection: Axis.vertical,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const UpcomingActivity(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: const RecentNotificationsPage(),
          )
        ],
      ),
    );
  }
}
