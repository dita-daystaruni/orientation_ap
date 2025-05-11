import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/controllers/activities_controller.dart';
import 'package:orientation_app/models/activity_session_model.dart';
import 'package:orientation_app/pages/view_activity_page.dart';

class OngoingActivityWidget extends StatelessWidget {
  const OngoingActivityWidget({super.key, required this.activity});
  final ActivityModel activity;

  @override
  Widget build(BuildContext context) {
    final ActivityController activityController =
        Get.find<ActivityController>();
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewActivityPage(
              activity: activity,
              venues: activity.isMultiple
                  ? activityController.extractSubEvents(
                      activity.venue,
                    )
                  : null,
            ),
          ),
        );
      },
      child: Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Column(
          children: [
            Card(
              elevation: 0,
              color: Theme.of(context).colorScheme.surface,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          const Icon(Icons.people_alt_rounded),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Ongoing Activity",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      activity.title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      activity.isMultiple
                          ? "Multiple Venues..."
                          : activity.venue,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                "From: ${activity.from.toString().split(" ")[1].substring(0, 5)}",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  "To: ${activity.to.toString().split(" ")[1].substring(0, 5)}",
                                  style: Theme.of(context).textTheme.labelLarge,
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
              child:
                  activityController.ongoingAndUpcomingActivity["upcoming"] ==
                          null
                      ? const Text("No Upcoming Activity")
                      : Text(
                          "Upcoming Activity: ${activityController.ongoingAndUpcomingActivity["upcoming"]!.title}",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
            )
          ],
        ),
      ),
    );
  }
}
