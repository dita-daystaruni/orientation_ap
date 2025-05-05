import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:orientation_app/models/post_model.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key, required this.post});
  final Post post;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  void initState() {
    super.initState();
    Logger().d(widget.post.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: Text(widget.post.title),
            subtitle: Text(widget.post.owner),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 350,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final attachmentUrl = widget.post.attachement[index];
                return SizedBox(
                  height: 600,
                  width: MediaQuery.of(context).size.width,
                  child: CachedNetworkImage(
                    imageUrl: attachmentUrl,
                    fit: BoxFit.cover,
                  ),
                );
              },
              itemCount: widget.post.attachement.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              widget.post.content,
            ),
          ),
        ],
      ),
    );
  }
}
