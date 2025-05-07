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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
            () => SliverList.builder(
              itemBuilder: (context, index) {
                return PostCard(
                  post: _postsController.posts[index],
                );
              },
              itemCount: _postsController.posts.value.length,
            ),
          )
        ],
      ),
      floatingActionButton:
          // confirm from Erick they can't be null here
          _userController.user.value!.expandedProfile!.role != "Student"
              ? FloatingActionButton(
                  onPressed: () async {
                    print(_userController.user.value!.id);
                    Get.toNamed("/add-feed");
                  },
                  child: const Icon(Icons.add),
                )
              : null,
    );
  }
}
