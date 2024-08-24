import 'package:flutter/material.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/models/user_model.dart';
import 'package:orientation_app/pages/g9_family_view_page.dart';
import 'package:orientation_app/widgets/contact_tile.dart';

class G9ProfilePage extends StatelessWidget {
  const G9ProfilePage({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: CustomColors.backgroundColor,
        foregroundColor: CustomColors.backgroundColor,
        backgroundColor: CustomColors.backgroundColor,
        leading: IconButton(
          onPressed: () {
            debugPrint("Coming Soon");
          },
          icon: const Icon(
            Icons.notifications_outlined,
            color: CustomColors.textColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint("Coming Soon");
            },
            icon: const Icon(
              Icons.logout,
              color: CustomColors.textColor,
            ),
          ),
        ],
      ),
      backgroundColor: CustomColors.backgroundColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/profile.png',
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Name',
              style: TextStyle(
                color: CustomColors.textColor,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 32.0,
                bottom: 8.0,
              ),
              child: Text(
                'Families',
                style: TextStyle(
                  color: CustomColors.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                  ),
                  itemBuilder: (context, idx) {
                    return ContactTile(
                      label: "RM",
                      idx: idx,
                      sizes: 35,
                      redirectionPage: const G9FamilyViewPage(),
                    );
                  },
                  itemCount: 10,
                  scrollDirection: Axis.vertical,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
