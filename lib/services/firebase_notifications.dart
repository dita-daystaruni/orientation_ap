import 'dart:convert';
import 'package:http/http.dart' as http;

String baseUrl = 'http://127.0.0.1:8000';
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
  final response = await http.post(
    Uri.parse('$baseUrl/notifications/register-device/'),
    headers: headers,
    body: jsonEncode(<String, String>{
      'registration_id': registrationId,
    }),
  );

  if (response.statusCode == 201) {
    print('Token successfully sent to the backend.');
  } else {
    print(response.statusCode);
    print('Failed to send token to the backend.');
  }
}
