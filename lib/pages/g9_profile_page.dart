import 'package:flutter/material.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/pages/g9_family_view_page.dart';
import 'package:orientation_app/widgets/contact_tile.dart';

class G9ProfilePage extends StatelessWidget {
  const G9ProfilePage({super.key});

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

class FamilyProfile extends StatelessWidget {
  const FamilyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Family Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Parent Contacts:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            TextIcon(
              label: '+2547 12 345 678',
              trailingIcon: Image.asset(
                'assets/images/call.png',
                height: 40,
              ),
            ),
            TextIcon(
              label: 'ko@daystar.ac.ke',
              trailingIcon: Image.asset(
                'assets/images/fluent-emoji-flat_e-mail.png',
                height: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FreshmanProfile extends StatelessWidget {
  const FreshmanProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Personal Details',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextIcon(
            leadingIcon: Image.asset(
              'assets/images/grajweshencap.png',
              height: 20,
            ),
            label: 'Course Details'),
        const SizedBox(
          height: 10,
        ),
        TextIcon(
          label: 'user@daystar.ac.ke',
          leadingIcon: Image.asset(
            'assets/images/fluent-emoji-flat_e-mail.png',
            height: 29,
          ),
          trailingIcon: null,
        ),
        const SizedBox(
          height: 10,
        ),
        const TextIcon(
          leadingIcon: Icon(Icons.phone),
          label: '+ 254 712 345 678',
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Orientation Details',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text('Family Name'),
        const SizedBox(
          height: 10,
        ),
        const Text('Parent Name'),
        const SizedBox(
          height: 10,
        ),
        TextIcon(
          leadingIcon: null,
          label: '+ 254 712 345 678',
          trailingIcon: Image.asset(
            'assets/images/call.png',
            height: 30,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextIcon(
          label: 'user@daystar.ac.ke',
          trailingIcon:
              Image.asset('assets/images/fluent-emoji-flat_e-mail.png'),
        ),
      ],
    );
  }
}

class TextIcon extends StatelessWidget {
  final String label;
  final Widget? leadingIcon;
  final dynamic trailingIcon;
  final double spacing = 8.0;
  const TextIcon({
    super.key,
    required this.label,
    this.leadingIcon,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (leadingIcon != null) leadingIcon!,
        if (leadingIcon != null)
          SizedBox(
            width: spacing,
          ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          width: spacing,
        ),
        if (trailingIcon != null) trailingIcon,
        if (trailingIcon != null)
          SizedBox(
            width: spacing,
          ),
      ],
    );
  }
}
