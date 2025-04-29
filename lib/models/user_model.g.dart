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
      profile: json['profile'] as String,
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
