import 'dart:convert';
import 'package:http/http.dart' as http;

String baseUrl = 'http://62.169.16.219:81';
Map<String, String> headers = {
  'Content-type': 'application/json; charset=UTF-8',
};

// sends login response to the backend
Future getFaqs(String token) async {
  // adding token to header
  headers.addAll(
    {
      "Authorization": "Token $token",
    },
  );
  var response = await http.get(
    Uri.parse('$baseUrl/faqs/faqs/'),
    headers: headers,
  );
  return [response.statusCode, jsonDecode(response.body)];
}
