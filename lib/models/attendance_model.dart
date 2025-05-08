import 'package:json_annotation/json_annotation.dart';
import 'package:orientation_app/models/user_model.dart';

part 'attendance_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Attendance {
  final String id;
  final String name;
  final String markedBy;
  final List<String> marked;

  final String collectionId;
  final String collectionName;

  final DateTime created;
  final DateTime updated;

  /// Expanded fields from PocketBase (optional)
  final Map<String, dynamic>? expand;

  Attendance({
    required this.id,
    required this.name,
    required this.markedBy,
    required this.marked,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.updated,
    this.expand,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) =>
      _$AttendanceFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceToJson(this);

  List<User> get expandedChildren {
    if (expand != null && expand!['marked'] is List) {
      return (expand!['marked'] as List)
          .map((e) => User.fromJson(e))
          .toList();
    }
    return [];
  }
}
