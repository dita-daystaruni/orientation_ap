// activity session model

class ActivityModel {
  final String id;
  final String title;
  final String description;
  // converting to and from to datetimes local times here might make the work easier
  final DateTime from;
  final DateTime to;
  final String venue;
  final bool isMultiple;

  ActivityModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        from = DateTime.parse(json['from']).toLocal(),
        to = DateTime.parse(json['to']).toLocal(),
        venue = json['venue'],
        isMultiple = json['multiple'];

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "from": from.toIso8601String(),
        "to": to.toIso8601String(),
        "venue": venue,
        "multiple": isMultiple,
      };
}
