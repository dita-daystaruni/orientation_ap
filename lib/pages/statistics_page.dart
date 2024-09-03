import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/constants/custom_icons/custom_icons.dart';
import 'package:orientation_app/controllers/courses_controller.dart';
import 'package:orientation_app/controllers/statistic_controller.dart';
import 'package:orientation_app/services/statistics_service.dart';
import 'package:orientation_app/widgets/pdf_preview.dart';
import 'package:orientation_app/widgets/statistic_item.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({
    super.key,
    required this.userToken,
  });

  final String userToken;

  @override
  Widget build(BuildContext context) {
    CourseController courseController = Get.find<CourseController>();
    StatisticsController statisticsController =
        Get.find<StatisticsController>();
    List<dynamic> statisticsData = [];
    List<String> coursesData = courseController.courses;
    bool isSelected = false;
    coursesData.insert(0, "All Courses");

    Future<void> fetchStatsData({String? selectedCourse}) async {
      List<dynamic> response;

      if (selectedCourse != null) {
        response =
            await fetchStatisticsData(token: userToken, course: selectedCourse);
      } else {
        response = await fetchStatisticsData(token: userToken);
      }
      if (response[0] == 200) {
        statisticsData = response[1];
      } else {
        Get.snackbar("Error", "Failed to load data from the server.");
      }
    }

    Future<void> fetchCourseStats(String selectedCourse) async {
      List<dynamic> response;
      statisticsController.isFetching.value = true;
      if (selectedCourse == coursesData[0]) {
        response = await getAllStatistics(userToken);
      } else {
        response = await getCourseStatistic(userToken, selectedCourse);
      }

      if (response[0] == 200) {
        await statisticsController.updateStats(
          jsonEncode(response[1]),
        );
      } else {
        Get.snackbar('Error', 'Failed to load course statistics');
      }
    }

    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: CustomColors.backgroundColor,
        title: const Text(
          'Statistics',
          style: TextStyle(
            color: CustomColors.textColor,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              if (!isSelected & statisticsData.isEmpty) {
                await fetchStatsData();
              } else if (statisticsData.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PreviewPage(statisticsData: statisticsData),
                  ),
                );
              } else {
                Get.snackbar("Error", "No data to generate PDF.");
              }
            },
            icon: const Icon(
              CustomIcons.printer,
            ),
          ),
        ],
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 22.0,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 22.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Course",
                    style: TextStyle(
                      color: CustomColors.textColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: CustomColors.indicatorColor,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                    child: Obx(
                      () => DropdownButtonFormField<String>(
                        isExpanded: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        ),
                        dropdownColor: CustomColors.backgroundColor,
                        items: coursesData.map((String course) {
                          return DropdownMenuItem<String>(
                            value: course,
                            child: Text(
                              course,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: CustomColors.secondaryTextColor,
                                fontWeight: FontWeight.w300,
                                fontSize: 13,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) async {
                          if (newValue != null) {
                            if (newValue == coursesData[0]) {
                              await fetchStatsData();
                              await fetchCourseStats(newValue);
                            } else {
                              await fetchStatsData(selectedCourse: newValue);
                              await fetchCourseStats(newValue);
                            }
                          }

                          isSelected = true;
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Obx(
              () => statisticsController.isFetching.value
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: CustomColors.buttonColor,
                    ))
                  : Column(
                      children: [
                        StatisticItem(
                          title: "Total Students",
                          statistic:
                              "${statisticsController.statistics.value?.totalStudents}",
                        ),
                        StatisticItem(
                          title: "Male",
                          statistic:
                              "${statisticsController.statistics.value?.maleStudents}",
                        ),
                        StatisticItem(
                          title: "Female",
                          statistic:
                              "${statisticsController.statistics.value?.femaleStudents}",
                        ),
                        StatisticItem(
                          title: "Nairobi Campus",
                          statistic:
                              "${statisticsController.statistics.value?.nairobiStudents}",
                        ),
                        StatisticItem(
                          title: "Athi River",
                          statistic:
                              "${statisticsController.statistics.value?.athiRiverStudents}",
                        ),
                        StatisticItem(
                          title: "Dayscholars",
                          statistic:
                              "${statisticsController.statistics.value?.dayScholarStudents}",
                        ),
                        StatisticItem(
                          title: "Boarders",
                          statistic:
                              "${statisticsController.statistics.value?.boarderStudents}",
                        )
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
