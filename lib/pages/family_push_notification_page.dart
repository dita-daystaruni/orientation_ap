import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/controllers/family_controller.dart';
import 'package:orientation_app/controllers/notifications_controller.dart';
import 'package:orientation_app/controllers/usercontroller.dart';
import 'package:orientation_app/models/user_model.dart';
import 'package:sliver_tools/sliver_tools.dart';

class FamilyPushNotificationPage extends StatefulWidget {
  const FamilyPushNotificationPage({super.key});

  @override
  State<FamilyPushNotificationPage> createState() =>
      _FamilyPushNotificationPageState();
}

class _FamilyPushNotificationPageState
    extends State<FamilyPushNotificationPage> {
  final formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final NotificationController notificationController =
      Get.find<NotificationController>();
  final UserController userController = Get.find<UserController>();
  final FamilyController familyController = Get.find<FamilyController>();

  Future<List<String>?> showUserSelectionDialog(List<User> users) async {
    final selectedPlayerEmails = <String>{};
    final searchController = TextEditingController();
    List<User> filteredUsers = List.from(users);

    return await showDialog<List<String>>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            void filterUsers(String query) {
              setState(() {
                filteredUsers = users
                    .where((user) => user.admissionNumber
                        .toLowerCase()
                        .contains(query.toLowerCase()))
                    .toList();
              });
            }

            return AlertDialog(
              title: const Text('Select Recipients'),
              content: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                        hintText: 'Search by admission number',
                        prefixIcon: Icon(Icons.search),
                      ),
                      onChanged: filterUsers,
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: ListView.builder(
                        itemCount: filteredUsers.length,
                        itemBuilder: (context, index) {
                          final user = filteredUsers[index];
                          final email = user.expandedProfile?.schoolEmail ?? '';
                          final isSelected =
                              selectedPlayerEmails.contains(email);
                          return CheckboxListTile(
                            value: isSelected,
                            onChanged: (val) {
                              setState(() {
                                if (val == true) {
                                  selectedPlayerEmails.add(email);
                                } else {
                                  selectedPlayerEmails.remove(email);
                                }
                              });
                            },
                            title: Text('${user.firstName} ${user.otherNames}'),
                            subtitle: Text(user.admissionNumber),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, null),
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, selectedPlayerEmails.toList());
                  },
                  child: const Text("Send"),
                ),
              ],
            );
          },
        );
      },
    );
  }



  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    final role = userController.user.value!.expandedProfile!.role;

    return Scaffold(
      body: Form(
        key: formKey,
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Push notification configuration"),
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
                        "Please specify a title and a body to send push notifications to your children",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  TextFormField(
                    controller: titleController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.trim().length < 5) {
                        return "Please provide a valid push notification title";
                      }
                      return null;
                    },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: "Push Notification Title",
                      hintText: "e.g Reminder",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: bodyController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.trim().length < 5) {
                        return "Please provide a valid push notification body";
                      }
                      return null;
                    },
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: "Push Notification Body",
                      hintText:
                          "e.g Please remember to carry your details tomorrow",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  SliverVisibility(
                    visible: role == "G9",
                    sliver: MultiSliver(
                      children: [
                        FilledButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              final result = await notificationController
                                  .sendPushNotification(
                                titleController.text.trim(),
                                bodyController.text.trim(),
                              );
                              if (!context.mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(result)));
                            }
                          },
                          child: const Text("Send to All"),
                        ),
                        const SizedBox(height: 12),
                        FilledButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              await userController.fetchAllUsers();
                              final recipients = userController.allUsers;
                              final selected =
                                  await showUserSelectionDialog(recipients);
                              if (selected == null || selected.isEmpty) return;

                              final result = await notificationController
                                  .sendPushNotification(
                                titleController.text.trim(),
                                bodyController.text.trim(),
                                selected,
                              );
                              if (!context.mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(result)));
                            }
                          },
                          child: const Text("Select Recipients"),
                        ),
                      ],
                    ),
                  ),
                  SliverVisibility(
                    visible: role != "G9",
                    sliver: FilledButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          final children =
                              familyController.family.value?.expandedChildren ??
                                  [];
                          final targetEmails = children
                              .map(
                                  (child) => child.expandedProfile?.schoolEmail)
                              .where(
                                  (email) => email != null && email.isNotEmpty)
                              .cast<String>()
                              .toList();

                          final result =
                              await notificationController.sendPushNotification(
                            titleController.text.trim(),
                            bodyController.text.trim(),
                            targetEmails,
                          );
                          if (!context.mounted) return;
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(result)));
                        }
                      },
                      child: const Text("Send Push Notification"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
