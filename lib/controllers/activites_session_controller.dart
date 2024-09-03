import 'dart:convert';
import 'package:get/get.dart';
import 'package:orientation_app/models/activity_session_model.dart';
import 'package:orientation_app/utils/custom_date_parser.dart';
import 'package:orientation_app/widgets/daystile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActivitySessionController extends GetxController {
  // holds activities
  RxMap<String, List<ActivitySessionModel>> activities =
      <String, List<ActivitySessionModel>>{}.obs;
  Rx<ActivitySessionModel?> ongoingActivity = Rxn<ActivitySessionModel>();
  Rx<ActivitySessionModel?> upcomingActivity = Rxn<ActivitySessionModel>();
  RxList<Map<String, dynamic>> availableDaysAndDate =
      <Map<String, dynamic>>[].obs;
  RxList<ActivitySessionModel> dayActivities = <ActivitySessionModel>[].obs;
  RxList<ActivitySessionModel> daySessions = <ActivitySessionModel>[].obs;
  // index of currently selected date
  Rx<int> activeIndex = 0.obs;
  // hold day tiles to display in ui
  var dayTiles = [].obs;
  // CustomDate Parser
  CustomDateParser dateParser = CustomDateParser();

  @override
  void onInit() async {
    // set the activites
    await getActivitiesFromSP();
    setAvailableDaysAndDate();
    updateOngoingUpcomingActivities();
    super.onInit();
  }

  // gets the current day activities
  void getDayActivities() {
    // clear the list first before updating
    dayTiles.clear();
    dayActivities.clear();
    daySessions.clear();
    for (var element in availableDaysAndDate) {
      // print(element["index"] == activeIndex.value);
      if (element["index"] == activeIndex.value) {
        dayTiles.add(
          DaysTile(
            day: element["day"].substring(0, 3),
            date: element["date"],
            index: element["index"],
            isActive: true,
          ),
        );
        // update dayactivities
        for (var actvity in activities[element["day"]]!) {
          if (actvity.isSession) {
            daySessions.add(actvity);
          } else {
            dayActivities.add(actvity);
          }
        }
      } else {
        dayTiles.add(DaysTile(
          day: element["day"].substring(0, 3),
          date: element["date"],
          index: element["index"],
        ));
      }
    }
  }

  // updates the index of the currently selected tile
  void updateActiveIndex(int index) {
    activeIndex.value = index;
    // update list with new activities
    getDayActivities();
  }

  // set previous activity and ongoing
  void updateOngoingUpcomingActivities() {
    List<ActivitySessionModel?> actvities =
        dateParser.getUpcomingActivity(activities);
    ongoingActivity.value = actvities[0];
    upcomingActivity.value = actvities[1];
  }

  // set availableDaysanddate
  void setAvailableDaysAndDate() {
    availableDaysAndDate.value = dateParser.getDaysAndDate(activities);
    // setting dat tiles
    getDayActivities();
  }

  // caches activites
  Future<void> addActivitiesToSP(String groupedActivities) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("activities", groupedActivities);
  }

  // gets users contacts from SP
  Future getActivitiesFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.reload();
    final String? activitiesString = prefs.getString("activities");
    if (activitiesString != null) {
      Map<String, dynamic> decodedActivities = jsonDecode(activitiesString);
      // clear activities before adding new ones
      activities.clear();
      // adding new activities
      decodedActivities.forEach(
        (key, value) {
          List<ActivitySessionModel> decodedDayActivities = [];
          for (var day in value) {
            decodedDayActivities.add(
              ActivitySessionModel.fromJson(day),
            );
          }
          activities[key] = decodedDayActivities;
        },
      );
      return activities;
    }
    return null;
  }
}
