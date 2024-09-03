import 'package:flutter/material.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/utils/custom_date_parser.dart';

class OngoingActivity extends StatelessWidget {
  const OngoingActivity({
    super.key,
    required this.activityName,
    required this.location,
    required this.startTime,
    required this.endTime,
  });

  final String activityName;
  final String location;
  final String startTime;
  final String endTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Ongoing activity",
            style: TextStyle(
              color: CustomColors.textColor,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: CustomColors.backgroundColor,
            elevation: 5,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/images/students.png",
                    height: 170,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      activityName.length > 13
                          ? activityName.substring(0, 14)
                          : activityName,
                      style: const TextStyle(
                        color: CustomColors.textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.place_outlined,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          location,
                          style: const TextStyle(
                            color: CustomColors.secondaryTextColor,
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.watch_later_outlined,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${CustomDateParser.convertToAmPm(startTime)} - ${CustomDateParser.convertToAmPm(endTime)}",
                          style: const TextStyle(
                            color: CustomColors.secondaryTextColor,
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
