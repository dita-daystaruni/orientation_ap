import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:orientation_app/models/statistics_model.dart';
import 'package:pocketbase/pocketbase.dart';

class StatisticsController extends GetxController {
  Rx<StatisticsModel> stats = StatisticsModel().obs;
  final Logger _logger = Logger();
  RxBool isBusy = false.obs;

  Future<Either<String, StatisticsModel>> fetchStats() async {
    try {
      final pocketBase = GetIt.instance.get<PocketBase>();

      final statsData = await pocketBase.collection("stats").getOne("1");
      stats.value = StatisticsModel.fromJson(statsData.toJson());

      return right(stats.value);
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
