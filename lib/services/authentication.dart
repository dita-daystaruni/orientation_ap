import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

import 'firebase_notifications.dart';

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

  try {
    // Parse the response
    var responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      // Login successful
      // get the FCM token
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      String? registrationId = await messaging.getToken();
      String token = responseBody['token'];

      if (registrationId != null) {
        print("The FCM token is $registrationId");
        // Send the token
        await sendToken(token: token, registrationId: registrationId);
      } else {
        print("Failed to get FCM token.");
      }
    }
  } catch (e) {
    print(e);
  }
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
