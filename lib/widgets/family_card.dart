import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/models/family_model.dart';

class FamilyCard extends StatelessWidget {
  const FamilyCard({super.key, required this.family});
  final Family family;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed("/family-view", arguments: family);
      },
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 4,
            children: [
              CircleAvatar(
                child: Text(family.name[0]),
              ),
              Text(
                family.name,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
