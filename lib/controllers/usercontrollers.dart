import 'package:get/get.dart';

class UsersControllers extends GetxController {
  var admno = ''.obs;
  var name = ''.obs;
  var email = ''.obs;
  var course = ''.obs;
  var password = ''.obs;
  UsersControllers({
    required this.admno,
    required this.name,
    required this.email,
    required this.password,
    required this.course,
  });
}
