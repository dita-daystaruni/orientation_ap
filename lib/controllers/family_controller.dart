import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:orientation_app/models/family_model.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class FamilyController extends GetxController {
  Rxn<Family> family = Rxn(null);

  final Logger _logger = Logger();

  Future<Either<String, Family>> fetchFamilyDetails(String userID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final pocketBase = GetIt.instance.get<PocketBase>();

      final results = await pocketBase.collection("families").getFullList(
            filter: 'children ~ "$userID" || parent = "$userID"',
            expand: "children,parent,children.profile",
          );

      // map the result to a family object
      family.value = Family.fromJson(results.first.toJson());
      _logger.i(family.value!.toJson());

      prefs.setString("family", jsonEncode(family.value!.toJson()));
      return right(family.value!);
    } on ClientException catch (e) {
      _logger.e(
        "Exception occurred while logging out",
        error: e,
      );
      return left(
        e.response["message"] ??
            "Please check your internet connection and try again.",
      );
    } catch (e) {
      _logger.e(
        "Exception occurred while logging in",
        error: e,
      );
      return left("$e");
    }
  }

  Future<Either<String, bool>> addStudentToFamily(String admno, Family fam,) async {
    try {
      final pocketBase = GetIt.instance.get<PocketBase>();

      final results = await pocketBase.collection("families").getFullList(
            filter: 'children ~ "$admno"',
            expand: "children,parent,children.profile",
          );

      if (results.isNotEmpty) {
        family.value = Family.fromJson(results.first.toJson());
        return left(
          "The specified student is already a member of ${family.value!.name}",
        );
      }
      return right(true);
    } on ClientException catch (e) {
      _logger.e(
        "Exception occurred while adding student to family",
        error: e,
      );
      return left(
        e.response["message"] ??
            "Please check your internet connection and try again.",
      );
    } catch (e) {
      _logger.e(
        "Exception occurred while logging in",
        error: e,
      );
      return left("$e");
    }
  }
}
