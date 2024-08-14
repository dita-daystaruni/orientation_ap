import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:orientation_app/models/contact_tile.dart';

class FreshmanDashboard extends StatelessWidget {
  const FreshmanDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "  Upcoming activity",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Card(
          color: Colors.white,
          elevation: 5,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/images/students.png",
                  height: 170,
                  width: 110,
                ),
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Activity name",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.place_outlined,
                        color: Colors.blue,
                      ),
                      Text("Location")
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        color: Colors.blue,
                      ),
                      Text("8:00AM - 10:00AM")
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        //end of the card
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text(
            "Contacts",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ContactTile(
                label: 'MN',
                bgColor: Color.fromRGBO(209, 153, 85, 1),
              ),
              ContactTile(
                label: 'BR',
                bgColor: Color.fromRGBO(49, 125, 137, 1),
              ),
              ContactTile(
                label: 'MN',
                bgColor: Color.fromRGBO(209, 153, 85, 1),
              ),
              ContactTile(
                label: 'BR',
                bgColor: Color.fromRGBO(49, 125, 137, 1),
              ),
              ContactTile(
                label: 'MN',
                bgColor: Color.fromRGBO(209, 153, 85, 1),
              ),
              ContactTile(
                label: 'BR',
                bgColor: Color.fromRGBO(49, 125, 137, 1),
              ),
              ContactTile(
                label: 'MN',
                bgColor: Color.fromRGBO(209, 153, 85, 1),
              ),
              ContactTile(
                label: 'BR',
                bgColor: Color.fromRGBO(49, 125, 137, 1),
              ),
              ContactTile(
                label: 'MN',
                bgColor: Color.fromRGBO(209, 153, 85, 1),
              ),
              ContactTile(
                label: 'BR',
                bgColor: Color.fromRGBO(49, 125, 137, 1),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
