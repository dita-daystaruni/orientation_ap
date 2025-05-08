import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/controllers/family_controller.dart';
import 'package:orientation_app/controllers/statistic_controller.dart';
import 'package:orientation_app/models/family_model.dart';
import 'package:orientation_app/widgets/family_card.dart';
import 'package:orientation_app/widgets/family_stat_card.dart';
import 'package:sliver_tools/sliver_tools.dart';

class G9DashboardPage extends StatefulWidget {
  const G9DashboardPage({super.key});

  @override
  State<G9DashboardPage> createState() => _G9DashboardPageState();
}

class _G9DashboardPageState extends State<G9DashboardPage> {
  final FamilyController _familyController = Get.find<FamilyController>();
  final StatisticsController _statisticsController =
      Get.find<StatisticsController>();
  late Future<dartz.Either<String, List<Family>>> allFamiliesResult;

  @override
  void initState() {
    super.initState();
    allFamiliesResult = _familyController.fetchAllFamilies();
    _statisticsController.fetchStats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          setState(() {
            allFamiliesResult = _familyController.fetchAllFamilies();
          });

          await _statisticsController.fetchStats();
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
                const SizedBox(height: 22),
                Obx(
                  () => Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      FamilyStatCard(
                        stat: _statisticsController.stats.value.g9s ?? 0,
                        description: "Number of G9s",
                        icon: Icons.admin_panel_settings,
                        color: Colors.green[600],
                      ),
                      FamilyStatCard(
                        stat: _statisticsController.stats.value.parents ?? 0,
                        description: "Number of Parents",
                        icon: Icons.bedroom_parent,
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                      FamilyStatCard(
                        stat:
                            _statisticsController.stats.value.maleStudents ?? 0,
                        description: "Male Students",
                        icon: Icons.male,
                        color: Colors.grey[600],
                      ),
                      FamilyStatCard(
                        stat:
                            _statisticsController.stats.value.maleStudents ?? 0,
                        description: "Female Students",
                        icon: Icons.female,
                        color: Colors.pink[600],
                      ),
                      FamilyStatCard(
                        stat:
                            _statisticsController.stats.value.nairobiStudents ??
                                0,
                        description: "Nairobi Students",
                        icon: Icons.work,
                        color: Colors.orange[600],
                      ),
                      FamilyStatCard(
                        stat: _statisticsController
                                .stats.value.athiRiverStudents ??
                            0,
                        description: "Athi River Students",
                        icon: Icons.work,
                        color: Colors.yellow[800],
                      ),
                      FamilyStatCard(
                        stat:
                            _statisticsController.stats.value.boarderStudents ??
                                0,
                        description: "Students Boarding",
                        icon: Icons.bed,
                        color: Colors.red[600],
                      ),
                      FamilyStatCard(
                        stat: _statisticsController
                                .stats.value.dayScholarStudents ??
                            0,
                        description: "Commutting Students",
                        icon: Icons.local_shipping,
                        color: Colors.brown[600],
                      ),
                      FamilyStatCard(
                        stat: _statisticsController
                                .stats.value.dayScholarStudents ??
                            0,
                        description: "Total number of students",
                        icon: Icons.group,
                        color: Colors.teal[600],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 28),
              ]),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(12),
              sliver: MultiSliver(children: [
                SliverPinnedHeader(
                  child: Text(
                    "Families",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                FutureBuilder(
                    future: allFamiliesResult,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return SizedBox(
                          height: 40,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return const CircleAvatar();
                            },
                            scrollDirection: Axis.horizontal,
                          ),
                        );
                      }
                      return snapshot.data!.fold((error) {
                        return Text(error);
                      }, (families) {
                        return SizedBox(
                          height: 100,
                          child: ListView.builder(
                            itemCount: families.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final fam = families[index];
                              return FamilyCard(family: fam);
                            },
                          ),
                        );
                      });
                    }),
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
                      onTap: () async {
                        Get.toNamed("/create-family");
                      },
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
    );
  }
}
