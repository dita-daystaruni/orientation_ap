import 'package:flutter/material.dart';
import 'package:orientation_app/models/user_model.dart';
import 'package:sliver_tools/sliver_tools.dart';

class UserViewPage extends StatefulWidget {
  const UserViewPage({super.key, required this.user});

  final User user;

  @override
  State<UserViewPage> createState() => _UserViewPageState();
}

class _UserViewPageState extends State<UserViewPage> {
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
              title: Text("${widget.user.firstName} ${widget.user.otherNames}"),
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
                    title: Text(widget.user.admissionNumber),
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
                    title: Text(widget.user.expandedProfile!.programme),
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
                    title: Text(widget.user.expandedProfile!.schoolEmail),
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
                      widget.user.verified ? "acive" : "inactive",
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
                      widget.user.expandedProfile!.gender.toLowerCase() ==
                              "male"
                          ? Icons.male
                          : Icons.female,
                    ),
                    title: Text(widget.user.expandedProfile!.gender),
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
                    title: Text(widget.user.expandedProfile!.campus),
                  ),
                ),
                Card(
                  elevation: 0,
                  margin: const EdgeInsets.all(1),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.phone),
                    title: Text(widget.user.expandedProfile!.phoneNumber),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          )
        ],
      ),
    );
  }
}
