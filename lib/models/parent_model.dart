class FreshManParent {
  final int parentId;
  final String firstName;
  final String lastName;
  final String admNo;
  final String campus;

  FreshManParent.fromJson(Map<String, dynamic> json)
      : parentId = json['id'],
        firstName = json['first_name'],
        lastName = json['last_name'],
        admNo = json['admission_number'],
        campus = json['campus'];

  Map<String, String> toJson() {
    return {
      'id': parentId as String,
      'first_name': firstName,
      'last_name': lastName,
      'admission_number': admNo,
      'campus': campus
    };
  }
}
