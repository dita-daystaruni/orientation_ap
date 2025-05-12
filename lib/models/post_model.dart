import 'package:json_annotation/json_annotation.dart';
import 'package:orientation_app/models/user_model.dart';

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

  /// Expanded fields from PocketBase (optional)
  final Map<String, dynamic>? expand;

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
    this.expand,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);

  /// Helper to get expanded parent
  User? get expandedOwner {
    if (expand != null && expand!.containsKey("owner")) {
      return User.fromJson((expand!['owner']));
    }
    return null;
  }
}
