import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/controllers/routes_sessions_controllers.dart';

class DaysTile extends StatelessWidget {
  const DaysTile({
    super.key,
    required this.day,
    required this.date,
    required this.index,
    this.isActive = false,
  });

  final String day;
  final String date;
  final int index;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    RoutesSessionsControllers routesSessionsControllers =
        Get.find<RoutesSessionsControllers>();
    return GestureDetector(
      onTap: () {
        routesSessionsControllers.updateActiveIndex(index);
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.24,
          height: MediaQuery.of(context).size.height * 0.12,
          decoration: BoxDecoration(
            border: Border.all(
              color: isActive
                  ? CustomColors.buttonColor
                  : CustomColors.indicatorColor,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                day,
                style: TextStyle(
                  color: isActive
                      ? CustomColors.buttonColor
                      : CustomColors.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  color: isActive
                      ? CustomColors.buttonColor
                      : CustomColors.thirdTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
