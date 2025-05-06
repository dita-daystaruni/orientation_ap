import 'package:flutter/material.dart';

class FamilyStatCard extends StatelessWidget {
  const FamilyStatCard({
    super.key,
    required this.description,
    required this.stat,
    required this.icon,
    this.color,
  });
  final String description;
  final int stat;
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Icon(
              icon,
              size: 40,
            ),
            Text(
              "$stat",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              description,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
