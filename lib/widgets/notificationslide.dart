import 'package:flutter/material.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/utils/custom_date_parser.dart';

class NotificationSlide extends StatelessWidget {
  const NotificationSlide({
    super.key,
    required this.title,
    required this.contents,
    required this.time,
  });

  final String title;
  final String contents;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(
            Icons.notifications_none_outlined,
            color: CustomColors.buttonColor,
            size: 35,
          ),
          title: Text(
            title,
            style: const TextStyle(
              color: CustomColors.textColor,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            // displays only a section of it if its too much
            contents.trim().length > 56
                ? "${contents.substring(
                    0,
                    56,
                  )}..."
                : contents,
            style: const TextStyle(
              color: CustomColors.secondaryTextColor,
              fontWeight: FontWeight.w300,
              fontSize: 16,
            ),
          ),
          trailing: Column(
            children: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: CustomColors.backgroundColor,
                        title: Text(
                          title,
                          style: const TextStyle(
                            color: CustomColors.textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        content: IntrinsicHeight(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Description",
                                style: TextStyle(
                                  color: CustomColors.textColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                contents,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: CustomColors.textColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: IntrinsicWidth(
                                    child: Row(
                                      children: [
                                        Text(
                                          "${time.substring(0, 10)}   ",
                                          style: const TextStyle(
                                            color:
                                                CustomColors.secondaryTextColor,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          CustomDateParser.convertToAmPmNotif(
                                              time),
                                          style: const TextStyle(
                                            color:
                                                CustomColors.secondaryTextColor,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.navigate_next,
                  color: CustomColors.buttonColor,
                ),
              ),
              // const Spacer(),
              // Text(
              //   time,
              //   style: const TextStyle(
              //     color: CustomColors.textColor,
              //     // fontWeight: FontWeight.w300,
              //     fontSize: 13,
              //   ),
              // ),
            ],
          ),
        ),
        const Divider(
          color: CustomColors.indicatorColor,
        ),
      ],
    );
  }
}
