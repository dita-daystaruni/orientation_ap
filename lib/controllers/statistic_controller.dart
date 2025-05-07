import 'package:get/get.dart';
import 'package:orientation_app/models/statistics_model.dart';

class StatisticsController extends GetxController {
  Rx<StatisticsModel> stats = StatisticsModel().obs;

}
