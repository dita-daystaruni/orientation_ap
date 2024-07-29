import 'package:flutter/material.dart';

class Routines extends StatelessWidget {
  const Routines({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ListTile(
            trailing: Icon(Icons.notifications_outlined),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    'Routine',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                  ),
                  child: const Text(
                    "Routine",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
