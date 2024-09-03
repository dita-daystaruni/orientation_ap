import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/controllers/activites_session_controller.dart';
import 'package:orientation_app/controllers/parent_contact_controller.dart';
import 'package:orientation_app/models/user_model.dart';
import 'package:orientation_app/pages/student_details_page.dart';
import 'package:orientation_app/widgets/contact_tile.dart';
import 'package:orientation_app/widgets/custom_appbar.dart';
import 'package:orientation_app/widgets/ongoing_activity.dart';
import 'package:orientation_app/widgets/recentnotifications.dart';

class ParentDashboardPage extends StatelessWidget {
  const ParentDashboardPage({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    // Getting controllers
    ActivitySessionController activitySessionController =
        Get.find<ActivitySessionController>();
    ParentContactController parentContactController =
        Get.put(ParentContactController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
                firstName: user.firstName,
                gender: user.gender,
                isG9: false,
                canEdit: true,
                token: user.token),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(
                () => activitySessionController.ongoingActivity.value != null
                    ? OngoingActivity(
                        activityName: activitySessionController
                            .ongoingActivity.value!.title,
                        location: activitySessionController
                            .ongoingActivity.value!.location,
                        startTime: activitySessionController
                            .ongoingActivity.value!.startTime,
                        endTime: activitySessionController
                            .ongoingActivity.value!.endTime,
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Lottie.asset(
                              "assets/lotties/error.json",
                              fit: BoxFit.fill,
                            ),
                          ),
                          const Text(
                            "No Ongoing Activity",
                            style: TextStyle(
                              color: CustomColors.secondaryTextColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Family members",
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
                      label: '${parentContactController.parentContacts[idx].firstName[0]}${parentContactController.parentContacts[idx].lastName[0]}',
                      idx: idx,
                      sizes: 25,
                      redirectionPage: StudentDetailsPage(
                        student: parentContactController.parentContacts[idx],
                      ),
                    );
                  },
                  itemCount: parentContactController.parentContacts.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.28,
              child: RecentNotificationsPage(
                userToken: user.token,
                canEdit: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
