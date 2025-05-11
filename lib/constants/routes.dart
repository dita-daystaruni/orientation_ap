import 'package:orientation_app/models/attendance_model.dart';
import 'package:orientation_app/models/family_model.dart';
import 'package:orientation_app/pages/add_feed_page.dart';
import 'package:orientation_app/pages/attendance_page.dart';
import 'package:orientation_app/pages/attendance_view_page.dart';
import 'package:orientation_app/pages/create_family_page.dart';
import 'package:orientation_app/pages/family_add_child_page.dart';
import 'package:orientation_app/pages/family_push_notification_page.dart';
import 'package:orientation_app/pages/family_view_page.dart';
import 'package:orientation_app/pages/g9dashboard_page.dart';
import 'package:orientation_app/pages/home_page.dart';
import 'package:orientation_app/pages/mark_attendance.dart';
import 'package:orientation_app/pages/sign_in.dart';
import 'package:orientation_app/pages/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = <GetPage>[
    GetPage(name: "/splash_screen", page: () => const SplashScreen()),
    GetPage(name: "/login", page: () => const SignIn()),
    GetPage(name: "/home", page: () => const HomePage()),
    GetPage(
      name: '/send-push-notification',
      page: () => const FamilyPushNotificationPage(),
    ),
    GetPage(
      name: '/add-feed',
      page: () => const AddFeedPage(),
    ),
    GetPage(
      name: '/add-child-to-family',
      page: () => const FamilyAddChildPage(),
    ),
    GetPage(
      name: '/g9-dashboard-view',
      page: () => const G9DashboardPage(),
    ),
    GetPage(
      name: '/create-family',
      page: () => const CreateFamilyPage(),
    ),
    GetPage(
      name: '/attendance-register',
      page: () => const AttendancePage(),
    ),
    GetPage(
      name: '/mark-attendance',
      page: () => const MarkAttendance(),
    ),
    GetPage(
      name: '/attendance-view',
      page: () => AttendanceViewPage(
        attendance: Get.arguments as Attendance,
      ),
    ),
    GetPage(
      name: '/family-view',
      page: () => FamilyViewPage(
        family: Get.arguments as Family,
      ),
    ),
  ];
}
