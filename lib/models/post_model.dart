import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class Post {
  final String collectionId;
  final String collectionName;
  final String id;
  final String title;
  final String owner;
  final String content;
  final List<String> attachement;
  final List<String> tags;
  final List<String> upVotedBy;
  final List<String> downVotedBy;
  final DateTime created;
  final DateTime updated;

  Post({
    required this.collectionId,
    required this.collectionName,
    required this.id,
    required this.title,
    required this.owner,
    required this.content,
    required this.attachement,
    required this.tags,
    required this.upVotedBy,
    required this.downVotedBy,
    required this.created,
    required this.updated,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
