import 'package:flutter/material.dart';
import 'package:orientation_app/constants/custom_colors.dart';

class DocumentViewer extends StatelessWidget {
  const DocumentViewer({
    super.key,
    required this.title,
    required this.url,
  });
  final String url;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: CustomColors.backgroundColor,
        title: const Text(
          "Document View",
          style: TextStyle(
            color: CustomColors.textColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 28.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: CustomColors.textColor,
                ),
              ),
            ),
            Image.network(
              url,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      color: CustomColors.buttonColor,
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                }
              },
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return const Center(
                  child: Text(
                    'Failed to load image.',
                    style: TextStyle(color: CustomColors.eventsColor),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
