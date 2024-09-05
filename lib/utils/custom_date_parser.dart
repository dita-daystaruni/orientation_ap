import 'package:orientation_app/models/activity_session_model.dart';

class CustomDateParser {
  // days of the week
  List<String> daysOfTheWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  // extracts the day of the string
  String getDay(String date) {
    DateTime parsedDate = DateTime.parse(date);
    return daysOfTheWeek[parsedDate.weekday - 1];
  }

  // group the activities to days
  Map<String, List<ActivitySessionModel>> groupActivitiesWithDay(
      List<ActivitySessionModel> activities) {
    Map<String, List<ActivitySessionModel>> groupedActivities = {};
    for (var activity in activities) {
      // print(activity.id);
      // print(activity.date);
      String day = getDay(activity.date);
      // print(day);
      if (groupedActivities[day] == null) {
        groupedActivities[day] = [activity];
      } else {
        groupedActivities[day]!.add(activity);
      }
    }
    return groupedActivities;
  }

  // gets a list of time objects and returns them sorted with time
  List<ActivitySessionModel> sortWithStartTime(
      List<ActivitySessionModel> activities) {
    // will sort the activities
    List<ActivitySessionModel> sortedActivites = [];
    int currentIndex = -1; // holds the current index we are at

    for (var activity in activities) {
      DateTime startTime =
          DateTime.parse("${activity.date}T${activity.startTime}");

      if (sortedActivites.isEmpty) {
        sortedActivites.add(activity);
        ++currentIndex;
      } else if (startTime.compareTo(
            DateTime.parse(
              "${sortedActivites[currentIndex].date}T${sortedActivites[currentIndex].startTime}",
            ),
          ) <
          0) {
        sortedActivites.insert(currentIndex, activity);
        ++currentIndex;
      } else {
        // the activity is either the same time or after
        sortedActivites.add(activity);
        ++currentIndex;
      }
    }
    return sortedActivites;
  }

  // returns the available dates and time
  List<Map<String, dynamic>> getDaysAndDate(
      Map<String, List<ActivitySessionModel>> activities) {
    List<Map<String, dynamic>> daysAndDates = [];
    int index = 0; // will hold index of each tile
    activities.forEach((key, value) {
      daysAndDates.add(
        {
          "index": index++,
          "day": key,
          "date": DateTime.parse(value[0].date).day.toString(),
        },
      );
    });
    return daysAndDates;
  }

  // getting the upcoming activity
  List<ActivitySessionModel?> getUpcomingActivity(
      Map<String, List<ActivitySessionModel>> activities) {
    DateTime currentTime = DateTime.now();
    ActivitySessionModel? upcomingActivity;
    ActivitySessionModel? previousActivity;

    // getting the current day
    String currentDay = getDay(currentTime.toString());
    // previous Day just incase the first activity is the first one
    String previousDay = (currentTime.weekday - 1 - 1) < 0
        ? daysOfTheWeek[6]
        : daysOfTheWeek[(currentTime.weekday - 1 - 1)];

    List<ActivitySessionModel>? currentDayActivities = activities[currentDay];
    if (currentDayActivities != null) {
      // keeps track of where we are at the list
      int index = 0;
      // get upcoming activity
      for (ActivitySessionModel activity in currentDayActivities) {
        // the first activity greater than the current time is the upcoming
        if (DateTime.parse("${activity.date}T${activity.startTime}")
                .compareTo(currentTime) >
            0) {
          upcomingActivity = activity;
          break;
        }
        previousActivity = activity;
        index++;
      }
      // the first activity is the upcoming activity
      // so take the previous day activity
      if (index == 0) {
        previousActivity =
            activities[previousDay]?[activities[previousDay]!.length - 1];
      }
    }
    return [previousActivity, upcomingActivity];
  }

  // get the time difference between two activities
  Map<String, int> getTimeDiference(ActivitySessionModel upcomingActivity) {
    DateTime currentTime = DateTime.now();
    DateTime upcomingActivityDate = DateTime.parse(
        "${upcomingActivity.date}T${upcomingActivity.startTime}");
    Duration difference = upcomingActivityDate.difference(currentTime);
    return {
      "days": difference.inDays,
      "hours": difference.inHours,
      "minutes": difference.inMinutes,
      "seconds": difference.inSeconds,
    };
  }

  // converts time string to AM or PM format
  static String convertToAmPm(String timeString) {
    String convertTime;
    int hour = int.parse(timeString.substring(0, 2));
    if (hour > 12) {
      // return in pm format by subtracting 12
      hour -= 12;
      convertTime = "$hour${timeString.substring(2, 5)}PM";
    } else {
      // return in am format
      convertTime = "$hour${timeString.substring(2, 5)}AM";
    }
    return convertTime;
  }

  // converts time string to AM or PM format for otifications
  static String convertToAmPmNotif(String timeString) {
    String convertTime;
    DateTime notifTime = DateTime.parse(timeString);
    String timeMinutes =
        notifTime.minute > 10 ? "${notifTime.minute}" : "0${notifTime.minute}";

    if (notifTime.hour == 12) {
      convertTime = "${notifTime.hour}:${timeMinutes}PM";
    } else if (notifTime.hour == 0) {
      convertTime = "12:${timeMinutes}AM";
    } else if (notifTime.hour > 12) {
      // return in pm format
      convertTime = "${notifTime.hour - 12}:${timeMinutes}PM";
    } else {
      convertTime = "${notifTime.hour}:${timeMinutes}AM";
    }
    return convertTime;
  }
}
