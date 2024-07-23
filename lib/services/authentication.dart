import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<void> Sign_Up(String admission_no, String password) async {
  if (admission_no.isEmail || password.isEmpty) {
    Get.snackbar('Empty Field(s)', 'Ensure you have filled all the fiels');
  }
  http.get(
    Uri.parse('http://localhost:8000/api/auth/token/login/'),
  );
}
