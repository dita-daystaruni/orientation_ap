import 'package:flutter/material.dart';
import 'package:orientation_app/constants/custom_colors.dart';

class FaqTile extends StatefulWidget {
  const FaqTile({
    super.key,
    required this.question,
    required this.answer,
  });

  final String question;
  final String answer;

  @override
  State<FaqTile> createState() => _FaqTileState();
}

class _FaqTileState extends State<FaqTile> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 4,
          color: CustomColors.backgroundColor,
          child: ListTile(
            minTileHeight: 81,
            titleTextStyle: const TextStyle(
              color: CustomColors.textColor,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            // dense: true,
            leading: Image.asset(
              'assets/images/questionmark.png',
              height: 67,
            ),
            title: Text(
              widget.question,
            ),
            trailing: IconButton(
              icon: Icon(
                isExpanded ? Icons.keyboard_arrow_down : Icons.navigate_next,
              ),
              color: CustomColors.buttonColor,
              iconSize: 30,
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ),
        ),
        isExpanded
            ? Card(
                elevation: 4,
                color: CustomColors.backgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Answer",
                      style: TextStyle(
                        color: CustomColors.textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.answer,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: CustomColors.textColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
