import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliver_tools/sliver_tools.dart';

class G9DashboardPage extends StatefulWidget {
  const G9DashboardPage({super.key});

  @override
  State<G9DashboardPage> createState() => _G9DashboardPageState();
}

class _G9DashboardPageState extends State<G9DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2));
        },
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Freshman Orientation Dashboard"),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(12),
              sliver: MultiSliver(children: [
                SliverPinnedHeader(
                  child: Text(
                    "Quick statistics",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ]),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(12),
              sliver: MultiSliver(
                children: [
                  SliverPinnedHeader(
                    child: Text(
                      "Quick actions",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Card(
                    elevation: 0,
                    margin: const EdgeInsets.all(1),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                    )),
                    child: ListTile(
                      leading: const Icon(Icons.group_add),
                      title: const Text("Create a family"),
                      onTap: () async {},
                    ),
                  ),
                  Card(
                    elevation: 0,
                    margin: const EdgeInsets.all(1),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                    child: ListTile(
                      leading: const Icon(Icons.person_search),
                      title: const Text("Search for a user"),
                      onTap: () async {},
                    ),
                  ),
                  Card(
                    elevation: 0,
                    margin: const EdgeInsets.all(1),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                    child: ListTile(
                      leading: const Icon(Icons.hub),
                      title: const Text("View family details"),
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
                      title: const Text("Send push notification"),
                      onTap: () async {
                        Get.toNamed("/send-push-notification");
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.apps),
      ),
    );
  }
}
