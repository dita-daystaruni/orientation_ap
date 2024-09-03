import 'package:flutter/material.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/utils/custom_date_parser.dart';
import 'package:orientation_app/widgets/events_tile.dart';

class UpcomingActivity extends StatelessWidget {
  const UpcomingActivity({
    super.key,
    required this.activityName,
    required this.location,
    required this.eventDescription,
    required this.isSession,
    required this.startTime,
    required this.endTime,
  });

  final String location;
  final String activityName;
  final String eventDescription;
  final String startTime;
  final String endTime;
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
          EventsTile(
            eventLocation: location,
            eventtitle: activityName.length > 25
                ? activityName.substring(0, 25)
                : activityName,
            eventDesc: eventDescription,
            isSession: isSession,
            timePeriod:
                "${CustomDateParser.convertToAmPm(startTime)}-${CustomDateParser.convertToAmPm(endTime)}",
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
    required this.startTime,
    required this.endTime,
    this.isSesion = false,
  });

  final String eventLocation;
  final String eventTitle;
  final String eventDesc;
  final String startTime;
  final String endTime;
  final bool isSesion;

  @override
  Widget build(BuildContext context) {
    // changing start and end times to AM/PM
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
            timePeriod:
                "${CustomDateParser.convertToAmPm(startTime)}-${CustomDateParser.convertToAmPm(endTime)}",
            isSession: isSesion,
          ),
        ],
      ),
    );
  }
}
