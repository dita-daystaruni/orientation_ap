class UserContact {
  
  final int userId;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNo;
  final String title;

  UserContact.fromJson(Map<String, dynamic> json)
      : userId = json['id'],
        firstName = json['first_name'],
        lastName = json['last_name'],
        email = json['email'],
        phoneNo = json['phone_number'],
        title = json['user_type'];

  Map<String, String> toJson() {
    return {
      'id': userId as String,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNo,
      'email': email,
      'user_type': title,
    };
  }
}
