import 'package:flutter/material.dart';
import 'package:orientation_app/constants/custom_colors.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({
    super.key,
    required this.name,
    required this.location,
    required this.description,
    required this.timePeriod,
  });

  final String name;
  final String timePeriod;
  final String location;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CustomColors.backgroundColor,
        title: Text(
          name,
          style: const TextStyle(
              color: CustomColors.textColor,
              fontWeight: FontWeight.w500,
              fontSize: 24),
        ),
      ),
      backgroundColor: CustomColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            IntrinsicWidth(
              child: Center(
                child: Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.watch_later_outlined,
                          color: CustomColors.secondaryTextColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 4.0,
                            right: 16.0,
                          ),
                          child: Text(
                            timePeriod,
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              color: CustomColors.secondaryTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 16.0,
                            right: 4.0,
                          ),
                          child: Icon(
                            Icons.place_outlined,
                            color: CustomColors.secondaryTextColor,
                          ),
                        ),
                        Text(
                          location,
                          style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                            color: CustomColors.secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 45.0,
                bottom: 16.0,
              ),
              child: Text(
                'Description',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: CustomColors.textColor,
                ),
              ),
            ),
            Text(
              description,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: CustomColors.textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
