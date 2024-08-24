import 'package:flutter/material.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/models/user_model.dart';
import 'package:orientation_app/pages/freshman_dashboard_page.dart';
import 'package:orientation_app/pages/freshman_profile_page.dart';
import 'package:orientation_app/pages/g9_profile_page.dart';
import 'package:orientation_app/pages/g9dashboard_page.dart';
import 'package:orientation_app/pages/parent_dashboard_page.dart';
import 'package:orientation_app/pages/parent_profile_page.dart';
import 'package:orientation_app/pages/routines_events_page.dart';

import '../pages/faq_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({
    super.key,
    required this.user,
  });

  final User user;

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedIndex = 0;
  final pages = [
    const Routines(),
    const FaqPage(),
  ];

  @override
  void initState() {
    setUser();
    super.initState();
  }

  // initializing user
  void setUser() {
    User user = widget.user;
    // setting the dashboard
    pages.insert(
      0,
      user.userType == "regular"
          ? FreshmanDashboardPage(
              user: user,
            )
          : user.userType == "parent"
              ? ParentDashboardPage(
                  user: user,
                )
              : G9DashboardPage(
                  user: user,
                ),
    );

    // setting the faq page
    pages.insert(
      2,
      user.userType == "parent"
          ? const FaqPage(
              isParent: true,
            )
          : const FaqPage(),
    );

    // setting the profile page
    pages.insert(
      3,
      user.userType == "regular"
          ? FreshmanProfilePage(
              user: user,
            )
          : user.userType == "parent"
              ? ParentProfilePage(
                  user: user,
                )
              : G9ProfilePage(
                  user: user,
                ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BottomNavigationBar(
          backgroundColor: CustomColors.backgroundColor,
          currentIndex: selectedIndex,
          elevation: 0,
          selectedItemColor: CustomColors.buttonColor,
          unselectedItemColor: Colors.grey,
          onTap: (int value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              backgroundColor: CustomColors.backgroundColor,
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Routines',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.question_answer),
              label: 'FAQs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: pages[selectedIndex],
    );
  }
}
