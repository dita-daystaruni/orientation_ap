import 'package:flutter/material.dart';
import 'package:orientation_app/constants.dart/custom_colors.dart';
import 'package:orientation_app/widgets/events_tile.dart';

class UpcomingActivity extends StatelessWidget {
  const UpcomingActivity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Upcoming activity",
            style: TextStyle(
              color: CustomColors.textColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.start,
          ),
          Divider(),
          EventsTile(
            eventdesc: 'Location',
            eventtitle: 'Activity name',
          ),
        ],
      ),
    );
  }
}
