// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceType _$AttendanceTypeFromJson(Map<String, dynamic> json) =>
    AttendanceType(
      collectionId: json['collectionId'] as String,
      collectionName: json['collectionName'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      created: DateTime.parse(json['created'] as String),
      updated: DateTime.parse(json['updated'] as String),
    );

Map<String, dynamic> _$AttendanceTypeToJson(AttendanceType instance) =>
    <String, dynamic>{
      'collectionId': instance.collectionId,
      'collectionName': instance.collectionName,
      'id': instance.id,
      'name': instance.name,
      'created': instance.created.toIso8601String(),
      'updated': instance.updated.toIso8601String(),
    };
