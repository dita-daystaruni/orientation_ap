import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/controllers/activites_session_controller.dart';
import 'package:orientation_app/controllers/contacts_controller.dart';
import 'package:orientation_app/controllers/courses_controller.dart';
import 'package:orientation_app/controllers/document_controller.dart';
import 'package:orientation_app/controllers/faqs_controller.dart';
import 'package:orientation_app/controllers/parent_contact_controller.dart';
import 'package:orientation_app/controllers/statistic_controller.dart';
import 'package:orientation_app/controllers/usercontrollers.dart';
import 'package:orientation_app/models/activity_session_model.dart';
import 'package:orientation_app/models/user_model.dart';
import 'package:orientation_app/services/activities_service.dart';
import 'package:orientation_app/services/contacts_service.dart';
import 'package:orientation_app/services/course_services.dart';
import 'package:orientation_app/services/faqs_service.dart';
import 'package:orientation_app/services/statistics_service.dart';
import 'package:orientation_app/utils/custom_date_parser.dart';
import 'package:orientation_app/widgets/custom_bottomnav.dart';

class ReloadPage extends StatefulWidget {
  const ReloadPage({
    super.key,
    required this.user,
  });

  final User user;

  @override
  State<ReloadPage> createState() => _ReloadPageState();
}

class _ReloadPageState extends State<ReloadPage> {
  bool finishedGettingContacts = false;
  bool finishedGettingActivities = false;
  bool finishedGettingFaqs = false;
  bool finishedGettingDocs = false;
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
                : !finishedGettingDocs
                    ? "Documents"
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
              "assets/lotties/plane.json",
            ),
          ),
          !isDone
              ? Column(
                  children: [
                    Text(
                      "Updating Your $displayText For You Relax",
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
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Almost There, It Pays To Be Patient",
                        style: TextStyle(
                          color: CustomColors.secondaryTextColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
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
      0,
      // widget.user.,
      widget.user.firstName,
    );
    // will hold encoded contacts from server
    List<String> encodedContacts = [];
    UserContactController contactController = Get.find<UserContactController>();
    ParentContactController parentContactController =
        Get.find<ParentContactController>();

    if (response[0] == 200) {
      // encode all contacts details
      for (var contact in response[1]) {
        encodedContacts.add(jsonEncode(contact));
      }
    } else {
      throw Exception("Error Fetching Contacts");
    }

    // if (widget.user.role == "parent") {
    //   await parentContactController.addParentsContactsToSP(encodedContacts);
    //   await parentContactController.getParentsContactsFromSP();
    // } else {
    //   await contactController.addUsersContactsToSP(encodedContacts);
    //   await contactController.getUsersContactsFromSP();
    // }

    // set finishedgetting contact
    setState(() {
      finishedGettingContacts = true;
    });
  }

  Future<void> setFaqs() async {
    var response = await getFaqs(widget.user.firstName);

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
    var response = await getActivities(widget.user.firstName);

    // will hold a dictionary of activities and events
    // grouped as days of the week
    ActivitySessionController activitySessionController =
        Get.find<ActivitySessionController>();

    if (response[0] == 200) {
      CustomDateParser dateParser = CustomDateParser();
      List<ActivitySessionModel> convertedActvities = [];

      // iterate through the list and convert all the objects into activity instances
      for (var activity in response[1]) {
        convertedActvities.add(
          ActivitySessionModel.fromJson(activity),
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
      activitySessionController.setAvailableDaysAndDate();
      activitySessionController.updateOngoingUpcomingActivities();
    } else {
      throw Exception("Error Fetching Events and Sessions");
    }

    // set finishedgetting contact
    setState(() {
      finishedGettingActivities = true;
    });
  }

  Future<void> setCourses() async {
    var response = await getCourses(widget.user.firstName);

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
    var response = await getAllStatistics(widget.user.firstName);

    StatisticsController statisticsController =
        Get.find<StatisticsController>();

    if (response[0] == 200) {
      // encode and set the statistic
      await statisticsController.addStatisticToSP(
        jsonEncode(response[1]),
      );
      await statisticsController.getStatisticsFromSP();
      statisticsController.totalStudents.value =
          statisticsController.statistics.value?.totalStudents ?? 0;
    } else {
      throw Exception("Error Fetching All Statistics");
    }
  }

  Future<void> updateDocuments() async {
    // get document controller
    DocumentController documentController = Get.put(
      DocumentController(
        widget.user.firstName,
      ),
    );
    // update documents
    await documentController.fetchDocuments();
  }

  // sets everything
  Future<void> setEverything() async {
    // TODO do error checks here
    await setContacts();
    await setActivities();
    await setFaqs();
    await updateDocuments();
    await setCourses();
    // await setUser();
    if (widget.user.firstName == "admin") {
      await setStatistics();
    }

    // waits for 2 seconds before moving to respective dashboard
    setState(() {
      isDone = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    // get user back to profile page
    Get.offAll(
      BottomNav(
        user: widget.user,
        onProfile: true,
      ),
    );
  }
}
