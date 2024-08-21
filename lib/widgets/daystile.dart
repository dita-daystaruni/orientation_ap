import 'package:flutter/material.dart';

class DaysTile extends StatelessWidget {
  final String day;
  final String date;
  const DaysTile({super.key, required this.day, required this.date});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                day,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                date,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
