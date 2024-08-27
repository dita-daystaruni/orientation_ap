import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/controllers/activites_session_controller.dart';
import 'package:orientation_app/controllers/routes_sessions_controllers.dart';
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
    // TODO chech the need for this controller
    // putting routines and sessions controllers
    RoutesSessionsControllers routesSessionsControllers =
        Get.put(RoutesSessionsControllers());

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
                () =>
                    // day tiles for showing dates
                    SizedBox(
                  height: MediaQuery.of(context).size.height * 0.19,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return routesSessionsControllers.dayActivities[index];
                    },
                    itemCount: routesSessionsControllers.dayActivities.length,
                  ),
                ),
              ),
              // list of activities
              Obx(
                () => activitySessionController.activities.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return RoutinesEventsTiles(
                              eventTitle: activitySessionController
                                  .activities[index].title,
                              eventLocation: activitySessionController
                                  .activities[index].location,
                              eventDesc: activitySessionController
                                  .activities[index].description,
                            );
                          },
                          itemCount:
                              activitySessionController.activities.length,
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
                () =>
                    // day titles for showing dates
                    SizedBox(
                  height: MediaQuery.of(context).size.height * 0.19,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return routesSessionsControllers.dayActivities[index];
                    },
                    itemCount: routesSessionsControllers.dayActivities.length,
                  ),
                ),
              ),
              // list of sessions
              Obx(
                () => activitySessionController.sessions.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return RoutinesEventsTiles(
                              eventTitle: activitySessionController
                                  .sessions[index].title,
                              eventLocation: activitySessionController
                                  .sessions[index].location,
                              eventDesc: activitySessionController
                                  .sessions[index].description,
                              isSesion: true,
                            );
                          },
                          itemCount: activitySessionController.sessions.length,
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
