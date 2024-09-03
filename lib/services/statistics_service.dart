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
    Uri.parse('$baseUrl/account/statistics/?course=$courseName'),
    headers: headers,
  );
  return [response.statusCode, jsonDecode(response.body)];
}

Future fetchStatisticsData(
    {required String token, String? course}) async {
  headers.addAll(
    {
      "Authorization": "Token $token",
    },
  );
  final url = course != null && course.isNotEmpty
      ? "$baseUrl/account/statistics/data/?course=$course"
      : "$baseUrl/account/statistics/data/";
  
  var response = await http.get(Uri.parse(url), headers: headers);
  return [response.statusCode, jsonDecode(response.body)];
    
}
