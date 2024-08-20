import 'package:flutter/material.dart';
import 'package:orientation_app/constants.dart/custom_colors.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align children to the start
            children: [
              ListTile(
                leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_outlined),
                ),
                trailing: const Icon(Icons.logout),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/profile.png',
                      height: 150,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'John Kamau',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'contact',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
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
              )
            ],
          ),
        ),
      ),
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
