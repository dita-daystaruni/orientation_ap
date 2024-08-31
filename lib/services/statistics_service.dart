import 'dart:convert';
import 'package:http/http.dart' as http;

String baseUrl = 'http://62.169.16.219:81';
Map<String, String> headers = {
  'Content-type': 'application/json; charset=UTF-8',
};

Future getAllStatistics(String token) async {
  // adding token to header
  headers.addAll(
    {
      "Authorization": "Token $token",
    },
  );
  var response = await http.get(
    Uri.parse('$baseUrl/account/statistics'),
    headers: headers,
  );
  return [response.statusCode, jsonDecode(response.body)];
}

Future getCourseStatistic(String token, String courseName) async {
  // adding token to header
  headers.addAll(
    {
      "Authorization": "Token $token",
    },
  );
  var response = await http.get(
    Uri.parse('$baseUrl?course=$courseName'),
    headers: headers,
  );
  return [response.statusCode, jsonDecode(response.body)];
}
