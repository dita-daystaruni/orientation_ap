// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attendance _$AttendanceFromJson(Map<String, dynamic> json) => Attendance(
      id: json['id'] as String,
      family: json['family'] as String,
      name: json['name'] as String,
      markedBy: json['markedBy'] as String,
      marked:
          (json['marked'] as List<dynamic>).map((e) => e as String).toList(),
      collectionId: json['collectionId'] as String,
      collectionName: json['collectionName'] as String,
      created: DateTime.parse(json['created'] as String),
      updated: DateTime.parse(json['updated'] as String),
      type: json['type'] as String,
      expand: json['expand'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$AttendanceToJson(Attendance instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'markedBy': instance.markedBy,
      'family': instance.family,
      'marked': instance.marked,
      'type': instance.type,
      'collectionId': instance.collectionId,
      'collectionName': instance.collectionName,
      'created': instance.created.toIso8601String(),
      'updated': instance.updated.toIso8601String(),
      'expand': instance.expand,
    };
