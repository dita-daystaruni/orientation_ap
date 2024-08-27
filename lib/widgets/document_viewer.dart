// document_viewer.dart
import 'package:flutter/material.dart';
import 'package:orientation_app/constants/custom_colors.dart';

class DocumentViewer extends StatelessWidget {
  final String documentUrl; // URL of the document to view

  const DocumentViewer({super.key, required this.documentUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: CustomColors.backgroundColor,
        
        title: const Text("Document Viewer"),
      ),
      body: Center(
        child: Text(documentUrl),
      )
    );
  }
}
