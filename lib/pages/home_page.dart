import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/controllers/usercontroller.dart';
import 'package:orientation_app/pages/dashboard_page.dart';
import 'package:orientation_app/pages/help_page.dart';
import 'package:orientation_app/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;
  final UserController _userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      body: IndexedStack(
        index: _selectedPage,
        children: [
          const DashboardPage(),
          const HelpPage(),
          const Center(child: Text("My Family")),
          const ProfilePage(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedPage,
        onDestinationSelected: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: "Feed",
          ),
          NavigationDestination(
            icon: Icon(Icons.change_history),
            selectedIcon: Icon(Icons.run_circle),
            label: "Activities",
          ),
          NavigationDestination(
            icon: Icon(Icons.diversity_1_outlined),
            selectedIcon: Icon(Icons.diversity_1),
            label: "Family",
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outlined),
            selectedIcon: Icon(Icons.person),
            label: "You",
          ),
        ],
      ),
    );
  }
}
