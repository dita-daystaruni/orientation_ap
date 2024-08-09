import 'package:flutter/material.dart';
import 'package:orientation_app/models/contact_tile.dart';

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
            'Family',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 30,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContactTile(
                label: 'MN',
                name: 'Name',
                contact: 'Contact',
                bgColor: Color.fromRGBO(209, 153, 85, 1),
              ),
              SizedBox(
                width: 30,
              ),
              ContactTile(
                label: 'BR',
                name: 'Name',
                contact: 'Contact',
                bgColor: Color.fromRGBO(49, 125, 137, 1),
              ),
              SizedBox(
                width: 30,
              ),
              ContactTile(
                label: 'MN',
                name: 'Name',
                contact: 'Contact',
                bgColor: Color.fromRGBO(209, 153, 85, 1),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContactTile(
                label: 'MN',
                name: 'Name',
                contact: 'Contact',
                bgColor: Color.fromRGBO(209, 153, 85, 1),
              ),
              SizedBox(
                width: 30,
              ),
              ContactTile(
                label: 'BR',
                name: 'Name',
                contact: 'Contact',
                bgColor: Color.fromRGBO(49, 125, 137, 1),
              ),
              SizedBox(
                width: 30,
              ),
              ContactTile(
                label: 'MN',
                name: 'Name',
                contact: 'Contact',
                bgColor: Color.fromRGBO(209, 153, 85, 1),
              ),
            ],
          )
        ],
      ),
    );
  }
}
