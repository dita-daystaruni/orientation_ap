// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatisticsModel _$StatisticsModelFromJson(Map<String, dynamic> json) =>
    StatisticsModel(
      totalStudents: (json['total_students'] as num?)?.toInt(),
      maleStudents: (json['male_students'] as num?)?.toInt(),
      femaleStudents: (json['female_students'] as num?)?.toInt(),
      nairobiStudents: (json['nairobi_students'] as num?)?.toInt(),
      athiRiverStudents: (json['athi_river_students'] as num?)?.toInt(),
      dayScholarStudents: (json['dayscholar_students'] as num?)?.toInt(),
      boarderStudents: (json['boarder_students'] as num?)?.toInt(),
      parents: (json['parents'] as num?)?.toInt(),
      g9s: (json['g9s'] as num?)?.toInt(),
    );

Map<String, dynamic> _$StatisticsModelToJson(StatisticsModel instance) =>
    <String, dynamic>{
      'total_students': instance.totalStudents,
      'male_students': instance.maleStudents,
      'female_students': instance.femaleStudents,
      'nairobi_students': instance.nairobiStudents,
      'athi_river_students': instance.athiRiverStudents,
      'dayscholar_students': instance.dayScholarStudents,
      'boarder_students': instance.boarderStudents,
      'parents': instance.parents,
      'g9s': instance.g9s,
    };
