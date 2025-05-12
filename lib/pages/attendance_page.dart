import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:orientation_app/controllers/attendance_controller.dart';
import 'package:orientation_app/controllers/family_controller.dart';
import 'package:orientation_app/controllers/usercontroller.dart';
import 'package:orientation_app/models/user_model.dart';
import 'package:sliver_tools/sliver_tools.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  final FamilyController _familyController = Get.find<FamilyController>();
  final UserController _userController = Get.find<UserController>();
  final AttendanceController _attendanceController =
      Get.find<AttendanceController>();
  final Map<User, bool> attendance = {};
  final formState = GlobalKey<FormState>();

  final attendanceNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _attendanceController.fetchAllAttendances(
      _familyController.family.value?.id ?? "",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formState,
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 12));
          },
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
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                      child: ListTile(
                        iconColor: Colors.orange[600],
                        leading: const Icon(Icons.lightbulb),
                        title: const Text("Tip"),
                        isThreeLine: true,
                        subtitle: const Text(
                          "Your attendance reports can be generated on demand from the web portal",
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Obx(
                      () => _attendanceController.attendances.isEmpty
                          ? const Column(
                              children: [
                                Text(
                                    "Seems you have no attendances marked yet"),
                              ],
                            )
                          : SliverList.builder(
                              itemBuilder: (context, index) {
                                final attendance =
                                    _attendanceController.attendances[index];
                                return ListTile(
                                  onTap: () {
                                    Get.toNamed(
                                      "/attendance-view",
                                      arguments: attendance,
                                    );
                                  },
                                  leading: const CircleAvatar(
                                    child: Icon(Icons.group),
                                  ),
                                  title: Text(
                                    "${attendance.expandedAttendanceType?.name ?? "unkown"} • ${DateFormat.MMMMEEEEd().format(attendance.created)}",
                                  ),
                                  subtitle: Text(
                                      "Marked by ${attendance.expandedMarker?.firstName ?? 'systemUser'} "),
                                  trailing: CircleAvatar(
                                    radius: 12,
                                    child: Text(
                                      attendance.marked.length.toString(),
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                );
                              },
                              itemCount:
                                  _attendanceController.attendances.length,
                            ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed("/mark-attendance");
        },
        icon: const Icon(Icons.person_pin_circle),
        label: const Text("Mark Attendance"),
      ),
    );
  }
}
