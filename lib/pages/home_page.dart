import 'package:flutter/material.dart';
import 'package:orientation_app/models/custom_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            //end of the Nav_ListTile
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Text(
                "Upcoming activity",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Card(
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Icon(Icons.place_outlined),
                          Text("Loacation")
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Icon(Icons.watch_later_outlined),
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
            const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Text(
                "Contacts",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // TODO Convert To A List View Builder
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 177, 102, 75),
                      radius: 25,
                      child: Text(
                        "MN",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 75, 157, 177),
                      radius: 25,
                      child: Text(
                        "BR",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 177, 102, 75),
                      radius: 25,
                      child: Text(
                        "MN",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 75, 157, 177),
                      radius: 25,
                      child: Text(
                        "BR",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 75, 157, 177),
                      radius: 25,
                      child: Text(
                        "BR",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 75, 157, 177),
                      radius: 25,
                      child: Text(
                        "BR",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 177, 102, 75),
                      radius: 25,
                      child: Text(
                        "MN",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 75, 157, 177),
                      radius: 25,
                      child: Text(
                        "BR",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 177, 102, 75),
                      radius: 25,
                      child: Text(
                        "MN",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 75, 157, 177),
                      radius: 25,
                      child: Text(
                        "BR",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Recent notifications",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: TextButton(
                    child: const Text(
                      "See all",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.blue,
                      ),
                    ),
                    onPressed: () => {},
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.circle_notifications_rounded,
                      size: 45,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      height: 80,
                      width: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Noticication Title - Senders_Name",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet,consectetur adipiscing elit pulor por",
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.circle_notifications_rounded,
                      size: 45,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      height: 80,
                      width: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Noticication Title - Senders_Name",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet,consectetur adipiscing elit pulor por",
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            //End of card
            //end of another card
          ],
        ),
      ),
    );
  }
}
