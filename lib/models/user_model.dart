import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  final String collectionId;
  final String collectionName;
  final String id;
  final String email;
  final bool emailVisibility;
  final bool verified;
  final String firstName;
  final String otherNames;
  final String? profile;
  final String admissionNumber;
  final DateTime created;
  final DateTime updated;

  /// Expanded fields from PocketBase (optional)
  final Map<String, dynamic>? expand;

  User({
    required this.collectionId,
    required this.collectionName,
    required this.id,
    required this.email,
    required this.emailVisibility,
    required this.verified,
    required this.firstName,
    required this.otherNames,
    this.profile,
    this.expand,
    required this.admissionNumber,
    required this.created,
    required this.updated,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  /// Helper to get expanded profile
  Profile? get expandedProfile {
    if (expand != null && expand!.containsKey('profile')) {
      return Profile.fromJson(expand!['profile']);
    }
    return null;
  }
}

@JsonSerializable()
class Profile {
  final String collectionId;
  final String collectionName;
  final String id;
  final String parent;
  final String profilePicture;
  final String residence;
  final String programme;
  final String gender;
  final String role;
  final bool reported;
  final String campus;
  final String phoneNumber;
  final String schoolEmail;
  final DateTime created;
  final DateTime updated;

  Profile({
    required this.collectionId,
    required this.collectionName,
    required this.id,
    required this.parent,
    required this.profilePicture,
    required this.residence,
    required this.programme,
    required this.gender,
    required this.role,
    required this.reported,
    required this.campus,
    required this.phoneNumber,
    required this.schoolEmail,
    required this.created,
    required this.updated,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
