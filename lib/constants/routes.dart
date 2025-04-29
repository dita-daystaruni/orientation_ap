import 'package:get/get_navigation/get_navigation.dart';
import 'package:orientation_app/pages/home_page.dart';
import 'package:orientation_app/pages/routines_events_page.dart';
import 'package:orientation_app/pages/sign_in.dart';
import 'package:orientation_app/pages/sign_up.dart';
import 'package:orientation_app/pages/splash_screen.dart';

class AppRoutes {
  static var routes = [
    GetPage(name: "/splash_screen", page: () => const SplashScreen()),
    GetPage(name: "/login", page: () => const SignIn()),
    GetPage(name: "/home", page: () => const HomePage()),
    GetPage(name: "/sign_up", page: () => const SignUp()),
    GetPage(name: '/routines', page: () => const Routines()),
  ];
}
