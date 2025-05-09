import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/controllers/family_controller.dart';
import 'package:orientation_app/controllers/usercontroller.dart';
import 'package:orientation_app/models/attendance_model.dart';
import 'package:orientation_app/models/user_model.dart';
import 'package:orientation_app/pages/user_view_page.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  final FamilyController _familyController = Get.find<FamilyController>();
  final UserController _userController = Get.find<UserController>();
  final Map<User, bool> attendance = {};
  final formState = GlobalKey<FormState>();

  final attendanceNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final children = _familyController.family.value!.expandedChildren;
    for (final child in children) {
      attendance[child] = false;
    }
    setState(() {});
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
                title: Text("Attendance Register"),
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
                    "Please mark attendance for your children",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.length < 5) {
                        return "Please provide a reason for this";
                      }
                      return null;
                    },
                    controller: attendanceNameController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: "Attendance Description",
                      hintText: "e.g Breakfast Register",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Children",
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
                      if (!formState.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Please complete the form to continue")));
                        return;
                      }

                      final res = await _familyController.markAttendance(
                          Attendance(
                              id: "",
                              name: attendanceNameController.text,
                              created: DateTime.now(),
                              updated: DateTime.now(),
                              family: _familyController.family.value!.id,
                              marked: attendance.keys
                                  .where((user) => attendance[user] == true)
                                  .toList()
                                  .map((e) => e.id)
                                  .toList(),
                              collectionName: "",
                              collectionId: "",
                              markedBy: _userController.user.value!.id));

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
