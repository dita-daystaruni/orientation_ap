import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orientation_app/controllers/posts_controller.dart';
import 'package:orientation_app/controllers/usercontroller.dart';
import 'package:sliver_tools/sliver_tools.dart';

class AddFeedPage extends StatelessWidget {
  const AddFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController titleController = TextEditingController();
    final TextEditingController contentController = TextEditingController();
    final PostsController postsController = Get.find<PostsController>();
    final UserController userController = Get.find<UserController>();
    final ValueNotifier<XFile?> feedAttachment = ValueNotifier<XFile?>(null);
    final ValueNotifier<bool> isUploading = ValueNotifier<bool>(false);

    return Scaffold(
      body: Form(
        key: formKey,
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              expandedHeight: 100,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Add Feed"),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(12),
              sliver: MultiSliver(
                children: [
                  SliverPinnedHeader(
                    child: Container(
                      color: Theme.of(context).colorScheme.surface,
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        "Please specify title and content to upload a feed",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  TextFormField(
                    controller: titleController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Feed title is requred";
                      }
                      if (value.length < 5) {
                        return "Please provide a valid feed title";
                      }
                      return null;
                    },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: "Feed Title",
                      hintText: "e.g Sweet Food",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: contentController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Feed content is requred";
                      }
                      if (value.length < 10) {
                        return "Please provide a valid feed content";
                      }
                      return null;
                    },
                    // textAlign: TextAlign.center,
                    maxLines: 6,
                    decoration: InputDecoration(
                      labelText: "Feed Content",
                      alignLabelWithHint: true,
                      hintText: "e.g I think I love the food from Cafeteria",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  ValueListenableBuilder(
                      valueListenable: feedAttachment,
                      builder: (context, value, child) => Column(
                            children: [
                              value == null
                                  ? const SizedBox.shrink()
                                  : Container(
                                      margin: const EdgeInsets.only(top: 8.0),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.28,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: FileImage(
                                            File(value.path),
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                      ),
                                    ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () async {
                                      // pick an image
                                      final ImagePicker picker = ImagePicker();
                                      feedAttachment.value =
                                          await picker.pickImage(
                                        source: ImageSource.gallery,
                                      );
                                      // seeting image bytes value
                                    },
                                    icon: Icon(
                                      value == null
                                          ? Icons.add_a_photo_outlined
                                          : Icons.edit,
                                    ),
                                  ),
                                  Text(
                                    value == null
                                        ? "Attach Image"
                                        : "Change Picture",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  value != null
                                      ? IconButton(
                                          onPressed: () async {
                                            feedAttachment.value = null;
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                ],
                              ),
                            ],
                          )),
                  const SizedBox(height: 32),
                  ValueListenableBuilder(
                    valueListenable: isUploading,
                    builder: (context, value, child) => FilledButton(
                      onPressed: isUploading.value
                          ? null
                          : () async {
                              if (!formKey.currentState!.validate()) {
                                return;
                              }
                              isUploading.value = true;

                              await postsController.createPost(
                                titleController.text.trim(),
                                userController.user.value!.id,
                                contentController.text.trim(),
                                feedAttachment.value,
                              );

                              // clearing user data
                              titleController.clear();
                              contentController.clear();
                              feedAttachment.value = null;
                              isUploading.value = false;
                              // tell user feed upload was successfull
                              if (!context.mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Feed Uploaded Successfully"),
                                ),
                              );
                            },
                      child: const Text("Upload Feed"),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
