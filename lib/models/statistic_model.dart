// faq model
class StatisticsModel {
  final int totalStudents;
  final int maleStudents;
  final int femaleStudents;
  final int nairobiStudents;
  final int athiRiverStudents;
  final int dayScholarStudents;
  final int boarderStudents;

  StatisticsModel.fromJson(Map<String, dynamic> json)
      : totalStudents = json["total_students"],
        maleStudents = json["male_students"],
        femaleStudents = json["female_students"],
        nairobiStudents = json["nairobi_students"],
        athiRiverStudents = json["athi_river_students"],
        dayScholarStudents = json["dayscholar_students"],
        boarderStudents = json["boarder_students"];

  Map<String, dynamic> toJson() => {
        "total_students": totalStudents,
        "male_students": maleStudents,
        "female_students": femaleStudents,
        "nairobi_students": nairobiStudents,
        "athi_river_students": athiRiverStudents,
        "dayscholar_students": dayScholarStudents,
        "boarder_students": boarderStudents,
      };
}
