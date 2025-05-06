import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class FamilyAddChildPage extends StatefulWidget {
  const FamilyAddChildPage({super.key});

  @override
  State<FamilyAddChildPage> createState() => _FamilyAddChildPageState();
}

class _FamilyAddChildPageState extends State<FamilyAddChildPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Add a child to your family"),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(12),
            sliver: MultiSliver(children: [
              const SizedBox(height: 22),
              Text(
                "NOTE: This will not work if the child has another parent",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 22),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.length < 5) {
                    return "Please provide a valid admission number";
                  }
                  return null;
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: "Admission number",
                  hintText: "e.g 00-0000",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 22),
              FilledButton(
                onPressed: () {},
                child: const Text("Add child"),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
