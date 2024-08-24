import 'package:flutter/material.dart';
import 'package:orientation_app/constants/custom_colors.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CustomColors.backgroundColor,
        title: const Text(
          "Activity Name",
          style: TextStyle(
              color: CustomColors.textColor,
              fontWeight: FontWeight.w500,
              fontSize: 24),
        ),
      ),
      backgroundColor: CustomColors.backgroundColor,
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            IntrinsicWidth(
              child: Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        color: CustomColors.secondaryTextColor,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 4.0,
                          right: 16.0,
                        ),
                        child: Text(
                          '8.00 AM',
                          style: TextStyle(
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
                      Padding(
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
                        "Location",
                        style: TextStyle(
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
            Padding(
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
              "You're just one step away from diving into this incredible journey. At Daystar University, we believe in your potential.",
              style: TextStyle(
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
