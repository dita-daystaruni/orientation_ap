import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

String baseUrl = 'http://34.239.49.60:80';
const Map<String, String> headers = {
  'Content-type': 'application/json; charset=UTF-8',
};

Future<void> signIn(
  String admissionNo,
  String password,
) async {
  if (admissionNo.isEmpty || password.isEmpty) {
    Get.snackbar('Empty Field(s)', 'Ensure you have filled all the fiels');
  } else {
    var response = await http.post(
      Uri.parse('$baseUrl/api/login/'),
      headers: headers,
      body: jsonEncode(<String, String>{
        "username": admissionNo,
        "password": password,
      }),
    );
    if (response.statusCode == 200) {
      // print(response.body);
    } else if (response.statusCode >= 400) {
      //print(response.body);
      var decodedresponse = jsonDecode(response.body);
      //print(decodedresponse);
    }
  }
}
