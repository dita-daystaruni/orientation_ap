import 'package:get/get.dart';
import 'package:orientation_app/widgets/daystile.dart';

class RoutesSessionsControllers extends GetxController {
  var dayActivities = [].obs;
  var activeIndex = 0.obs;

  @override
  void onInit() {
    getDayActivities();
    super.onInit();
  }

  // gets the current day activities
  void getDayActivities() {
    // clear the list first before updating
    dayActivities.clear();
    for (var element in [
      0,
      1,
      2,
      3,
      4,
      5,
      6,
    ]) {
      if (element == activeIndex.value) {
        dayActivities.add(DaysTile(
          day: "Mon",
          date: "7",
          index: element,
          isActive: true,
        ));
      } else {
        dayActivities.add(DaysTile(
          day: "Mon",
          date: "7",
          index: element,
        ));
      }
    }
  }

  // updates the current date
  void updateActiveIndex(int index) {
    activeIndex.value = index;
    // update list with new activities
    getDayActivities();
  }
}
