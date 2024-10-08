import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/pages/activitypage.dart';

// widget holding activty summary details
class EventsTile extends StatelessWidget {
  const EventsTile({
    super.key,
    required this.eventLocation,
    required this.eventtitle,
    required this.timePeriod,
    this.eventDesc,
    this.isSession = false,
    this.showTimePeriod = true,
  });

  final String eventtitle;
  final String eventLocation;
  final String? eventDesc;
  final bool isSession;
  final bool showTimePeriod;
  final String timePeriod;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Divider(
          color: CustomColors.indicatorColor,
          height: 10,
        ),
        Container(
          height: 15,
          width: 14,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSession
                ? CustomColors.iconColorTwo
                : CustomColors.iconColorOne,
          ),
        ),
        //begging of the activity details
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 2.0,
            horizontal: 24.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 8.0,
                ),
                child: Text(
                  eventtitle.length > 20
                      ? "${eventtitle.substring(0, 20)}..."
                      : eventtitle,
                  softWrap: true,
                  style: const TextStyle(
                    color: CustomColors.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.place_outlined,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        eventLocation,
                        softWrap: true,
                        style: const TextStyle(
                          color: CustomColors.secondaryTextColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              showTimePeriod
                  ? Padding(
                      padding: const EdgeInsets.only(
                        top: 6.0,
                        left: 6.0,
                        right: 6.0,
                        bottom: 0,
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.watch_later_outlined,
                          ),
                          Text(
                            timePeriod,
                            style: const TextStyle(
                              color: CustomColors.secondaryTextColor,
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.navigate_next,
            size: 40,
          ),
          onPressed: () {
            Get.to(ActivityPage(
              name: eventtitle,
              description: eventDesc ?? "",
              location: eventLocation,
              timePeriod: timePeriod,
            ));
          },
        ),
      ],
    );
  }
}
