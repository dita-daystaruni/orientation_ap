import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:orientation_app/models/notification_model.dart';

String baseUrl = 'http://62.169.16.219:81';
Map<String, String> headers = {
  'Content-type': 'application/json; charset=UTF-8',
};

// get recent notifications from backend
Future<List> getRecentNotifications(String token) async {
  // adding token to header
  headers.addAll(
    {
      "Authorization": "Token $token",
    },
  );
  var response = await http.get(
    Uri.parse('$baseUrl/notifications/recent/'),
    headers: headers,
  );
  return [response.statusCode, jsonDecode(response.body)];
}

Future<List> getNotifications(String token) async {
  // adding token to header
  headers.addAll(
    {
      "Authorization": "Token $token",
    },
  );
  var response = await http.get(
    Uri.parse('$baseUrl/notifications/notifications/'),
    headers: headers,
  );
  return [response.statusCode, jsonDecode(response.body)];
}

// send notification to backend
Future<List> sendNotification({
  required String token,
  required NotificationModel notification,
}) async {
  headers.addAll({
    "Authorization": "Token $token",
  });

  var response = await http.post(
    Uri.parse('$baseUrl/notifications/notifications/'),
    headers: headers,
    body: jsonEncode(notification.toJson()),
  );
  return [response.statusCode, jsonDecode(response.body)];
}
