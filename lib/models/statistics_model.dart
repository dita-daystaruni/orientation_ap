import 'package:json_annotation/json_annotation.dart';

part 'statistics_model.g.dart';

@JsonSerializable()
class StatisticsModel {
  @JsonKey(name: 'total_students')
  final int? totalStudents;

  @JsonKey(name: 'male_students')
  final int? maleStudents;

  @JsonKey(name: 'female_students')
  final int? femaleStudents;

  @JsonKey(name: 'nairobi_students')
  final int? nairobiStudents;

  @JsonKey(name: 'athi_river_students')
  final int? athiRiverStudents;

  @JsonKey(name: 'dayscholar_students')
  final int? dayScholarStudents;

  @JsonKey(name: 'boarder_students')
  final int? boarderStudents;


  @JsonKey(name: 'parents')
  final int? parents;


  @JsonKey(name: 'g9s')
  final int? g9s;

  StatisticsModel({
    this.totalStudents,
    this.maleStudents,
    this.femaleStudents,
    this.nairobiStudents,
    this.athiRiverStudents,
    this.dayScholarStudents,
    this.boarderStudents,
    this.parents,
    this.g9s,
  });

  factory StatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$StatisticsModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticsModelToJson(this);
}
