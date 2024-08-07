import 'package:get/get_navigation/get_navigation.dart';
import 'package:orientation_app/models/custom_bottomnav.dart';
import 'package:orientation_app/pages/notifications.dart';
import 'package:orientation_app/pages/sign_in.dart';
import 'package:orientation_app/pages/sign_up.dart';
import 'package:orientation_app/pages/splash_screen.dart';

class AppRoutes {
  static var routes = [
    GetPage(name: "/splash_screen", page: () => const SplashScreen()),
    GetPage(name: "/sign_in", page: () => const SignIn()),
    GetPage(name: "/sign_up", page: () => const SignUp()),
    GetPage(name: "/landing_page", page: () => const BottomNav()),
    GetPage(name: '/notifications', page: () => const Notifications()),
  ];
}
