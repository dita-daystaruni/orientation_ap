import 'package:orientation_app/models/parent_model.dart';

// user model
class User {
  final int userId;
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String campus;
  final String userType;
  final String admNo;
  final String course;
  final String phoneNo;
  final String token;
  final String gender;
  final String accomodation;
  final FreshManParent? parent;

  User.fromJson(Map<String, dynamic> json)
      : userId = json['user_id'],
        firstName = json['first_name'],
        lastName = json['last_name'],
        userName = json['username'],
        email = json['email'],
        phoneNo = json['phone_number'],
        campus = json['campus'],
        userType = json['user_type'],
        admNo = json['admission_number'],
        course = json['course'],
        parent = json['parent'] != null
            ? FreshManParent.fromJson(json["parent"])
            : null,
        gender = json['gender'],
        accomodation = json['accomodation'],
        token = json['token'];

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'first_name': firstName,
        'last_name': lastName,
        'username': userName,
        'email': email,
        'campus': campus,
        'user_type': userType,
        'admission_number': admNo,
        'course': course,
        'phone_number': phoneNo,
        'token': token,
        'parent': parent?.toJson(),
        'gender': gender,
        'accomodation': accomodation,
      };
}
