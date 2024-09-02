class FreshManParent {
  final int parentId;
  final String firstName;
  final String lastName;
  final String admNo;
  final String campus;
  final String email;
  final String phoneNo;

  FreshManParent.fromJson(Map<String, dynamic> json)
      : parentId = json['id'],
        firstName = json['first_name'],
        lastName = json['last_name'],
        admNo = json['admission_number'],
        campus = json['campus'],
        phoneNo = json['phone_number'],
        email = json['email'];

  Map<String, dynamic> toJson() {
    return {
      'id': parentId,
      'first_name': firstName,
      'last_name': lastName,
      'admission_number': admNo,
      'campus': campus,
      'email': email,
      'phone_number': phoneNo,
    };
  }
}
