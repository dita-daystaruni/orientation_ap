import 'package:flutter/material.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/services/document_service.dart';

import 'document_viewer.dart';

class DocumentsTile extends StatelessWidget {
  final String documentName;
  final String documentUrl;

  const DocumentsTile({
    super.key,
    required this.documentName,
    required this.documentUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: CustomColors.backgroundColor,
      child: ListTile(
        onTap: () => viewDocument(context),
        horizontalTitleGap: 38,
        minTileHeight: 81,
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
        title: Text(
          documentName,
        ),
      ),
    );
  }

  // handle document viewing
  void viewDocument(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DocumentViewer(
            documentUrl: documentUrl),
      ),
    );
  }
}
