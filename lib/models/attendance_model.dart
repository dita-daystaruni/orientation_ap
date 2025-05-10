import 'package:json_annotation/json_annotation.dart';
import 'package:orientation_app/models/attendance_type.dart';
import 'package:orientation_app/models/user_model.dart';

part 'attendance_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Attendance {
  final String id;
  final String name;
  final String markedBy;
  final String family;
  final List<String> marked;
  final String type;

  final String collectionId;
  final String collectionName;

  final DateTime created;
  final DateTime updated;

  /// Expanded fields from PocketBase (optional)
  final Map<String, dynamic>? expand;

  Attendance({
    required this.id,
    required this.family,
    required this.name,
    required this.markedBy,
    required this.marked,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.updated,
    required this.type,
    this.expand,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) =>
      _$AttendanceFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceToJson(this);

  List<User> get expandedChildren {
    if (expand != null && expand!['marked'] is List) {
      return (expand!['marked'] as List).map((e) => User.fromJson(e)).toList();
    }
    return [];
  }

  AttendanceType? get expandedAttendanceType {
    if (expand != null && expand!['type'] is Map) {
      return AttendanceType.fromJson(expand!["type"]);
    }
    return null;
  }

  // Returns the user  who marked the attendance
  User? get expandedMarker {
    if (expand != null && expand!['markedBy'] is Map) {
      return User.fromJson(expand!["markedBy"]);
    }
    return null;
  }
}
