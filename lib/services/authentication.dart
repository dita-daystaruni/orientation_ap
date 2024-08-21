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

Future singUp(String admissionNo, String email, String userName,
    {bool emailverified = true}) async {
  var response = await http.post(
    Uri.parse('$baseUrl/api/accounts/'),
    headers: headers,
    body: jsonEncode({
      'admission_number': admissionNo,
      'email': email,
      'username': userName,
      'email_verified': emailverified,
    }),
  );
  return [response.statusCode, jsonDecode(response.body)];
}
