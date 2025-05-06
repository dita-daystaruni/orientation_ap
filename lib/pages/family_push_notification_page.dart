import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class FamilyPushNotificationPage extends StatefulWidget {
  const FamilyPushNotificationPage({super.key});

  @override
  State<FamilyPushNotificationPage> createState() =>
      _FamilyPushNotificationPageState();
}

class _FamilyPushNotificationPageState
    extends State<FamilyPushNotificationPage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Push notification configuration"),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(12),
              sliver: MultiSliver(
                children: [
                  SliverPinnedHeader(
                    child: Container(
                      color: Theme.of(context).colorScheme.surface,
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        "Please specify a title and a body to send push notifications to your children",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.length < 5) {
                        return "Please provide a valid push notification title";
                      }
                      return null;
                    },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: "Push Notification Title",
                      hintText: "e.g Reminder",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.length < 5) {
                        return "Please provide a valid push notification body";
                      }
                      return null;
                    },
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: "Push Notification Body",
                      hintText:
                          "e.g Please remeber to carry your details tommorrow",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  FilledButton(
                    onPressed: () {},
                    child: const Text("Send Push Notification"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
