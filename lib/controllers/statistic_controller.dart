import 'dart:convert';

import 'package:get/get.dart';
import 'package:orientation_app/models/statistic_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatisticsController extends GetxController {
  Rx<StatisticsModel?> statistics = Rxn<StatisticsModel>();

  // caches faqs
  Future<void> addStatisticToSP(String statistics) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("statistics", statistics);
  }

  // gets users contacts from SP
  Future getStatisticsFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? statisticsString = prefs.getString("statistics");
    if (statisticsString != null) {
      // decode the string to a dict then create the instance
      statistics.value = StatisticsModel.fromJson(
        jsonDecode(statisticsString),
      );
      return statistics.value;
    }
    return null;
  }
}