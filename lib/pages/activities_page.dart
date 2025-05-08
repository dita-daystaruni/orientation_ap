import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/controllers/activities_controller.dart';
import 'package:orientation_app/pages/view_activity_page.dart';
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
              title: Text("Activities"),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(12),
              sliver: MultiSliver(
                children: [
                  Obx(
                    () => Card(
                      color: Theme.of(context).colorScheme.tertiaryContainer,
                      child: Column(
                        children: [
                          Card(
                            color: Theme.of(context).colorScheme.surface,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                18.0,
                                12.0,
                                12.0,
                                12.0,
                              ),
                              child: activityController
                                              .ongoingAndUpcomingActivity[
                                          "ongoing"] ==
                                      null
                                  ? const Text("No Ongoing Activity")
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                            0.0,
                                            8.0,
                                            8.0,
                                            22.0,
                                          ),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                  Icons.people_alt_rounded),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  "Ongoing Activity",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          activityController
                                                      .ongoingAndUpcomingActivity[
                                                          "ongoing"]!
                                                      .title
                                                      .length >
                                                  24
                                              ? activityController
                                                  .ongoingAndUpcomingActivity[
                                                      "ongoing"]!
                                                  .title
                                                  .substring(0, 26)
                                              : activityController
                                                  .ongoingAndUpcomingActivity[
                                                      "ongoing"]!
                                                  .title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall,
                                        ),
                                        Text(
                                          activityController
                                                  .ongoingAndUpcomingActivity[
                                                      "ongoing"]!
                                                  .isMultiple
                                              ? "Multiple Venues..."
                                              : activityController
                                                  .ongoingAndUpcomingActivity[
                                                      "ongoing"]!
                                                  .venue,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16.0),
                                          child: Row(
                                            children: [
                                              DecoratedBox(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(12),
                                                  ),
                                                  border: Border.all(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .outline,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(6.0),
                                                  child: Text(
                                                    "From: ${activityController.ongoingAndUpcomingActivity["ongoing"]!.from.toString().split(" ")[1].substring(0, 5)}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelLarge,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: DecoratedBox(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(12),
                                                    ),
                                                    border: Border.all(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .outline,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            6.0),
                                                    child: Text(
                                                      "To: ${activityController.ongoingAndUpcomingActivity["ongoing"]!.to.toString().split(" ")[1].substring(0, 5)}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelLarge,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                            ),
                            child: activityController
                                            .ongoingAndUpcomingActivity[
                                        "upcoming"] ==
                                    null
                                ? const Text("No Upcoming Activity")
                                : Text(
                                    "Upcoming Activity: ${activityController.ongoingAndUpcomingActivity["upcoming"]!.title}",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(12),
              sliver: MultiSliver(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Obx(
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
                        final dates =
                            activityController.pastAndTodayAct.keys.toList();
                        return ListView.builder(
                          reverse: true,
                          itemBuilder: (context, index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  activityController
                                      .getWeekDay(dates[index].weekday),
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemBuilder: (context, idx) => Card(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ViewActivityPage(
                                            activity: activityController
                                                    .pastAndTodayAct[
                                                dates[index]]![idx],
                                            venues: activityController
                                                    .pastAndTodayAct[
                                                        dates[index]]![idx]
                                                    .isMultiple
                                                ? activityController
                                                    .extractSubEvents(
                                                    activityController
                                                        .pastAndTodayAct[
                                                            dates[index]]![idx]
                                                        .venue,
                                                  )
                                                : null,
                                          ),
                                        ),
                                      );
                                    },
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                        border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.6,
                                                  child: Text(
                                                    activityController
                                                        .pastAndTodayAct[
                                                            dates[index]]![idx]
                                                        .title,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium,
                                                    softWrap: true,
                                                  ),
                                                ),
                                                Text(
                                                  "From: ${activityController.pastAndTodayAct[dates[index]]![idx].from.toString().split(" ")[1].substring(0, 5)} To: ${activityController.pastAndTodayAct[dates[index]]![idx].to.toString().split(" ")[1].substring(0, 5)}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                        color: Colors.grey,
                                                      ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 16.0),
                                                  child: Row(
                                                    children: [
                                                      const Icon(Icons.place),
                                                      Text(
                                                        activityController
                                                                .pastAndTodayAct[
                                                                    dates[
                                                                        index]]![
                                                                    idx]
                                                                .isMultiple
                                                            ? "Multiple.."
                                                            : activityController
                                                                .pastAndTodayAct[
                                                                    dates[
                                                                        index]]![
                                                                    idx]
                                                                .venue,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyMedium,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 16.0),
                                            child: CircleAvatar(
                                              maxRadius: 30,
                                              child: Text(
                                                "A",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displaySmall,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
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
                    ),
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
