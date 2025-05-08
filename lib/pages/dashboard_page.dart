import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/controllers/posts_controller.dart';
import 'package:orientation_app/controllers/usercontroller.dart';
import 'package:orientation_app/widgets/post_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final UserController _userController = Get.find<UserController>();
  final PostsController _postsController = Get.find<PostsController>();

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _postsController.fetchPosts();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        _postsController.fetchPosts(
          loadMore: true,
        ); // Your method to fetch more
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await _postsController.fetchPosts();
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              pinned: true,
              snap: true,
              floating: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  "Hi ${_userController.user.value!.firstName}",
                ),
              ),
            ),
            Obx(
              () => SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return PostCard(
                      post: _postsController.posts[index],
                    );
                  },
                  childCount: _postsController.posts.length,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton:
          _userController.user.value!.expandedProfile!.role != "Student"
              ? FloatingActionButton(
                  onPressed: () async {
                    Get.toNamed("/add-feed");
                  },
                  child: const Icon(Icons.add),
                )
              : null,
    );
  }
}
