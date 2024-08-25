import 'package:flutter/material.dart';
import 'package:orientation_app/constants/custom_colors.dart';

class FaqTile extends StatefulWidget {
  const FaqTile({
    super.key,
  });

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
            // minTileHeight: 81,
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
            title: const Text(
              'Question:Lorem ipsum dolor sit amet, ',
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
            ? const Card(
                elevation: 4,
                color: CustomColors.backgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Answer",
                      style: TextStyle(
                        color: CustomColors.textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
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