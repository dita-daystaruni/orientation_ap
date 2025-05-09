import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:orientation_app/models/post_model.dart';
import 'package:pocketbase/pocketbase.dart';

class PostsController extends GetxController {
  final Logger _logger = Logger();
  RxList<Post> posts = RxList<Post>();

  int _page = 1;
  final int _perPage = 500;
  bool _isLastPage = false;
  bool _isFetching = false;

  Future<Either<String, List<Post>>> fetchPosts({bool loadMore = false}) async {
    if (_isFetching || (_isLastPage && loadMore)) return right(posts);

    _isFetching = true;

    try {
      final PocketBase pocketBase = GetIt.instance.get<PocketBase>();

      // Only increment page if loading more and not on the last page
      final int pageToFetch = loadMore ? _page + 1 : 1;

      final result = await pocketBase.collection("posts").getList(
            page: pageToFetch,
            perPage: _perPage,
            sort: "-created",
          );

      final List<Post> newPosts = [];

      for (final item in result.items) {
        final attachments = item.getListValue<String>("attachement");
        final urls = attachments
            .map((name) => pocketBase.files.getUrl(item, name).toString())
            .toList();
        final Post post = Post.fromJson(item.toJson());
        post.attachement.clear();
        post.attachement.addAll(urls);
        newPosts.add(post);
      }

      _logger.i("Posts loaded successfully");

      if (loadMore) {
        posts.addAll(newPosts);
        _page++; // increment page after successful load
      } else {
        posts.assignAll(newPosts);
        _page = 1; // reset page on fresh load
      }

      _isLastPage = newPosts.length < _perPage;
      _isFetching = false;

      return right(posts);
    } catch (e) {
      _isFetching = false;
      _logger.e("Error fetching posts", error: e);
      return left("Failed to fetch posts: $e");
    }
  }

  Future createPost(String title, String owner, String content,
      [XFile? feedAttachment]) async {
    try {
      final PocketBase pocketBase = GetIt.instance.get<PocketBase>();
      final result = await pocketBase.collection("posts").create(
        body: {
          'title': title,
          'owner': owner,
          'content': content,
        },
        files: feedAttachment != null
            ? [
                await http.MultipartFile.fromPath(
                  "attachement",
                  feedAttachment.path,
                ),
              ]
            : [],
      );
    } catch (e) {
      // TODO convert to use Either error handling
      print(e);
      rethrow;
    }
//     pb.collection('example').create(
//   body: {
//     'title': 'Hello world!',
//     // ... any other regular field
//   },
//   files: [
//     http.MultipartFile.fromString(
//       'document', // the name of the file field
//       'example content...',
//       filename: 'example_document.txt',
//     ),
//   ],
// ).then((record) {
//   print(record.id);
//   print(record.get<String>('title'));
// });
  }
}
