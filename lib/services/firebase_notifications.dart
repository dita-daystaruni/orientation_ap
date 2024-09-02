import 'dart:convert';
import 'package:http/http.dart' as http;

String baseUrl = 'http://62.169.16.219:81';
Map<String, String> headers = {
  'Content-type': 'application/json; charset=UTF-8',
};

Future<void> sendToken(
    {required String token, required String registrationId}) async {
  // Make an API call to save the token
  headers.addAll(
    {
      "Authorization": "Token $token",
    },
  );
  await http.post(
    Uri.parse('$baseUrl/notifications/register-device/'),
    headers: headers,
    body: jsonEncode(<String, String>{
      'registration_id': registrationId,
    }),
  );
}
