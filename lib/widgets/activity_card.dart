import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:orientation_app/controllers/activities_controller.dart';
import 'package:orientation_app/models/activity_session_model.dart';
import 'package:orientation_app/pages/view_activity_page.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key, required this.activity});
  final ActivityModel activity;

  @override
  Widget build(BuildContext context) {
    final ActivityController activityController =
        Get.find<ActivityController>();
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
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
        isThreeLine: true,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "From ${DateFormat('hh:mm a').format(activity.from)} • To • ${DateFormat('hh:mm a').format(activity.to)} ",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              elevation: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                width: 160,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 4,
                  children: [
                    const CircleAvatar(
                      radius: 12,
                      child: Icon(
                        Icons.location_pin,
                        size: 16,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        activity.isMultiple
                            ? "Mulitple locations"
                            : activity.venue,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        title: Text(activity.title),
        leading: CircleAvatar(
          child: Text(activity.title[0]),
        ),
      ),
    );
  }
}
