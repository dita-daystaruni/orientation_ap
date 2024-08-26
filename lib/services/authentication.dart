import 'dart:convert';
import 'package:http/http.dart' as http;

String baseUrl = 'http://62.169.16.219:81';
const Map<String, String> headers = {
  'Content-type': 'application/json; charset=UTF-8',
};

// sends login response to the backend
Future signIn(
  String admissionNo,
  String password,
) async {
  var response = await http.post(
    Uri.parse('$baseUrl/account/login/'),
    headers: headers,
    body: jsonEncode(<String, String>{
      "admission_number": admissionNo,
      "password": password,
    }),
  );
  return [response.statusCode, jsonDecode(response.body)];
}

Future changeFirstTimePassword(
  String admissionNo,
  String newPassword,
) async {
  var response = await http.post(
    Uri.parse('$baseUrl/account/first-password-change/'),
    headers: headers,
    body: jsonEncode({
      'admission_number': admissionNo,
      'new_password': newPassword,
    }),
  );
  return [response.statusCode, jsonDecode(response.body)];
}
