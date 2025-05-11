import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:orientation_app/controllers/activities_controller.dart';
import 'package:orientation_app/pages/ongoing_activity_widget.dart';
import 'package:orientation_app/pages/view_activity_page.dart';
import 'package:orientation_app/widgets/activity_card.dart';
import 'package:sliver_tools/sliver_tools.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  final ActivityController activityController = Get.find<ActivityController>();

  // holds todays and past activities
  @override
  void initState() {
    activityController.fetchAllActivities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await activityController.fetchAllActivities();
        },
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              pinned: true,
              floating: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Routines & Activities"),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(12),
              sliver: MultiSliver(
                children: [
                  Obx(
                    () => activityController
                                .ongoingAndUpcomingActivity["ongoing"] ==
                            null
                        ? Column(
                            spacing: 12,
                            children: [
                              Lottie.asset("assets/lotties/plane.json"),
                              Text(
                                "You have no activities for this time period, please refresh after a while",
                                style: Theme.of(context).textTheme.titleLarge,
                            textAlign: TextAlign.center,
                              ),
                            ],
                          )
                        : OngoingActivityWidget(
                            activity: activityController
                                .ongoingAndUpcomingActivity["ongoing"]!,
                          ),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(12),
              sliver: MultiSliver(
                children: [
                  Obx(
                    () {
                      if (activityController.pastAndTodayAct.isEmpty) {
                        return const Column(
                          children: [
                            // ElevatedButton(
                            //   onPressed: () async {
                            //     await activityController
                            //         .createSampleActivities();
                            //   },
                            //   child: const Text("Create Activities"),
                            // ),
                            Text("No Activities"),
                          ],
                        );
                      }
                      final dates = activityController.pastAndTodayAct.keys
                          .toList()
                          .reversed
                          .toList();
                      return SliverList.builder(
                        itemBuilder: (context, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              activityController
                                  .getWeekDay(dates[index].weekday),
                              style: Theme.of(context).textTheme.titleLarge,
                              textAlign: TextAlign.start,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemBuilder: (context, idx) => GestureDetector(
                                onTap: () {},
                                child: ActivityCard(
                                  activity: activityController
                                      .pastAndTodayAct[dates[index]]![idx],
                                ),
                              ),
                              itemCount: activityController
                                  .pastAndTodayAct[dates[index]]!.length,
                            )
                          ],
                        ),
                        itemCount: dates.length,
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
