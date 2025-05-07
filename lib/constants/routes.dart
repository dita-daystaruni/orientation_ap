import 'package:orientation_app/models/family_model.dart';
import 'package:orientation_app/pages/create_family_page.dart';
import 'package:orientation_app/pages/family_add_child_page.dart';
import 'package:orientation_app/pages/family_push_notification_page.dart';
import 'package:orientation_app/pages/family_view_page.dart';
import 'package:orientation_app/pages/g9dashboard_page.dart';
import 'package:orientation_app/pages/home_page.dart';
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
      name: '/family-view',
      page: () => FamilyViewPage(
        family: Get.arguments as Family,
      ),
    ),
  ];
}
