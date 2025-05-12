import 'dart:async';

import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:orientation_app/models/activity_session_model.dart';
import 'package:pocketbase/pocketbase.dart';

class ActivityController extends GetxController {
  final Logger _logger = Logger();
  RxMap<DateTime, List<ActivityModel>> activities =
      RxMap<DateTime, List<ActivityModel>>();
  // holds todays and past activities
  RxMap<DateTime, List<ActivityModel>> pastAndTodayAct =
      RxMap<DateTime, List<ActivityModel>>();
  RxMap<String, ActivityModel?> ongoingAndUpcomingActivity =
      RxMap<String, ActivityModel?>();
  Timer? activityTimer;

  bool _isFetching = false;

  @override
  void dispose() {
    activityTimer?.cancel();
    super.dispose();
  }

  // Future<void> createSampleActivities() async {
  //   print("Pressed");
  //   final PocketBase pocketBase = GetIt.instance.get<PocketBase>();

  //   final activities = [
  //     {
  //       "title": "Orientation Briefing",
  //       "from": "2025-05-07T06:00:00.000Z",
  //       "to": "2025-05-07T07:00:00.000Z",
  //       "venue": "Main Hall",
  //       "description": "Introductory session for new students.",
  //       "multiple": false
  //     },
  //     {
  //       "title": "Campus Resource Tour",
  //       "from": "2025-05-07T11:00:00.000Z",
  //       "to": "2025-05-07T12:00:00.000Z",
  //       "venue": "Admin Block",
  //       "description": "Guided tour of important campus facilities.",
  //       "multiple": false
  //     },
  //     {
  //       "title": "Welcome Session",
  //       "from": "2025-05-08T20:50:00.000Z",
  //       "to": "2025-05-08T20:55:00.000Z",
  //       "venue": "Hope Centre/PAC",
  //       "description": "Official welcome and briefing from the Dean.",
  //       "multiple": false
  //     },
  //     {
  //       "title": "Registration + Tour",
  //       "from": "2025-05-08T06:00:00.000Z",
  //       "to": "2025-05-08T07:00:00.000Z",
  //       "venue":
  //           "Registration||Finance Office,Campus Tour||All round the Campus",
  //       "description": "Document verification followed by campus tour.",
  //       "multiple": true
  //     },
  //     {
  //       "title": "Department Meet & Greet",
  //       "from": "2025-05-09T05:24:00.000Z",
  //       "to": "2025-05-09T05:25:00.000Z",
  //       "venue": "Engineering Complex",
  //       "description": "Meet your department heads and staff.",
  //       "multiple": false
  //     },
  //     {
  //       "title": "Sports Orientation",
  //       "from": "2025-05-09T12:00:00.000Z",
  //       "to": "2025-05-09T13:00:00.000Z",
  //       "venue": "Field||Main Pitch,Kit Collection||Gym Hall",
  //       "description": "Intro to sports programs and gear distribution.",
  //       "multiple": true
  //     },
  //   ];

  //   for (final activity in activities) {
  //     final record =
  //         await pocketBase.collection('activities').create(body: activity);
  //     print('Created: ${record.id} => ${record.data['title']}');
  //   }
  // }

  Future fetchAllActivities({bool loadMore = false}) async {
    if (_isFetching) return activities;
    _isFetching = true;
    try {
      final PocketBase pocketBase = GetIt.instance.get<PocketBase>();
      final result = await pocketBase.collection("activities").getFullList(
            sort: "from",
          );
      _isFetching = false;
      // clear all activities before adding new ones
      activities.clear();

      for (final item in result) {
        ActivityModel activity = ActivityModel.fromJson(
          item.toJson(),
        );

        final DateTime date = activity.from;
        final DateTime dateOnly = DateTime(
          date.year,
          date.month,
          date.day,
        );

        if (!activities.containsKey(dateOnly)) {
          activities[dateOnly] = [];
        }

        activities[dateOnly]!.add(activity);
      }

      _logger.i("Activities loaded successfully");
      ongoingAndUpcomingActivity.value =
          getOngoingAndUpcomingActivity(activities);
      pastAndTodayAct.value = getPastAndTodayActivities(activities);
      // start monitoring activities
      activityMonitor();

      return activities;
    } catch (e) {
      // TODO change to use Either Error Handling
      print(e);
      rethrow;
    }
  }

  Map<DateTime, List<ActivityModel>> getPastAndTodayActivities(
    Map<DateTime, List<ActivityModel>> groupedActivities,
  ) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final filtered = <DateTime, List<ActivityModel>>{};

    for (final entry in groupedActivities.entries) {
      final dateOnly = DateTime(entry.key.year, entry.key.month, entry.key.day);
      if (dateOnly.isBefore(today) || dateOnly.isAtSameMomentAs(today)) {
        filtered[entry.key] = entry.value;
      }
    }

    return filtered;
  }

  // TODO handle timezones
  Map<String, ActivityModel?> getOngoingAndUpcomingActivity(
      Map<DateTime, List<ActivityModel>> activitiesMap) {
    final DateTime now = DateTime.now().toLocal();
    final DateTime today = DateTime(now.year, now.month, now.day).toLocal();
    final DateTime tomorrow = today
        .add(
          const Duration(days: 1),
        )
        .toLocal();
    final List<ActivityModel> todayActivities = activitiesMap[today] ?? [];
    final List<ActivityModel> tomorrowActivities =
        activitiesMap[tomorrow] ?? [];

    final List<ActivityModel> relevantActivities = [
      ...todayActivities,
      ...tomorrowActivities,
    ];

    if (relevantActivities.isEmpty) return {};

    relevantActivities.sort(
      (a, b) => a.from.compareTo(
        b.from.toLocal(),
      ),
    );

    ActivityModel? currentActivity;
    ActivityModel? nextActivity;

    for (int i = 0; i < relevantActivities.length; i++) {
      final activity = relevantActivities[i];

      if ((now.isAfter(activity.from) || now.isAtSameMomentAs(activity.from)) &&
          now.isBefore(activity.to)) {
        currentActivity = activity;
        if (i + 1 < relevantActivities.length) {
          nextActivity = relevantActivities[i + 1];
        }
        break;
      }

      if (now.isBefore(activity.from)) {
        nextActivity = activity;
        break;
      }
    }

    return {
      'ongoing': currentActivity,
      'upcoming': nextActivity,
    };
  }

  String getWeekDay(int pos) {
    final weekdayNames = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];

    return weekdayNames[--pos];
  }

  List<Map<String, String>> extractSubEvents(String input) {
    final subEvents = input.split(',');

    return subEvents.map((subEvent) {
      final parts = subEvent.split('||');
      final title = parts.isNotEmpty ? parts[0].trim() : '';
      final venue = parts.length > 1 ? parts[1].trim() : '';
      return {'title': title, 'venue': venue};
    }).toList();
  }

  void activityMonitor() {
    ongoingAndUpcomingActivity.value =
        getOngoingAndUpcomingActivity(activities);
    final ActivityModel? ongoingActivity =
        ongoingAndUpcomingActivity['ongoing'];

    // Cancel any existing timer
    activityTimer?.cancel();

    // Schedule a timer to update once the current activity ends
    if (ongoingActivity != null) {
      final end = ongoingActivity.to;
      final now = DateTime.now().toLocal();
      final duration = end.difference(now);

      if (duration.isNegative) {
        // Activity already ended — update immediately
        activityMonitor();
      } else {
        activityTimer = Timer(duration, () {
          activityMonitor();
        });
      }

      _logger.i(
        'Monitoring "${ongoingActivity.title}", ends in ${duration.inMinutes} minutes.',
      );
      return;
    }
    // monitor upcoming activity if ongoing is null
    final ActivityModel? upcomingActivity =
        ongoingAndUpcomingActivity["upcoming"];

    // Cancel any existing timer
    activityTimer?.cancel();

    // Schedule a timer to update once the current activity ends
    if (upcomingActivity != null) {
      final start = upcomingActivity.from;
      final now = DateTime.now().toLocal();
      final duration = start.difference(now);

      if (duration.isNegative) {
        // Activity already ended — update immediately
        activityMonitor();
      } else {
        activityTimer = Timer(duration, () {
          activityMonitor();
        });
      }

      _logger.i(
        'Monitoring "${upcomingActivity.title}", ends in ${duration.inMinutes} minutes.',
      );
      return;
    }

    _logger.i('No current activity to monitor.');
  }
}
