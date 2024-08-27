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
        backgroundColor: CustomColors.backgroundColor,
        
        title: Text(title),
      ),
      body: Center(
        child: Image.network(
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
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            return const Center(
              child: Text(
                'Failed to load image.',
                style: TextStyle(color: CustomColors.eventsColor),
              ),
            );
          },
        ),
      ),
    );
  }
}

