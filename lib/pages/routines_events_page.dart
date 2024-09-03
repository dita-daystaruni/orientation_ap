import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/controllers/activites_session_controller.dart';
import 'package:orientation_app/widgets/upcoming_acitivity.dart';

class Routines extends StatelessWidget {
  const Routines({super.key});
  static const List<Tab> myTabs = <Tab>[
    Tab(text: "Routines"),
    Tab(text: 'Session'),
  ];

  @override
  Widget build(BuildContext context) {
    ActivitySessionController activitySessionController =
        Get.find<ActivitySessionController>();

    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        backgroundColor: CustomColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: CustomColors.backgroundColor,
          title: const Center(
            child: Text(
              "Routines & Sessions",
              style: TextStyle(
                color: CustomColors.textColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          bottom: const TabBar(
            padding: EdgeInsets.all(8.0),
            indicatorColor: CustomColors.buttonColor,
            dividerColor: CustomColors.indicatorColor,
            labelColor: CustomColors.buttonColor,
            labelStyle: TextStyle(
              color: CustomColors.textColor,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            overlayColor: WidgetStatePropertyAll(
              CustomColors.hoverColor,
            ),
            tabs: myTabs,
          ),
          automaticallyImplyLeading: false,
        ),
        body: TabBarView(children: [
          // routines tab view
          Column(
            children: [
              Obx(
                () => activitySessionController.dayTiles.isNotEmpty
                    ?
                    // day tiles for showing dates
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.19,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return activitySessionController.dayTiles[index];
                          },
                          itemCount: activitySessionController.dayTiles.length,
                        ),
                      )
                    : const Text("Where are the days"),
              ),
              // list of activities
              Obx(
                () => activitySessionController.dayActivities.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return RoutinesEventsTiles(
                              eventTitle: activitySessionController
                                  .dayActivities[index].title,
                              eventLocation: activitySessionController
                                  .dayActivities[index].location,
                              eventDesc: activitySessionController
                                  .dayActivities[index].description,
                              startTime: activitySessionController
                                  .dayActivities[index].startTime,
                              endTime: activitySessionController
                                  .dayActivities[index].endTime,
                              isSesion: false,
                            );
                          },
                          itemCount:
                              activitySessionController.dayActivities.length,
                        ),
                      )
                    : Column(
                        children: [
                          Lottie.asset(
                            "assets/lotties/error.json",
                          ),
                          const Text(
                            "NO ACTIVITIES YET",
                            style: TextStyle(
                              color: CustomColors.secondaryTextColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
              ),
            ],
          ),
          Column(
            children: [
              Obx(
                () => activitySessionController.dayTiles.isNotEmpty
                    ?
                    // day tiles for showing dates
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.19,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return activitySessionController.dayTiles[index];
                          },
                          itemCount: activitySessionController.dayTiles.length,
                        ),
                      )
                    : const Text("Where are the days?"),
              ),
              // list of sessions
              Obx(
                () => activitySessionController.daySessions.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return RoutinesEventsTiles(
                              eventTitle: activitySessionController
                                  .daySessions[index].title,
                              eventLocation: activitySessionController
                                  .daySessions[index].location,
                              eventDesc: activitySessionController
                                  .daySessions[index].description,
                              startTime: activitySessionController
                                  .daySessions[index].startTime,
                              endTime: activitySessionController
                                  .daySessions[index].endTime,
                              isSesion: true,
                            );
                          },
                          itemCount:
                              activitySessionController.daySessions.length,
                        ),
                      )
                    : Column(
                        children: [
                          Lottie.asset(
                            "assets/lotties/error.json",
                          ),
                          const Text(
                            "NO SESSIONS YET",
                            style: TextStyle(
                              color: CustomColors.secondaryTextColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
