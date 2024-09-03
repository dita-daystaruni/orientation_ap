import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/controllers/contacts_controller.dart';
import 'package:orientation_app/models/user_model.dart';
import 'package:orientation_app/pages/g9_family_view_page.dart';
import 'package:orientation_app/pages/reload_page.dart';
import 'package:orientation_app/pages/splash_screen.dart';
import 'package:orientation_app/utils/logout.dart';
import 'package:orientation_app/widgets/contact_tile.dart';

class G9ProfilePage extends StatelessWidget {
  const G9ProfilePage({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    // contacts controller
    UserContactController userContactController =
        Get.find<UserContactController>();

    return Scaffold(
      appBar: AppBar(
        shadowColor: CustomColors.backgroundColor,
        foregroundColor: CustomColors.backgroundColor,
        backgroundColor: CustomColors.backgroundColor,
        leading: IconButton(
          onPressed: () {
            Get.to(ReloadPage(user: user));
          },
          icon: const Icon(
            Icons.replay_outlined,
            color: CustomColors.textColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              // Call the dialog function and wait for user response
              bool shouldLogout = await showLogoutConfirmationDialog(context);

              if (shouldLogout) {
                // Clears shared prefs and log out
                await logOutUser();
                // Navigate user back to the beginning
                Get.offAll(const SplashScreen());
              }
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
              user.gender == "Male"
                  ? 'assets/images/profile.png'
                  : 'assets/images/female_student.png',
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "${user.firstName} ${user.lastName}",
              style: const TextStyle(
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
            Obx(
              () => userContactController.userContacts.isNotEmpty
                  ? Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0,
                          ),
                          itemBuilder: (context, idx) {
                            return ContactTile(
                              label:
                                  '${userContactController.userContacts[idx].firstName[0]}${userContactController.userContacts[idx].lastName[0]}',
                              name: userContactController
                                  .userContacts[idx].firstName,
                              idx: idx,
                              sizes: 30,
                              redirectionPage: G9FamilyViewPage(
                                parent: userContactController.userContacts[idx],
                                token: user.token,
                              ),
                            );
                          },
                          itemCount: userContactController.userContacts.length,
                          scrollDirection: Axis.vertical,
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        Lottie.asset(
                          "assets/lotties/error.json",
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "No Families Yet",
                            style: TextStyle(
                              color: CustomColors.secondaryTextColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }

  // Function to show a logout confirmation dialog
  Future<bool> showLogoutConfirmationDialog(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: CustomColors.backgroundColor,
              title: const Text('Confirm Logout'),
              content: const Text('Are you sure you want to log out?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: CustomColors.eventsColor),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: CustomColors.buttonColor),
                  child: const Text('Logout'),
                ),
              ],
            );
          },
        ) ??
        false;
  }
}
