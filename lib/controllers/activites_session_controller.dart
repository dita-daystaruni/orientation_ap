import 'dart:convert';
import 'package:get/get.dart';
import 'package:orientation_app/models/activity_session_model.dart';
import 'package:orientation_app/utils/custom_date_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActivitySessionController extends GetxController {
  // holds activities
  RxMap<String, List<ActivitySessionModel>> activities =
      <String, List<ActivitySessionModel>>{}.obs;
  Rx<ActivitySessionModel?> ongoingActivity = Rxn<ActivitySessionModel>();
  Rx<ActivitySessionModel?> upcomingActivity = Rxn<ActivitySessionModel>();
  RxList<Map<String, String>> availableDaysAndDate =
      <Map<String, String>>[].obs;

  // CustomDate Parser
  CustomDateParser dateParser = CustomDateParser();

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
  }

  // caches activites
  Future<void> addActivitiesToSP(String groupedActivities) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("activities", groupedActivities);
  }

  // gets users contacts from SP
  Future getActivitiesFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
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
