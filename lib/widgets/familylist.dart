import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:orientation_app/widgets/contact_tile.dart';
import 'package:orientation_app/pages/profile.dart';

class FamilyList extends StatelessWidget {
  const FamilyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Families',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(const FamilyProfile());
                },
                child: const ContactTile(
                  label: 'MN',
                  name: 'Name',
                  idx: 0,
                  sizes: 28,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const FamilyProfile());
                },
                child: const ContactTile(
                  label: 'BR',
                  name: 'Name',
                  idx: 1,
                  sizes: 28,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const FamilyProfile());
                },
                child: GestureDetector(
                  onTap: () {
                    Get.to(const FamilyProfile());
                  },
                  child: const ContactTile(
                    label: 'MN',
                    name: 'Name',
                    idx: 2,
                    sizes: 28,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(const FamilyProfile());
                },
                child: const ContactTile(
                  label: 'MN',
                  name: 'Name',
                  idx: 0,
                  sizes: 28,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const FamilyProfile());
                },
                child: const ContactTile(
                  label: 'BR',
                  name: 'Name',
                  idx: 1,
                  sizes: 28,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const FamilyProfile());
                },
                child: const ContactTile(
                  label: 'MN',
                  name: 'Name',
                  idx: 0,
                  sizes: 28,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(const FamilyProfile());
                },
                child: const ContactTile(
                  label: 'MN',
                  name: 'Name',
                  idx: 0,
                  sizes: 28,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const FamilyProfile());
                },
                child: const ContactTile(
                  label: 'BR',
                  name: 'Name',
                  idx: 1,
                  sizes: 28,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const FamilyProfile());
                },
                child: const ContactTile(
                  label: 'MN',
                  name: 'Name',
                  idx: 0,
                  sizes: 28,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
