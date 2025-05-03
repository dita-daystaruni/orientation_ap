// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      collectionId: json['collectionId'] as String,
      collectionName: json['collectionName'] as String,
      id: json['id'] as String,
      title: json['title'] as String,
      owner: json['owner'] as String,
      content: json['content'] as String,
      attachement: (json['attachement'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      upVotedBy:
          (json['upVotedBy'] as List<dynamic>).map((e) => e as String).toList(),
      downVotedBy: (json['downVotedBy'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      created: DateTime.parse(json['created'] as String),
      updated: DateTime.parse(json['updated'] as String),
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'collectionId': instance.collectionId,
      'collectionName': instance.collectionName,
      'id': instance.id,
      'title': instance.title,
      'owner': instance.owner,
      'content': instance.content,
      'attachement': instance.attachement,
      'tags': instance.tags,
      'upVotedBy': instance.upVotedBy,
      'downVotedBy': instance.downVotedBy,
      'created': instance.created.toIso8601String(),
      'updated': instance.updated.toIso8601String(),
    };
