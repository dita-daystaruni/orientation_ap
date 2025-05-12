import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/controllers/notifications_controller.dart';
import 'package:orientation_app/controllers/usercontroller.dart';
import 'package:sliver_tools/sliver_tools.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final UserController _userController = Get.find<UserController>();
  final NotificationController notificationController =
      Get.find<NotificationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                  "${_userController.user.value!.firstName} ${_userController.user.value!.otherNames}"),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(12),
            sliver: MultiSliver(
              children: [
                const SizedBox(height: 22),
                Card(
                  elevation: 0,
                  margin: const EdgeInsets.all(1),
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(12)),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.badge_outlined),
                    title: Text(_userController.user.value!.admissionNumber),
                  ),
                ),
                Card(
                  elevation: 0,
                  margin: const EdgeInsets.all(1),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.school),
                    title: Text(_userController.user.value!.expandedProfile!.programme),
                  ),
                ),
                Card(
                  elevation: 0,
                  margin: const EdgeInsets.all(1),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.mail_outline),
                    title:
                        Text(_userController.user.value!.expandedProfile!.schoolEmail),
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
                  ),
                ),
                Card(
                  elevation: 0,
                  margin: const EdgeInsets.all(1),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  child: ListTile(
                    leading: Icon(
                      _userController.user.value!.expandedProfile!.gender
                                  .toLowerCase() ==
                              "male"
                          ? Icons.male
                          : Icons.female,
                    ),
                    title: Text(_userController.user.value!.expandedProfile!.gender),
                  ),
                ),
                Card(
                  elevation: 0,
                  margin: const EdgeInsets.all(1),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.home_work_outlined),
                    title: Text(_userController.user.value!.expandedProfile!.campus),
                  ),
                ),
                const SizedBox(height: 12),
                const SliverPinnedHeader(
                  child: Text("Actions"),
                ),
                Card(
                  elevation: 0,
                  margin: const EdgeInsets.all(1),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12),
                  )),
                  child: ListTile(
                    leading: const Icon(Icons.notifications),
                    title: const Text("Notification Access"),
                    onTap: () async {
                      await notificationController.requestPermission(_userController.user.value!);

                    },
                  ),
                ),
                Visibility(
                  visible: !_userController.user.value!.verified,
                  child: Card(
                    elevation: 0,
                    margin: const EdgeInsets.all(1),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                    )),
                    child: ListTile(
                      leading: const Icon(Icons.verified),
                      title: const Text("Request Verification"),
                      onTap: () async {},
                    ),
                  ),
                ),
                Card(
                  elevation: 0,
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
