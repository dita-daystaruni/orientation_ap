import 'dart:convert';
import 'package:http/http.dart' as http;

String baseUrl = 'http://34.239.49.60:80/';
const Map<String, String> headers = {
  'Content-type': 'application/json; charset=UTF-8',
};

// sends login response to the backend
Future signIn(
  String admissionNo,
  String password,
) async {
  var response = await http.post(
    Uri.parse('$baseUrl/api/login/'),
    headers: headers,
    body: jsonEncode(<String, String>{
      "admission_number": admissionNo,
      "password": password,
    }),
  );
  return [response.statusCode, jsonDecode(response.body)];
}
