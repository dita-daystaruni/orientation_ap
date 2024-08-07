import 'package:flutter/material.dart';
import 'package:orientation_app/models/contact_tile.dart';

class G9dashboard extends StatelessWidget {
  const G9dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Statistics Card
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Statistics',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Text(
                        '327',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Text(
                        'New students',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              // Families Card
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Families',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      // First row of Contact Tiles
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ContactTile(
                            label: "MN",
                            name: 'Parent',
                            bgColor: Colors.brown,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ContactTile(
                            label: "BR",
                            name: 'Parent',
                            bgColor: Colors.blueGrey,
                          ),
                        ],
                      ),

                      // Second row of Contact Tiles
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ContactTile(
                            label: "JK",
                            name: 'Parent',
                            bgColor: Colors.brown,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ContactTile(
                            label: "LC",
                            name: 'Parent',
                            bgColor: Colors.blueGrey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
