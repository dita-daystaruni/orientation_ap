import 'package:flutter/material.dart';
import 'package:orientation_app/constants/custom_colors.dart';

class StatisticItem extends StatelessWidget {
  const StatisticItem({
    super.key,
    required this.title,
    required this.statistic,
  });

  final String title;
  final String statistic;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$title:",
          style: const TextStyle(
            color: CustomColors.textColor,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        const Spacer(),
        Text(
          statistic,
          style: const TextStyle(
            color: CustomColors.secondaryTextColor,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
