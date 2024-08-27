import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CourseController extends GetxController {
  RxList<String> courses = <String>[].obs;

  // caches faqs
  Future<void> addCoursesToSP(List<String> faqs) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("courses", faqs);
  }

  // gets users contacts from SP
  Future getCoursesFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? coursesString = prefs.getStringList("courses");
    if (coursesString != null) {
      // clear contacts before adding new ones
      courses.clear();
      // adding new contacts
      for (var element in coursesString) {
        courses.add(element);
      }
      return courses;
    }
    return null;
  }
}