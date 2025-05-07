import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:orientation_app/models/post_model.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});
  final Post post;

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
            title: Text(post.title),
            subtitle: Text(post.owner),
          ),
          Visibility(
            visible: post.attachement.isNotEmpty,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 350,
                maxWidth: MediaQuery.of(context).size.width,
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final attachmentUrl = post.attachement[index];
                  return SizedBox(
                    height: 600,
                    width: MediaQuery.of(context).size.width,
                    child: CachedNetworkImage(
                      imageUrl: attachmentUrl,
                      fit: BoxFit.cover,
                    ),
                  );
                },
                itemCount: post.attachement.length,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              post.content,
            ),
          ),
        ],
      ),
    );
  }
}
