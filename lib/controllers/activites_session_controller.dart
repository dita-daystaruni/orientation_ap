import 'dart:convert';
import 'package:get/get.dart';
import 'package:orientation_app/models/activity_session_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActivitySessionController extends GetxController {
  // holds activities
  RxList<ActivitySessionModel> activities = <ActivitySessionModel>[].obs;
  RxList<ActivitySessionModel> sessions = <ActivitySessionModel>[].obs;

  // caches activites
  Future<void> addActivitiesToSP(List<String> activities) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("activities", activities);
  }

  // caches sessions
  Future<void> addSessionsToSP(List<String> sessions) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("sessions", sessions);
  }

  // gets users contacts from SP
  Future getActivitiesFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? activitiesString = prefs.getStringList("activities");
    if (activitiesString != null) {
      // clear activities before adding new ones
      activities.clear();
      // adding new activities
      for (var element in activitiesString) {
        activities.add(
          ActivitySessionModel.fromJson(
            jsonDecode(element),
          ),
        );
      }
      return activities;
    }
    return null;
  }

  // gets users contacts from SP
  Future getSessionsFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? sessionsString = prefs.getStringList("sessions");
    if (sessionsString != null) {
      // clear sessions before adding new ones
      sessions.clear();
      // adding sessions contacts
      for (var element in sessionsString) {
        sessions.add(
          ActivitySessionModel.fromJson(
            jsonDecode(element),
          ),
        );
      }
      return sessions;
    }
    return null;
  }
}
