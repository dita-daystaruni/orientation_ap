// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Family _$FamilyFromJson(Map<String, dynamic> json) => Family(
      id: json['id'] as String,
      name: json['name'] as String,
      picture: json['picture'] as String,
      parent:
          (json['parent'] as List<dynamic>).map((e) => e as String).toList(),
      children:
          (json['children'] as List<dynamic>).map((e) => e as String).toList(),
      collectionId: json['collectionId'] as String,
      collectionName: json['collectionName'] as String,
      created: DateTime.parse(json['created'] as String),
      updated: DateTime.parse(json['updated'] as String),
      expand: json['expand'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$FamilyToJson(Family instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picture': instance.picture,
      'parent': instance.parent,
      'children': instance.children,
      'collectionId': instance.collectionId,
      'collectionName': instance.collectionName,
      'created': instance.created.toIso8601String(),
      'updated': instance.updated.toIso8601String(),
      'expand': instance.expand,
    };
