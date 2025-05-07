import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/controllers/family_controller.dart';
import 'package:orientation_app/controllers/usercontroller.dart';
import 'package:orientation_app/pages/user_view_page.dart';
import 'package:orientation_app/widgets/family_stat_card.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FamilyPage extends StatefulWidget {
  const FamilyPage({super.key});

  @override
  State<FamilyPage> createState() => _FamilyPageState();
}

class _FamilyPageState extends State<FamilyPage> {
  final UserController _userController = Get.find<UserController>();
  final FamilyController _familyController = Get.find<FamilyController>();

  @override
  void initState() {
    super.initState();
    _familyController.fetchFamilyDetails(_userController.user.value!.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          Obx(
            () => SliverAppBar(
              pinned: true,
              floating: true,
              snap: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  _familyController.family.value?.name ?? "My Family",
                ),
              ),
            ),
          ),

          // Parent Stats
          SliverVisibility(
            visible: _userController.user.value!.expandedProfile!.role == "G9",
            sliver: SliverPadding(
              padding: const EdgeInsets.all(12),
              sliver: MultiSliver(
                children: [
                  SliverPinnedHeader(
                    child: Text(
                      "Orientation View",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  Card(
                    elevation: 0,
                    margin: const EdgeInsets.all(1),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    )),
                    child: ListTile(
                      leading: const Icon(Icons.analytics),
                      title: const Text("View Orientation Dashboard"),
                      onTap: () async {
                        Get.toNamed("/g9-dashboard-view");
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Parent Stats
          SliverVisibility(
            visible: _userController.user.value!.expandedProfile!.role ==
                "Dulous Parent",
            sliver: SliverPadding(
              padding: const EdgeInsets.all(12),
              sliver: MultiSliver(
                children: [
                  SliverPinnedHeader(
                    child: Text(
                      "Family Statistics",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  Obx(
                    () => Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        FamilyStatCard(
                          stat: _familyController
                              .family.value!.expandedChildren.length,
                          description: "Number of children",
                          icon: Icons.child_friendly,
                          color: Colors.green[600],
                        ),
                        FamilyStatCard(
                          stat: _familyController.family.value!.expandedChildren
                              .where(
                                (u) =>
                                    u.expandedProfile!.campus == "Athi River",
                              )
                              .length,
                          description: "Athi River Students",
                          icon: Icons.school,
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                        ),
                        FamilyStatCard(
                          stat: _familyController.family.value!.expandedChildren
                              .where(
                                (u) => u.expandedProfile!.campus == "Nairobi",
                              )
                              .length,
                          description: "Nairobi Students",
                          icon: Icons.school_outlined,
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                        ),
                        FamilyStatCard(
                          stat: _familyController.family.value!.expandedChildren
                              .where(
                                (u) => u.expandedProfile!.campus == "Nairobi",
                              )
                              .length,
                          description: "Reported on last count",
                          icon: Icons.check_box,
                          color: Colors.orange[600],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  SliverPinnedHeader(
                    child: Text(
                      "Family Actions",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  Card(
                    elevation: 0,
                    margin: const EdgeInsets.all(1),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                    )),
                    child: ListTile(
                      leading: const Icon(Icons.checklist),
                      title: const Text("Mark chilren attendance"),
                      onTap: () async {},
                    ),
                  ),
                  Card(
                    elevation: 0,
                    margin: const EdgeInsets.all(1),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                    child: ListTile(
                      leading: const Icon(Icons.notifications),
                      title:
                          const Text("Send push notification to all children"),
                      onTap: () async {
                        Get.toNamed("/send-push-notification");
                      },
                    ),
                  ),
                  Card(
                    elevation: 0,
                    margin: const EdgeInsets.all(1),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(12),
                    )),
                    child: ListTile(
                      leading: const Icon(Icons.person_add),
                      title: const Text("Add child to group"),
                      onTap: () async {
                        Get.toNamed("/add-child-to-family");
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(12),
            sliver: MultiSliver(
              children: [
                SliverPinnedHeader(
                  child: Text(
                    "Family View",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                // All Members

                Obx(() {
                  return SliverList.builder(
                    itemBuilder: (context, index) {
                      final user = _familyController
                          .family.value!.expandedChildren[index];
                      return ListTile(
                        leading: const CircleAvatar(),
                        title: Text(
                          user.id == _userController.user.value!.id
                              ? "You"
                              : "${user.firstName} ${user.otherNames}",
                        ),
                        subtitle: Text(user.admissionNumber),
                        trailing: user.id == _userController.user.value!.id
                            ? null
                            : IconButton(
                                onPressed: () {
                                  launchUrlString(
                                    "tel://${user.expandedProfile!.phoneNumber}",
                                  );
                                },
                                icon: const Icon(Icons.call),
                              ),
                        onTap: () {
                          Get.to(UserViewPage(user: user));
                        },
                      );
                    },
                    itemCount: _familyController
                            .family.value?.expandedChildren.length ??
                        0,
                  );
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
