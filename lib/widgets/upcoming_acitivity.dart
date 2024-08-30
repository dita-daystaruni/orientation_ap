import 'package:flutter/material.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/widgets/events_tile.dart';

class UpcomingActivity extends StatelessWidget {
  const UpcomingActivity({
    super.key,
    required this.activityName,
    required this.location,
    required this.eventDescription,
    required this.isSession,
  });

  final String location;
  final String activityName;
  final String eventDescription;
  final bool isSession;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Upcoming activity",
            style: TextStyle(
              color: CustomColors.textColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.start,
          ),
          const Divider(),
          // TODO passing event time
          EventsTile(
            eventLocation: location,
            eventtitle: activityName,
            eventDesc: eventDescription,
            isSession: isSession,
            timePeriod: "8:00AM-10:00AM",
            showTimePeriod: false,
          ),
        ],
      ),
    );
  }
}

class RoutinesEventsTiles extends StatelessWidget {
  const RoutinesEventsTiles({
    super.key,
    required this.eventLocation,
    required this.eventDesc,
    required this.eventTitle,
    this.isSesion = false,
  });

  final String eventLocation;
  final String eventTitle;
  final String eventDesc;
  final bool isSesion;
  // TODO time of events format
  // final String timePeriod;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 0.0,
      ),
      child: Column(
        children: [
          const Divider(
            color: CustomColors.indicatorColor,
          ),
          EventsTile(
            eventLocation: eventLocation,
            eventDesc: eventDesc,
            eventtitle: eventTitle,
            timePeriod: "8:00AM-10:00AM",
            isSession: isSesion,
          ),
        ],
      ),
    );
  }
}
