import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/controllers/attendance_controller.dart';
import 'package:orientation_app/controllers/family_controller.dart';
import 'package:orientation_app/controllers/usercontroller.dart';
import 'package:orientation_app/models/attendance_model.dart';
import 'package:orientation_app/models/user_model.dart';
import 'package:orientation_app/pages/user_view_page.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AttendanceViewPage extends StatefulWidget {
  const AttendanceViewPage({
    super.key,
    required this.attendance,
  });
  final Attendance attendance;

  @override
  State<AttendanceViewPage> createState() => _AttendanceViewPageState();
}

class _AttendanceViewPageState extends State<AttendanceViewPage> {
  final FamilyController _familyController = Get.find<FamilyController>();
  final UserController _userController = Get.find<UserController>();
  final AttendanceController _attendanceController =
      Get.find<AttendanceController>();
  final Map<User, bool> attendance = {};
  final formState = GlobalKey<FormState>();
  String _selectedReason = "";

  final attendanceNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _attendanceController.fetchAllAttendancesTypes();
    final children = _familyController.family.value?.expandedChildren ?? [];

    for (final child in children) {
      attendance[child] = widget.attendance.marked.contains(child.id);
    }
    _selectedReason = widget.attendance.type;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formState,
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              floating: true,
              pinned: true,
              snap: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Modify your children's attendance"),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(12),
              sliver: MultiSliver(
                children: [
                  const SizedBox(
                    height: 22,
                  ),
                  Text(
                    "Please pick a reason you're marking this attendance",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 12),
                  Obx(() => _attendanceController.attendanceTypes.isEmpty
                      ? const Text(
                          "Please refresh this page to get attendance reasons",
                        )
                      : SliverList.builder(
                          itemBuilder: (context, index) {
                            final attendanceType =
                                _attendanceController.attendanceTypes[index];
                            return RadioListTile<String>(
                              groupValue: _selectedReason,
                              value: attendanceType.id,
                              onChanged: (val) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("You cannot change this")),
                                );
                                // _selectedReason = attendanceType.id;
                                // setState(() {});
                              },
                              title: Text(attendanceType.name),
                            );
                          },
                          itemCount:
                              _attendanceController.attendanceTypes.length,
                        )),
                  const SizedBox(height: 12),
                  Text(
                    "Please tick all the children who are present at the moment",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SliverList.builder(
                    itemBuilder: (context, index) {
                      final User user = attendance.keys.elementAt(index);
                      return CheckboxListTile(
                        onChanged: (val) {
                          setState(() {
                            attendance[user] = val!;
                          });
                        },
                        value: attendance[user],
                        title: Text(
                          user.id == _userController.user.value!.id
                              ? "You"
                              : "${user.firstName} ${user.otherNames}",
                        ),
                        subtitle: Text(user.admissionNumber),
                      );
                    },
                    itemCount: attendance.keys.length,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Parents",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Obx(() {
                    return SliverList.builder(
                      itemBuilder: (context, index) {
                        final user = _familyController
                            .family.value!.expandedParent[index];
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
                              .family.value?.expandedParent.length ??
                          0,
                    );
                  }),
                  const SizedBox(height: 32),
                  FilledButton(
                    onPressed: () async {
                      final userIDsPresent = <String>[];

                      for (final user in attendance.keys) {
                        if (attendance[user]!) userIDsPresent.add(user.id);
                      }

                      final res = await _attendanceController
                          .updateAttendance(Attendance(
                        id: widget.attendance.id,
                        name: widget.attendance.name,
                        type: _selectedReason,
                        family: _familyController.family.value?.id ?? "",
                        marked: userIDsPresent,
                        created: widget.attendance.created,
                        updated: DateTime.now(),
                        markedBy: _userController.user.value?.id ?? '',
                        collectionId: "",
                        collectionName: "",
                      ));
                      //
                      res.fold((error) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(error)));
                        return;
                      }, (ok) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Sucessfully marked attendance")));
                        return;
                      });
                    },
                    child: const Text("Mark Attendance"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
