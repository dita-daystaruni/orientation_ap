import 'package:flutter/material.dart';

class Faq extends StatelessWidget {
  const Faq({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text.rich(
                TextSpan(
                    text: 'Frequently Asked Questions',
                    style: Theme.of(context).textTheme.headlineSmall),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      leading: const Icon(
                        Icons.question_mark,
                        color: Colors.amber,
                        size: 40,
                        weight: 10,
                      ),
                      title: const Text(
                        'Where is the PAC?',
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.navigate_next,
                        ),
                        color: Colors.blue,
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      leading: const Icon(
                        Icons.question_mark,
                        color: Colors.deepPurpleAccent,
                        size: 40,
                        weight: 10,
                      ),
                      title: const Text(
                        'Are we coming to school tomorrow?',
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.navigate_next),
                        color: Colors.blue,
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
