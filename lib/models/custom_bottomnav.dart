import 'package:flutter/material.dart';
import 'package:orientation_app/constants.dart/custom_colors.dart';
import 'package:orientation_app/pages/eventspage.dart';
import 'package:orientation_app/pages/home_page.dart';

import '../pages/faq.dart';
import '../pages/profile.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedIndex = 0;
  final pages = [
    const HomePage(),
    const Routines(),
    const Faq(),
    const Profile(),
  ];

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
          selectedItemColor: Colors.blue,
          unselectedItemColor: CustomColors.buttonColor,
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
