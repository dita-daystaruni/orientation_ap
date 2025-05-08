import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/controllers/family_controller.dart';
import 'package:sliver_tools/sliver_tools.dart';

class FamilyAddChildPage extends StatefulWidget {
  const FamilyAddChildPage({super.key});

  @override
  State<FamilyAddChildPage> createState() => _FamilyAddChildPageState();
}

class _FamilyAddChildPageState extends State<FamilyAddChildPage> {
  final FamilyController _familyController = Get.find<FamilyController>();
  final admnoController = TextEditingController();
  final formState = GlobalKey<FormState>();
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
                  controller: admnoController,
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
                  onPressed: () async {
                    if (!formState.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Please complete the form to continue")));
                      return;
                    }
                    final res = await _familyController.addStudentToFamily(
                        admnoController.text.trim(),
                        _familyController.family.value!);

                    res.fold((error) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(error)));
                      return;
                    }, (ok) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Sucessfully added to your family")));
                      return;
                    });
                  },
                  child: Obx(
                    () => _familyController.isBusy.value
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text("Add child"),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
