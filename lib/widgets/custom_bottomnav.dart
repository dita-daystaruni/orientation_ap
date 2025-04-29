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
    this.onProfile = false,
  });

  final User user;
  // clicked reload when on profile page
  final bool onProfile;

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late int selectedIndex;
  final pages = [];

  @override
  void initState() {
    setUser();
    // set current page for user, 3 meaning they were reloading page
    selectedIndex = widget.onProfile ? 3 : 0;
    super.initState();
  }

  // initializing user
  void setUser() {
    User user = widget.user;
    // setting the dashboard
    // pages.insert(
    // 0,
    //   user.role == "regular"
    //       ? FreshmanDashboardPage(
    //           user: user,
    //         )
    //       : user.role == "parent"
    //           ? ParentDashboardPage(
    //               user: user,
    //             )
    //           : G9DashboardPage(
    //               user: user,
    //             ),
    // );

    //setting routines page
    pages.insert(
      1,
      const Routines(),
    );

    // setting the faq page
    // pages.insert(
    //   2,
    //   user.role == "parent"
    //       ? FaqPage(
    //           isParent: true,
    //           userToken: user.firstName,
    //         )
    //       : FaqPage(
    //           userToken: user.firstName,
    //         ),
    // );
    //
    // setting the profile page
    // pages.insert(
    //   3,
    //   user.role == "regular"
    //       ? FreshmanProfilePage(
    //           user: user,
    //         )
    //       : user.role == "parent"
    //           ? ParentProfilePage(
    //               user: user,
    //             )
    //           : G9ProfilePage(
    //               user: user,
    //             ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: CustomColors.backgroundColor,
        currentIndex: selectedIndex,
        elevation: 0,
        selectedItemColor: CustomColors.buttonColor,
        unselectedItemColor: CustomColors.thirdTextColor,
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
            backgroundColor: CustomColors.backgroundColor,
            icon: Icon(Icons.calendar_month),
            label: 'Routines',
          ),
          BottomNavigationBarItem(
            backgroundColor: CustomColors.backgroundColor,
            icon: Icon(Icons.question_answer),
            label: 'FAQs',
          ),
          BottomNavigationBarItem(
            backgroundColor: CustomColors.backgroundColor,
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}
