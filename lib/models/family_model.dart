import 'package:json_annotation/json_annotation.dart';
import 'user_model.dart';

part 'family_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Family {
  final String id;
  final String name;
  final String picture;
  final List<String> parent;

  final List<String> children;

  final String collectionId;
  final String collectionName;
  final DateTime created;
  final DateTime updated;

  /// Expanded fields from PocketBase (optional)
  final Map<String, dynamic>? expand;

  Family({
    required this.id,
    required this.name,
    required this.picture,
    required this.parent,
    required this.children,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.updated,
    this.expand,
  });

  factory Family.fromJson(Map<String, dynamic> json) => _$FamilyFromJson(json);
  Map<String, dynamic> toJson() => _$FamilyToJson(this);

  /// Helper to get expanded parent
  List<User> get expandedParent {
    if (expand != null && expand!["parent"] is List) {
      return (expand!['parent'] as List).map((e) => User.fromJson(e)).toList();
    }
    return [];
  }

  /// Helper to get expanded children
  List<User> get expandedChildren {
    if (expand != null && expand!['children'] is List) {
      return (expand!['children'] as List)
          .map((e) => User.fromJson(e))
          .toList();
    }
    return [];
  }
}
