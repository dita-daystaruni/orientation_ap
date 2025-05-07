import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:orientation_app/models/family_model.dart';
import 'package:orientation_app/pages/user_view_page.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FamilyViewPage extends StatefulWidget {
  const FamilyViewPage({super.key, required this.family});
  final Family family;

  @override
  State<FamilyViewPage> createState() => _FamilyViewPageState();
}

class _FamilyViewPageState extends State<FamilyViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.family.name),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(12),
            sliver: MultiSliver(
              children: [
                SliverPinnedHeader(
                  child: Text(
                    "Parents",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                SliverList.builder(
                    itemBuilder: (context, index) {
                      final user = widget.family.expandedParent[index];
                      return ListTile(
                        leading: const CircleAvatar(),
                        title: Text(
                          "${user.firstName} ${user.otherNames}",
                        ),
                        subtitle: Text(user.admissionNumber),
                        trailing: IconButton(
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
                    itemCount: widget.family.expandedParent.length),
                const SizedBox(height: 22),
                SliverPinnedHeader(
                  child: Text(
                    "Children",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                SliverList.builder(
                    itemBuilder: (context, index) {
                      final user = widget.family.expandedChildren[index];
                      return ListTile(
                        leading: const CircleAvatar(),
                        title: Text(
                          "${user.firstName} ${user.otherNames}",
                        ),
                        subtitle: Text(user.admissionNumber),
                        trailing: IconButton(
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
                    itemCount: widget.family.expandedChildren.length),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
