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
  List<Map<String, String>> getDaysAndDate(
      Map<String, List<ActivitySessionModel>> activities) {
    List<Map<String, String>> daysAndDates = [];
    activities.forEach(
      (key, value) => daysAndDates.add(
        {
          "day": key,
          "date": DateTime.parse(value[0].date).day.toString(),
        },
      ),
    );
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
}

// // testing purposes
// void main() {
//   List<ActivitySessionModel> convertedExamples = [];
//   // iterate through the list and convert all the objects into activity instances
//   for (var example in exampleEvents) {
//     convertedExamples.add(
//       ActivitySessionModel.fromJson(example),
//     );
//   }
//   // group into days first
//   Map<String, List<ActivitySessionModel>> grouped =
//       CustomDateParser().groupActivitiesWithDay(convertedExamples);

//   // sort each activities accordingly
//   grouped.forEach(
//     (key, value) {
//       grouped[key] = CustomDateParser().sortWithStartTime(value);
//     },
//   );

//   // getting ongoing and upcoming activities
//   List<ActivitySessionModel?> activities =
//       CustomDateParser().getUpcomingActivity(grouped);

//   print("Ongoing activity is");
//   print(
//       "The date is ${activities[0]?.date} and time is ${activities[0]?.startTime}");
//   print("Upcoming activity is");
//   print(
//       "The date is ${activities[1]?.date} and time is ${activities[1]?.startTime}");
//   // getting the current task
//   // DateTime firstActivity = DateTime.parse(
//   //   "${grouped["Monday"]?[0].date}T${grouped["Monday"]?[0].startTime}",
//   // );
//   // print(CustomDateParser().daysOfTheWeek[firstActivity.weekday - 1 - 1]);
//   // print("The first activity is:");
//   // print(firstActivity);
//   // print("The time is:");
//   // print(DateTime.now());
//   // print(firstActivity.compareTo(DateTime.now()));
//   // CustomDateParser().getUpcomingActivity();
//   // grouped.forEach(
//   //   (key, value) {
//   //     print(key);
//   //     value.forEach(
//   //       (element) {
//   //         print(element.date);
//   //       },
//   //     );
//   //   },
//   // );

//   // // get day tiles data
//   // print(CustomDateParser().getDaysAndDate(grouped));
// }

// example list of events
var exampleEvents = [
  {
    "id": 1,
    "title": "Welcome Breakfast",
    "description": "A morning gathering to welcome freshmen with breakfast.",
    "date": "2024-08-26",
    "start_time": "08:00:00",
    "end_time": "10:00:00",
    "location": "Cafeteria",
    "is_session": false
  },
  {
    "id": 2,
    "title": "Campus Tour",
    "description": "A guided tour of the campus highlighting key locations.",
    "date": "2024-08-26",
    "start_time": "11:30:00",
    "end_time": "13:30:00",
    "location": "Main Gate",
    "is_session": false
  },
  {
    "id": 3,
    "title": "Freshmen Mixer",
    "description": "An interactive session to help freshmen meet and greet.",
    "date": "2024-08-26",
    "start_time": "15:00:00",
    "end_time": "17:00:00",
    "location": "Student Lounge",
    "is_session": false
  },
  {
    "id": 4,
    "title": "Evening Welcome Ceremony",
    "description":
        "Official ceremony to welcome all freshmen to the university.",
    "date": "2024-08-26",
    "start_time": "18:30:00",
    "end_time": "20:30:00",
    "location": "Amphitheatre",
    "is_session": false
  },
  {
    "id": 5,
    "title": "Academic Advising Session",
    "description":
        "Session with academic advisors to discuss course selection and schedules.",
    "date": "2024-08-27",
    "start_time": "09:00:00",
    "end_time": "11:00:00",
    "location": "Lecture Hall A",
    "is_session": false
  },
  {
    "id": 6,
    "title": "Student Clubs Fair",
    "description":
        "An event showcasing various student clubs and organizations.",
    "date": "2024-08-27",
    "start_time": "12:00:00",
    "end_time": "14:00:00",
    "location": "Quad",
    "is_session": false
  },
  {
    "id": 7,
    "title": "Library Orientation",
    "description": "Introduction to the library resources and services.",
    "date": "2024-08-27",
    "start_time": "14:30:00",
    "end_time": "16:30:00",
    "location": "Library Hall",
    "is_session": false
  },
  {
    "id": 8,
    "title": "Evening Social",
    "description": "A social event for freshmen to interact and relax.",
    "date": "2024-08-27",
    "start_time": "18:00:00",
    "end_time": "20:00:00",
    "location": "Student Centre",
    "is_session": false
  },
  {
    "id": 9,
    "title": "Fitness Orientation",
    "description":
        "Introduction to the fitness facilities and programs on campus.",
    "date": "2024-08-28",
    "start_time": "07:30:00",
    "end_time": "09:30:00",
    "location": "Gym",
    "is_session": false
  },
  {
    "id": 10,
    "title": "IT Services Overview",
    "description": "Overview of the IT services available to students.",
    "date": "2024-08-28",
    "start_time": "10:00:00",
    "end_time": "12:00:00",
    "location": "IT Lab",
    "is_session": false
  },
  {
    "id": 11,
    "title": "Cultural Showcase",
    "description":
        "An event celebrating the diverse cultures within the university.",
    "date": "2024-08-28",
    "start_time": "13:00:00",
    "end_time": "15:00:00",
    "location": "Auditorium",
    "is_session": false
  },
  {
    "id": 12,
    "title": "Movie Night",
    "description": "A relaxing movie night for freshmen.",
    "date": "2024-08-28",
    "start_time": "18:30:00",
    "end_time": "20:30:00",
    "location": "Outdoor Cinema",
    "is_session": false
  },
  {
    "id": 13,
    "title": "Career Services Introduction",
    "description": "Introduction to the career services available to students.",
    "date": "2024-08-29",
    "start_time": "08:30:00",
    "end_time": "10:30:00",
    "location": "Career Office",
    "is_session": false
  },
  {
    "id": 14,
    "title": "Group Study Session",
    "description": "A session encouraging group study and collaboration.",
    "date": "2024-08-29",
    "start_time": "11:00:00",
    "end_time": "13:00:00",
    "location": "Study Hall",
    "is_session": false
  },
  {
    "id": 15,
    "title": "Community Service Briefing",
    "description": "Briefing on community service opportunities for students.",
    "date": "2024-08-29",
    "start_time": "14:00:00",
    "end_time": "16:00:00",
    "location": "Community Centre",
    "is_session": false
  },
  {
    "id": 16,
    "title": "Game Night",
    "description": "An evening of fun games and activities for freshmen.",
    "date": "2024-08-29",
    "start_time": "19:00:00",
    "end_time": "21:00:00",
    "location": "Student Lounge",
    "is_session": false
  },
  {
    "id": 17,
    "title": "Health and Wellness Session",
    "description": "Session focusing on student health and wellness.",
    "date": "2024-08-30",
    "start_time": "08:00:00",
    "end_time": "10:00:00",
    "location": "Health Centre",
    "is_session": false
  },
  {
    "id": 18,
    "title": "Mentorship Program Launch",
    "description": "Launch of the student mentorship program.",
    "date": "2024-08-30",
    "start_time": "11:00:00",
    "end_time": "13:00:00",
    "location": "Conference Room",
    "is_session": false
  },
  {
    "id": 19,
    "title": "Outdoor Team Building",
    "description": "Outdoor team-building activities for freshmen.",
    "date": "2024-08-30",
    "start_time": "15:00:00",
    "end_time": "17:00:00",
    "location": "Sports Field",
    "is_session": false
  },
  {
    "id": 20,
    "title": "Closing Ceremony",
    "description": "Final event to close the freshmen welcome week.",
    "date": "2024-08-30",
    "start_time": "19:00:00",
    "end_time": "21:00:00",
    "location": "Amphitheatre",
    "is_session": false
  }
];
