import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/controllers/contacts_controller.dart';
import 'package:orientation_app/models/user_model.dart';
import 'package:orientation_app/services/activities_service.dart';
import 'package:orientation_app/services/contacts_service.dart';
import 'package:orientation_app/services/faqs_service.dart';
import 'package:orientation_app/widgets/custom_bottomnav.dart';

class PreparationPage extends StatefulWidget {
  const PreparationPage({
    super.key,
    required this.user,
  });

  final User user;

  @override
  State<PreparationPage> createState() => _PreparationPageState();
}

class _PreparationPageState extends State<PreparationPage> {
  bool finishedGettingContacts = false;
  bool finishedGettingActivities = false;
  bool finishedGettingEvents = false;
  bool finishedGettingFaqs = false;
  bool isDone = false;

  @override
  void initState() {
    setEverything();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String displayText = !finishedGettingContacts
        ? "Contact"
        : !finishedGettingActivities
            ? "Activities"
            : !finishedGettingEvents
                ? "Events"
                : "FAQS";
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Lottie.asset(
              "assets/lotties/study.json",
            ),
          ),
          !isDone
              ? Column(
                  children: [
                    Text(
                      "Setting Up Your $displayText For You Relax",
                      style: const TextStyle(
                        color: CustomColors.secondaryTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    const Text(
                      "🤐",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ],
                )
              : const Column(
                  children: [
                    Text(
                      "Almost There, It Pays To Be Patient",
                      style: TextStyle(
                        color: CustomColors.secondaryTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "🥳",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Future<void> setContacts() async {
    var response = await getUserContacts(
      widget.user.userId,
      widget.user.token,
    );
    // will hold encoded contacts from server
    List<String> encodedContacts = [];
    UserContactController contactController = Get.find<UserContactController>();

    if (response[0] == 200) {
      // encode all contacts details
      for (var contact in response[1]) {
        encodedContacts.add(jsonEncode(contact));
      }
    } else {
      throw Exception("Error Fetching Contacts");
    }

    await contactController.addUsersContactsToSP(encodedContacts);
    await contactController.getUsersContactsFromSP();
    // set finishedgetting contact
    setState(() {
      finishedGettingContacts = true;
    });

    // print(response[1]);
  }

  Future<void> setFaqs() async {
    // var response = await getFaqs(widget.user.token);
    // set finishedgetting contact
    setState(() {
      finishedGettingFaqs = true;
    });

    // TODO set FAQS here
    // print(response[1]);
  }

  Future<void> setActivities() async {
    // var response = await getActivities(widget.user.token);
    // set finishedgetting contact
    setState(() {
      finishedGettingActivities = true;
    });

    // // TODO set FAQS here
    // print(response[1]);
  }

  Future<void> setEvents() async {
    // var response = await getEvents(widget.user.token);
    // set finishedgetting contact
    setState(() {
      finishedGettingEvents = true;
    });

    // // TODO set FAQS here
    // print(response[1]);
  }

  // sets everything
  Future<void> setEverything() async {
    // TODO do error checks here
    await setContacts();
    await setActivities();
    await setEvents();
    await setFaqs();
    // waits for 3 seconds before moving to respective dashboard
    setState(() {
      isDone = true;
    });
    await Future.delayed(const Duration(seconds: 3));
    // TODO popping this page from the Navigator
    Get.to(BottomNav(user: widget.user));
  }
}
