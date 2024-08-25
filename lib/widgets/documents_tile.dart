import 'package:flutter/material.dart';
import 'package:orientation_app/constants/custom_colors.dart';

class DocumentsTile extends StatelessWidget {
  const DocumentsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: CustomColors.backgroundColor,
      child: ListTile(
        onTap: () => debugPrint("Coming Soon"),
        horizontalTitleGap: 38,

        // minTileHeight: 81,
        titleTextStyle: const TextStyle(
          color: CustomColors.textColor,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        // dense: true,
        leading: Image.asset(
          'assets/images/document.png',
          height: 67,
        ),
        title: const Text(
          'Document Name',
        ),
      ),
    );
  }
}
