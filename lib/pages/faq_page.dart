import 'package:flutter/material.dart';
import 'package:orientation_app/constants/custom_colors.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  static const List<Tab> myTabs = <Tab>[
    Tab(text: "FAQ"),
    Tab(text: 'Documnets'),
  ];

  @override
  Widget build(BuildContext context) {
    // putting routines and sessions controllers
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        backgroundColor: CustomColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: CustomColors.backgroundColor,
          title: const Center(
            child: Text(
              "Routines & Sessions",
              style: TextStyle(
                color: CustomColors.textColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          bottom: const TabBar(
            padding: EdgeInsets.all(8.0),
            indicatorColor: CustomColors.buttonColor,
            dividerColor: CustomColors.indicatorColor,
            labelColor: CustomColors.buttonColor,
            labelStyle: TextStyle(
              color: CustomColors.textColor,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            overlayColor: WidgetStatePropertyAll(
              CustomColors.hoverColor,
            ),
            tabs: myTabs,
          ),
          automaticallyImplyLeading: false,
        ),
        body: TabBarView(children: [
          // routines tab view
          Column(
            children: [
              // list of activities
              Expanded(
                  child: ListView.builder(
                itemBuilder: (context, index) {
                  return const FaqTile();
                },
                itemCount: 10,
              ))
            ],
          ),
          // Documents Page
          Column(
            children: [Text("Documents Page")],
          ),
        ]),
      ),
    );
  }
}

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
