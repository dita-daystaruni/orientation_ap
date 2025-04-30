// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      collectionId: json['collectionId'] as String,
      collectionName: json['collectionName'] as String,
      id: json['id'] as String,
      email: json['email'] as String,
      emailVisibility: json['emailVisibility'] as bool,
      verified: json['verified'] as bool,
      firstName: json['firstName'] as String,
      otherNames: json['otherNames'] as String,
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
      admissionNumber: json['admissionNumber'] as String,
      created: DateTime.parse(json['created'] as String),
      updated: DateTime.parse(json['updated'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'collectionId': instance.collectionId,
      'collectionName': instance.collectionName,
      'id': instance.id,
      'email': instance.email,
      'emailVisibility': instance.emailVisibility,
      'verified': instance.verified,
      'firstName': instance.firstName,
      'otherNames': instance.otherNames,
      'profile': instance.profile,
      'admissionNumber': instance.admissionNumber,
      'created': instance.created.toIso8601String(),
      'updated': instance.updated.toIso8601String(),
    };

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      collectionId: json['collectionId'] as String,
      collectionName: json['collectionName'] as String,
      id: json['id'] as String,
      parent: json['parent'] as String,
      profilePicture: json['profilePicture'] as String,
      residence: json['residence'] as String,
      programme: json['programme'] as String,
      gender: json['gender'] as String,
      role: json['role'] as String,
      reported: json['reported'] as bool,
      campus: json['campus'] as String,
      phoneNumber: json['phoneNumber'] as String,
      schoolEmail: json['schoolEmail'] as String,
      created: DateTime.parse(json['created'] as String),
      updated: DateTime.parse(json['updated'] as String),
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'collectionId': instance.collectionId,
      'collectionName': instance.collectionName,
      'id': instance.id,
      'parent': instance.parent,
      'profilePicture': instance.profilePicture,
      'residence': instance.residence,
      'programme': instance.programme,
      'gender': instance.gender,
      'role': instance.role,
      'reported': instance.reported,
      'campus': instance.campus,
      'phoneNumber': instance.phoneNumber,
      'schoolEmail': instance.schoolEmail,
      'created': instance.created.toIso8601String(),
      'updated': instance.updated.toIso8601String(),
    };
