import 'dart:convert';
import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:orientation_app/models/attendance_model.dart';
import 'package:orientation_app/models/family_model.dart';
import 'package:orientation_app/models/user_model.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class FamilyController extends GetxController {
  Rxn<Family> family = Rxn(null);
  RxBool isBusy = false.obs;
  final Logger _logger = Logger();

  Future<Either<String, Family>> createFamily(Family fam) async {
    try {
      isBusy.value = true;

      final pocketBase = GetIt.instance.get<PocketBase>();

      final List<String> userIDs = [];

      for (final admno in fam.parent) {
        final idRes = await pocketBase
            .collection("users")
            .getFirstListItem('admissionNumber="$admno"');
        userIDs.add(idRes.id);
      }

      fam.parent.clear();
      fam.parent.addAll(userIDs);

      _logger.i(fam.toJson());
      final filter = fam.parent.map((id) => 'parent ~ "$id"').join(' || ');

      final userRes = await pocketBase.collection("families").getFullList(
            filter: filter,
            // 'children ~ "${fam.parent.first}" || parent ~ "${fam.parent.first}"',
            expand: "children,parent,children.profile",
          );
      if (userRes.isNotEmpty) {
        isBusy.value = false;
        return left(
          "The specified parent is already a member of another family",
        );
      }

      final results = await pocketBase.collection("families").create(
            body: fam.toJson(),
          );
      fam = Family.fromJson(results.toJson());

      isBusy.value = false;
      return right(fam);
    } on ClientException catch (e) {
      _logger.e(
        "Exception occurred while creating family",
        error: e,
      );

      isBusy.value = false;
      return left(
        e.response["message"] ??
            "Please check your internet connection and try again.",
      );
    } catch (e) {
      _logger.e(
        "Exception occurred while creating family",
        error: e,
      );

      isBusy.value = false;
      return left("Exception occurred while creating family");
    }
  }

  Future<Either<String, Family>> fetchFamilyDetails(String userID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final pocketBase = GetIt.instance.get<PocketBase>();

      final results = await pocketBase.collection("families").getFullList(
            filter: 'children ~ "$userID" || parent ~ "$userID"',
            expand: "children,parent,children.profile, parent.profile",
          );

      if (results.isEmpty) {
        return left("You are not enrolled yet to a family");
      }

      // map the result to a family object
      family.value = Family.fromJson(results.first.toJson());

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

  Future<Either<String, List<Family>>> fetchAllFamilies() async {
    try {
      isBusy.value = true;

      final pocketBase = GetIt.instance.get<PocketBase>();
      final results = await pocketBase.collection("families").getFullList(
            expand: "children,parent,children.profile, parent.profile",
          );
      final families =
          results.map((result) => Family.fromJson(result.toJson())).toList();

      isBusy.value = false;
      return right(families);
    } on ClientException catch (e) {
      _logger.e(
        "Exception occurred while logging out",
        error: e,
      );

      isBusy.value = false;
      return left(
        e.response["message"] ??
            "Please check your internet connection and try again.",
      );
    } catch (e) {
      _logger.e(
        "Exception occurred while logging in",
        error: e,
      );

      isBusy.value = false;
      return left("$e");
    }
  }

  Future<Either<String, bool>> addStudentToFamily(
    String admno,
    Family fam,
  ) async {
    try {
      isBusy.value = true;
      final pocketBase = GetIt.instance.get<PocketBase>();

      // get the child's ID
      final childResults = await pocketBase.collection("users").getFullList(
            filter: 'admissionNumber = "$admno"',
          );

      if (childResults.isEmpty) {
        isBusy.value = false;
        return left("The specified child admissionNumber does not exist!");
      }

      final results = await pocketBase.collection("families").getFullList(
            filter: 'children ~ "${childResults.first.id}"',
            expand: "children,parent,children.profile",
          );

      if (results.isNotEmpty) {
        family.value = Family.fromJson(results.first.toJson());

        isBusy.value = false;
        return left(
          "The specified student is already a member of ${family.value!.name}",
        );
      }

      // Add the child to the family
      fam.children.add(childResults.first.id);
      final famRes = await pocketBase
          .collection("families")
          .update(fam.id, body: {"children": fam.children});

      if (!Family.fromJson(famRes.toJson())
          .children
          .contains(childResults.first.id)) {
        isBusy.value = false;
        return left("Failed to add child to family");
      }

      isBusy.value = false;
      return right(true);
    } on ClientException catch (e) {
      _logger.e(
        "Exception occurred while adding student to family",
        error: e,
      );

      isBusy.value = false;
      return left(
        e.response["message"] ??
            "Please check your internet connection and try again.",
      );
    } catch (e) {
      _logger.e(
        "Exception occurred while logging in",
        error: e,
      );

      isBusy.value = false;
      return left("$e");
    }
  }

  Future<Either<String, bool>> markAttendance(Attendance attendance) async {
    try {
      isBusy.value = true;

      final pocketBase = GetIt.instance.get<PocketBase>();

      final attendanceRes = await pocketBase
          .collection("attendance")
          .create(body: attendance.toJson());

      attendance = Attendance.fromJson(attendanceRes.toJson());
      return right(true);
    } on ClientException catch (e) {
      _logger.e(
        "Exception occurred while adding student to family",
        error: e,
      );

      isBusy.value = false;
      return left(
        e.response["message"] ??
            "Please check your internet connection and try again.",
      );
    } catch (e) {
      _logger.e(
        "Exception occurred while logging in",
        error: e,
      );

      isBusy.value = false;
      return left("$e");
    }
  }
}
