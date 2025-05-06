import 'package:get/get_navigation/get_navigation.dart';
import 'package:orientation_app/pages/create_family_page.dart';
import 'package:orientation_app/pages/family_add_child_page.dart';
import 'package:orientation_app/pages/family_push_notification_page.dart';
import 'package:orientation_app/pages/g9dashboard_page.dart';
import 'package:orientation_app/pages/home_page.dart';
import 'package:orientation_app/pages/routines_events_page.dart';
import 'package:orientation_app/pages/sign_in.dart';
import 'package:orientation_app/pages/sign_up.dart';
import 'package:orientation_app/pages/splash_screen.dart';

class AppRoutes {
  static final routes = <GetPage>[
    GetPage(name: "/splash_screen", page: () => const SplashScreen()),
    GetPage(name: "/login", page: () => const SignIn()),
    GetPage(name: "/home", page: () => const HomePage()),
    GetPage(name: "/sign_up", page: () => const SignUp()),
    GetPage(name: '/routines', page: () => const Routines()),
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
  ];
}
