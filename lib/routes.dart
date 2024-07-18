import 'package:get/get_navigation/get_navigation.dart';
import 'package:orientation_app/pages/sign_in.dart';
import 'package:orientation_app/pages/splash_screen.dart';

class AppRoutes {
  static var routes = [
    GetPage(name: "/splash_screen", page: () => const SplashScreen()),
    GetPage(name: "/sign_in", page: () => const SignIn()),
    GetPage(name: "/home_page", page: () => const HomePage),
  ];
}
