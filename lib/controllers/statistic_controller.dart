import 'dart:convert';

import 'package:get/get.dart';
import 'package:orientation_app/models/statistic_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatisticsController extends GetxController {
  Rx<StatisticsModel?> statistics = Rxn<StatisticsModel>();
  Rx<int> totalStudents = 0.obs;
  Rx<bool> isFetching = false.obs;
  Rx<bool> fetchingTotal = false.obs;

  @override
  void onInit() async {
    // set statistics
    await getStatisticsFromSP();
    totalStudents.value = statistics.value?.totalStudents ?? 0;
    super.onInit();
  }

  // caches faqs
  Future<void> addStatisticToSP(String statistics) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("statistics", statistics);
  }

  // gets users contacts from SP
  Future getStatisticsFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.reload();
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

  // updates statistics
  Future updateStats(String statisticsString) async {
    statistics.value = StatisticsModel.fromJson(
      jsonDecode(statisticsString),
    );
    isFetching.value = false;
  }
}
