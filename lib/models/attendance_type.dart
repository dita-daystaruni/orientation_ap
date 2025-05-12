import 'package:json_annotation/json_annotation.dart';

part 'attendance_type.g.dart';

@JsonSerializable()
class AttendanceType {
  final String collectionId;
  final String collectionName;
  final String id;
  final String name;
  final DateTime created;
  final DateTime updated;

  AttendanceType({
    required this.collectionId,
    required this.collectionName,
    required this.id,
    required this.name,
    required this.created,
    required this.updated,
  });

  factory AttendanceType.fromJson(Map<String, dynamic> json) =>
      _$AttendanceTypeFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceTypeToJson(this);
}

