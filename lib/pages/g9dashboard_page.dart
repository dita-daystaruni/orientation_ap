import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/controllers/activites_session_controller.dart';
import 'package:orientation_app/controllers/contacts_controller.dart';
import 'package:orientation_app/controllers/statistic_controller.dart';
import 'package:orientation_app/models/user_model.dart';
import 'package:orientation_app/pages/g9_family_view_page.dart';
import 'package:orientation_app/pages/statistics_page.dart';
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
    UserContactController contactController = Get.find<UserContactController>();
    StatisticsController statisticsController =
        Get.find<StatisticsController>();
    ActivitySessionController activitySessionController =
        Get.find<ActivitySessionController>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.backgroundColor,
        body: Column(
          children: [
            CustomAppBar(
              firstName: user.firstName,
              gender: user.gender,
              isG9: true,
              canEdit: true,
              token: user.token,
            ),
            // statistics page
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 8.0,
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.30,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        bottom: 8.0,
                        left: 4.0,
                        right: 4.0,
                      ),
                      child: GestureDetector(
                        onTap: () => Get.to(
                          StatisticsPage(
                            userToken: user.token,
                          ),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.44,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: CustomColors.iconColorOne,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Statistics",
                                style: TextStyle(
                                  color: CustomColors.textColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              Obx(
                                () => Text(
                                  '${statisticsController.totalStudents}',
                                  style: const TextStyle(
                                    color: CustomColors.textColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 64,
                                  ),
                                ),
                              ),
                              const Text(
                                "New Students",
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
                        width: MediaQuery.of(context).size.width * 0.44,
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
                            Obx(
                              () => contactController.userContacts.isNotEmpty
                                  ? Expanded(
                                      child: GridView.builder(
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 0,
                                          mainAxisSpacing: 5,
                                        ),
                                        itemBuilder: (context, idx) {
                                          return ContactTile(
                                            label:
                                                '${contactController.userContacts[idx].firstName[0]}${contactController.userContacts[idx].lastName[0]}',
                                            name: contactController
                                                .userContacts[idx].firstName,
                                            idx: idx,
                                            sizes: 23,
                                            redirectionPage: G9FamilyViewPage(
                                              parent: contactController
                                                  .userContacts[idx],
                                              token: user.token,
                                            ),
                                          );
                                        },
                                        itemCount: contactController
                                            .userContacts.length,
                                        scrollDirection: Axis.vertical,
                                      ),
                                    )
                                  : const Column(
                                      children: [
                                        Text(
                                          "🥲",
                                          style: TextStyle(
                                            fontSize: 40,
                                          ),
                                        ),
                                        Text(
                                          "NO FAMILIES YET",
                                          style: TextStyle(
                                            color: CustomColors.textColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Obx(
              () => activitySessionController.upcomingActivity.value != null
                  ? UpcomingActivity(
                      activityName: activitySessionController
                          .upcomingActivity.value!.title,
                      eventDescription: activitySessionController
                          .upcomingActivity.value!.description,
                      isSession: activitySessionController
                          .upcomingActivity.value!.isSession,
                      location: activitySessionController
                          .upcomingActivity.value!.location,
                      startTime: activitySessionController
                          .upcomingActivity.value!.startTime,
                      endTime: activitySessionController
                          .upcomingActivity.value!.endTime,
                    )
                  : SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.10,
                            child: Lottie.asset(
                              "assets/lotties/error.json",
                              fit: BoxFit.fill,
                            ),
                          ),
                          const Text(
                            "No Upcoming Activity",
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.37,
              child: RecentNotificationsPage(
                isG9: true,
                canEdit: true,
                userToken: user.token,
              ),
            )
          ],
        ),
      ),
    );
  }
}
