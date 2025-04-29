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
  final String profile;
  final String admissionNumber;
  final DateTime created;
  final DateTime updated;

  User({
    required this.collectionId,
    required this.collectionName,
    required this.id,
    required this.email,
    required this.emailVisibility,
    required this.verified,
    required this.firstName,
    required this.otherNames,
    required this.profile,
    required this.admissionNumber,
    required this.created,
    required this.updated,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
