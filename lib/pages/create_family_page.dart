import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/controllers/family_controller.dart';
import 'package:orientation_app/models/family_model.dart';
import 'package:sliver_tools/sliver_tools.dart';

class CreateFamilyPage extends StatefulWidget {
  const CreateFamilyPage({super.key});

  @override
  State<CreateFamilyPage> createState() => _CreateFamilyPageState();
}

class _CreateFamilyPageState extends State<CreateFamilyPage> {
  final FamilyController _familyController = Get.find<FamilyController>();
  final formState = GlobalKey<FormState>();
  final TextEditingController _familyNameController = TextEditingController();
  final TextEditingController _parentIDController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formState,
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Create a family"),
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
                        "Please ensure that the parent is not a member of an existing group",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  TextFormField(
                    controller: _familyNameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.length < 5) {
                        return "Please provide a valid push notification title";
                      }
                      return null;
                    },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: "Family name",
                      hintText: "Wakadinali",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _parentIDController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.length < 7) {
                        return "Please provide a valid push notification body";
                      }
                      return null;
                    },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: "Parent Admission Number",
                      hintText: "seperate using a comma for multiple parents",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Obx(
                    () => FilledButton(
                      onPressed: () async {
                        if (!formState.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text("Please fill in  the form to continue"),
                            ),
                          );
                          return;
                        }
                        Family fam = Family(
                          id: "",
                          picture: "",
                          collectionId: "",
                          collectionName: "",
                          children: [],
                          name: _familyNameController.text.trim(),
                          parent: _parentIDController.text.trim().split(","),
                          created: DateTime.now(),
                          updated: DateTime.now(),
                        );

                        final res = await _familyController.createFamily(fam);
                        res.fold((error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(error),
                            ),
                          );
                          return;
                        }, (family) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Family ${family.name} created successfully",
                              ),
                            ),
                          );
                          return;
                        });
                      },
                      child: _familyController.isBusy.value
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text("Create family"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
