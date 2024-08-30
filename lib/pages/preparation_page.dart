import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/controllers/activites_session_controller.dart';
import 'package:orientation_app/controllers/contacts_controller.dart';
import 'package:orientation_app/controllers/courses_controller.dart';
import 'package:orientation_app/controllers/faqs_controller.dart';
import 'package:orientation_app/controllers/statistic_controller.dart';
import 'package:orientation_app/controllers/usercontrollers.dart';
import 'package:orientation_app/models/activity_session_model.dart';
import 'package:orientation_app/models/user_model.dart';
import 'package:orientation_app/services/contacts_service.dart';
import 'package:orientation_app/services/course_services.dart';
import 'package:orientation_app/services/faqs_service.dart';
import 'package:orientation_app/services/statistics_service.dart';
import 'package:orientation_app/utils/custom_date_parser.dart';
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
  bool finishedGettingFaqs = false;
  bool finishedGettingCourses = false;
  bool finishedGettingStatistics = false;
  bool finishedSettingUser = false;
  bool isDone = false;

  @override
  void initState() {
    setEverything();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String displayText = !finishedGettingContacts
        ? "Contacts"
        : !finishedGettingActivities
            ? "Activities"
            : !finishedGettingFaqs
                ? "FAQS"
                : !finishedGettingCourses
                    ? "Courses"
                    : !finishedSettingUser
                        ? "Account"
                        : "Statistics";
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
  }

  Future<void> setFaqs() async {
    var response = await getFaqs(widget.user.token);
    debugPrint("Finished Getting FAQs");

    // will hold encoded FAQs from server
    List<String> encodedFaqs = [];
    FaqController faqController = Get.find<FaqController>();

    if (response[0] == 200) {
      // encode all contacts details
      for (var faq in response[1]) {
        encodedFaqs.add(jsonEncode(faq));
      }
    } else {
      throw Exception("Error Fetching Contacts");
    }

    await faqController.addFaqToSP(encodedFaqs);
    await faqController.getFaqsFromSP();

    // set finishedgetting contact
    setState(() {
      finishedGettingFaqs = true;
    });
  }

  // TODO use an isolate for this operation
  Future<void> setActivities() async {
    // var response = await getActivities(widget.user.token);
    int response = 200;

    // will hold a dictionary of activities and events
    // grouped as days of the week
    ActivitySessionController activitySessionController =
        Get.find<ActivitySessionController>();

    if (response == 200) {
      CustomDateParser dateParser = CustomDateParser();
      List<ActivitySessionModel> convertedActvities = [];

      // iterate through the list and convert all the objects into activity instances
      for (var example in exampleEvents) {
        convertedActvities.add(
          ActivitySessionModel.fromJson(example),
        );
      }

      // group into days first
      Map<String, List<ActivitySessionModel>> groupedActivities =
          dateParser.groupActivitiesWithDay(convertedActvities);

      // sort each activities accordingly
      groupedActivities.forEach(
        (key, value) {
          groupedActivities[key] = dateParser.sortWithStartTime(value);
        },
      );

      // encode the map produce for caching
      await activitySessionController
          .addActivitiesToSP(jsonEncode(groupedActivities));
      await activitySessionController.getActivitiesFromSP();
    } else {
      throw Exception("Error Fetching Events and Sessions");
    }

    // set finishedgetting contact
    setState(() {
      finishedGettingActivities = true;
    });
  }

  Future<void> setCourses() async {
    var response = await getCourses(widget.user.token);

    // will hold all courses
    List<String> courses = <String>[];
    CourseController courseController = Get.find<CourseController>();

    if (response[0] == 200) {
      // getting all courses and adding to list
      for (var course in response[1]) {
        courses.add(course['name']);
      }
    } else {
      throw Exception("Error Fetching Courses");
    }

    await courseController.addCoursesToSP(courses);
    await courseController.getCoursesFromSP();

    // set finishedgetting contact
    setState(() {
      finishedGettingCourses = true;
    });
  }

  Future<void> setStatistics() async {
    var response = await getAllStatistics(widget.user.token);

    StatisticsController statisticsController =
        Get.find<StatisticsController>();

    if (response[0] == 200) {
      // encode and set the statistic
      await statisticsController.addStatisticToSP(
        jsonEncode(response[1]),
      );
      await statisticsController.getStatisticsFromSP();
    } else {
      throw Exception("Error Fetching All Statistics");
    }
  }

  Future<void> setUser() async {
    // encode user object
    String userString = jsonEncode(widget.user);

    UserController userController = Get.find<UserController>();

    await userController.addUserToSP(userString);
    await userController.getUserFromSP();

    // set logged in to true
    await userController.setLoginToSp(true);
    userController.isLoggedIn.value = await userController.getLoggedInFromSP();

    setState(() {
      finishedSettingUser = true;
    });
  }

  // sets everything
  Future<void> setEverything() async {
    // TODO do error checks here
    // TODO parents contacts are loaded differently
    await setContacts();
    await setActivities();
    await setFaqs();
    await setCourses();
    await setUser();
    // TODO load only when its an admin
    if (widget.user.userType == "admin") {
      await setStatistics();
    }

    // waits for 2 seconds before moving to respective dashboard
    setState(() {
      isDone = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    // TODO popping this page from the Navigator
    Get.to(BottomNav(user: widget.user));
  }
}
