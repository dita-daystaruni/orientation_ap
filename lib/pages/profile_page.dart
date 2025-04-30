import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/controllers/usercontrollers.dart';
import 'package:sliver_tools/sliver_tools.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final UserController _userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            floating: true,
            pinned: true,
            snap: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Your Profile"),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(12),
            sliver: MultiSliver(
              children: [
                CircleAvatar(
                  radius: 80,
                ),
                const SizedBox(height: 22),
                Text(
                  "${_userController.user.value!.firstName} ${_userController.user.value!.otherNames}",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 22),
                Card(
                  elevation: 0,
                  margin: const EdgeInsets.all(1),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.badge_outlined),
                    title: Text(_userController.user.value!.admissionNumber),
                    subtitle: Text(
                      "Admission Number",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
                Card(
                  elevation: 0,
                  margin: const EdgeInsets.all(1),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.workspace_premium_outlined),
                    title: Text(
                      _userController.user.value!.verified
                          ? "acive"
                          : "inactive",
                    ),
                    subtitle: Text(
                      "status",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const SliverPinnedHeader(
                  child: Text("Actions"),
                ),
                Card(
                  color: Theme.of(context).colorScheme.errorContainer,
                  margin: const EdgeInsets.all(1),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(12),
                  )),
                  child: ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text("Logout from the App"),
                    onTap: () async {
                      await _userController.logout();
                      Get.offAllNamed("/splash_screen");
                    },
                    subtitle: Text(
                      "Leave the application for now",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
