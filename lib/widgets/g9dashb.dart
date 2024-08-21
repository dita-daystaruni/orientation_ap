import 'package:flutter/material.dart';
import 'package:orientation_app/widgets/events_tile.dart';
import 'package:orientation_app/widgets/upcoming_acitivity.dart';

class G9dashboard extends StatelessWidget {
  const G9dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Statistics Card
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              width: 165,
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Statistics',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        '327',
                        // style: TextStyle(fontSize: 64),
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const Text(
                        'New students',
                        style: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 12),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 4,
            ),

            // Families Card
            SizedBox(
              height: 210,
              width: 165,
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Families',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // First row of Contact Tiles
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                maxRadius: 22,
                                backgroundColor:
                                    Color.fromRGBO(209, 153, 85, 1),
                                child: Text(
                                  'MN',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Text('data'),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                maxRadius: 22,
                                backgroundColor: Colors.blueGrey,
                                child: Text(
                                  'MN',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Text('data'),
                            ],
                          )
                        ],
                      ),

                      // Second row of Contact Tiles
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                maxRadius: 22,
                                backgroundColor: Colors.blueGrey,
                                child: Text(
                                  'MN',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Text('data'),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                maxRadius: 22,
                                backgroundColor:
                                    Color.fromRGBO(209, 153, 85, 1),
                                child: Text(
                                  'MN',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Text('data'),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        UpcomingActivity(),
      ],
    );
  }
}
