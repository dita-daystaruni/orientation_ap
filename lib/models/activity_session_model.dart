// activity session model

class ActivitySessionModel {
  final int id;
  final String title;
  final String description;
  final String date;
  final String startTime;
  final String endTime;
  final String location;

  ActivitySessionModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        date = json['date'],
        startTime = json['start_time'],
        endTime = json['end_time'],
        // TODO confirm from clive decided name
        location = json['venue'];

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "date": date,
        "start_time": startTime,
        "end_time": endTime,
        "location": location,
      };
}
