import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/controllers/contacts_controller.dart';
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
    // getting contacts controller
    UserContactController contactController = Get.find<UserContactController>();

    return SafeArea(
      child: Scaffold(
          backgroundColor: CustomColors.backgroundColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                firstName: user.firstName,
                gender: user.gender,
                token: user.token,
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
              Obx(
                () => contactController.userContacts.isNotEmpty
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.11,
                        child: Align(
                          alignment: Alignment.center,
                          child: ListView.builder(
                            itemBuilder: (context, idx) {
                              return ContactTile(
                                label:
                                    "${contactController.userContacts[idx].firstName[0]}${contactController.userContacts[idx].lastName[0]}",
                                idx: idx,
                                sizes: 25,
                                redirectionPage: ContactDetails(
                                  user: contactController.userContacts[idx],
                                ),
                              );
                            },
                            itemCount: contactController.userContacts.length,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      )
                    : const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "Non Yet",
                              style: TextStyle(
                                color: CustomColors.textColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                "🥲",
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.21,
                child: RecentNotificationsPage(userToken: user.token,),
              ),
            ],
          )),
    );
  }
}
