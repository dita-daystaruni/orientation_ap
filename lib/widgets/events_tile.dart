import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/constants/custom_colors.dart';

// widget holding activty summary details
class EventsTile extends StatelessWidget {
  const EventsTile({
    super.key,
    required this.eventdesc,
    required this.eventtitle,
    this.isSession = false,
    this.timePeriod,
  });

  final String eventtitle;
  final String eventdesc;
  final bool isSession;
  final String? timePeriod;

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
          width: 15,
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
                  eventtitle,
                  style: const TextStyle(
                    color: CustomColors.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.place_outlined,
                    ),
                    Text(
                      eventdesc,
                      style: const TextStyle(
                        color: CustomColors.secondaryTextColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              ),
              timePeriod != null
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
                            timePeriod!,
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
        const Spacer(),
        IconButton(
          icon: const Icon(
            Icons.navigate_next,
            size: 40,
          ),
          onPressed: () {
            Get.toNamed('/activity_page');
          },
        ),
      ],
    );
  }
}
