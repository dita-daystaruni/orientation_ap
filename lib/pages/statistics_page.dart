import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/constants/custom_icons/custom_icons.dart';
import 'package:orientation_app/controllers/courses_controller.dart';
import 'package:orientation_app/controllers/statistic_controller.dart';
import 'package:orientation_app/widgets/statistic_item.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    CourseController courseController = Get.find<CourseController>();
    StatisticsController statisticsController =
        Get.find<StatisticsController>();

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
            onPressed: () {},
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
                      () => DropdownMenu(
                        enableSearch: true,
                        // focusColor: Colors.transparent,
                        // underline: const SizedBox(),
                        // isExpanded: true,
                        // borderRadius: const BorderRadius.all(
                        //   Radius.circular(6),
                        // ),
                        // icon: const Icon(Icons.keyboard_arrow_down),
                        // dropdownColor: CustomColors.backgroundColor,
                        dropdownMenuEntries: courseController.courses
                            .map(
                              (course) => DropdownMenuEntry(
                                value: course,
                                label: course,
                                labelWidget: Text(
                                  course,
                                  style: const TextStyle(
                                    color: CustomColors.secondaryTextColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        // onChanged: (value) {},
                      ),
                    ),
                  )
                ],
              ),
            ),
            Obx(
              () => Column(
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
