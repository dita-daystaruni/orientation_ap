import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:orientation_app/models/attendance_model.dart';
import 'package:orientation_app/models/attendance_type.dart';
import 'package:pocketbase/pocketbase.dart';

final class AttendanceController extends GetxController {
  final Logger _logger = Logger();
  RxBool isLoading = false.obs;
  RxList<Attendance> attendances = <Attendance>[].obs;
  RxList<AttendanceType> attendanceTypes = <AttendanceType>[].obs;

  Future<Either<String, bool>> markAttendance(Attendance attendance) async {
    try {
      isLoading.value = true;

      final pocketBase = GetIt.instance.get<PocketBase>();

      final attendanceRes = await pocketBase
          .collection("attendance")
          .create(body: attendance.toJson());

      attendance = Attendance.fromJson(attendanceRes.toJson());

      final res = await fetchAllAttendances(attendance.family);

      isLoading.value = false;
      return res.fold((error) {
        return left(error);
      }, (ok) {
        return right(true);
      });
    } on ClientException catch (e) {
      _logger.e(
        "Exception occurred while marking attendance",
        error: e,
      );

      isLoading.value = false;
      return left(
        e.response["message"] ??
            "Please check your internet connection and try again.",
      );
    } catch (e) {
      _logger.e(
        "Exception occurred while marking attendance",
        error: e,
      );

      isLoading.value = false;
      return left("$e");
    }
  }

  Future<Either<String, bool>> fetchAllAttendancesTypes() async {
    try {
      isLoading.value = true;

      final PocketBase pocketBase = GetIt.instance.get<PocketBase>();

      final attendanceRes =
          await pocketBase.collection("attendanceType").getFullList();

      attendanceTypes.clear();
      // load the attendances
      attendanceTypes.addAll(
        attendanceRes.map((a) => AttendanceType.fromJson(a.toJson())).toList(),
      );
      isLoading.value = false;
      return right(true);
    } on ClientException catch (e) {
      _logger.e(
        "Exception occurred while loading attendance types",
        error: e,
      );
      isLoading.value = false;
      return left(
        e.response["message"] ??
            "Please check your internet connection and try again.",
      );
    } catch (e) {
      _logger.e(
        "Exception occurred while fetching attendance types",
        error: e,
      );
      isLoading.value = false;
      return left(
        "Please check your internet connection and try again.",
      );
    }
  }

  Future<Either<String, bool>> fetchAllAttendances(String familyID) async {
    try {
      isLoading.value = true;

      final PocketBase pocketBase = GetIt.instance.get<PocketBase>();

      final attendanceRes = await pocketBase
          .collection("attendance")
          .getFullList(
            filter: 'family = "$familyID"',
            expand: "markedBy, markedBy.profile, type, marked, marked.profile",
          );

      attendances.clear();
      // load the attendances
      attendances.addAll(
        attendanceRes.map((a) => Attendance.fromJson(a.toJson())).toList(),
      );
      isLoading.value = false;
      return right(true);
    } on ClientException catch (e) {
      _logger.e(
        "Exception occurred while loading attendance",
        error: e,
      );
      isLoading.value = false;
      return left(
        e.response["message"] ??
            "Please check your internet connection and try again.",
      );
    } catch (e) {
      _logger.e(
        "Exception occurred while fetching attendances",
        error: e,
      );
      isLoading.value = false;
      return left(
        "Please check your internet connection and try again.",
      );
    }
  }
}
