import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/controllers/family_controller.dart';
import 'package:orientation_app/models/family_model.dart';
import 'package:sliver_tools/sliver_tools.dart';

class FamilyViewPage extends StatefulWidget {
  const FamilyViewPage({super.key});

  @override
  State<FamilyViewPage> createState() => _FamilyViewPageState();
}

class _FamilyViewPageState extends State<FamilyViewPage> {
  final FamilyController _familyController = Get.find<FamilyController>();

  late Future<dartz.Either<String, List<Family>>> allResults;

  @override
  void initState() {
    allResults = _familyController.fetchAllFamilies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Families"),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(12),
            sliver: MultiSliver(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
