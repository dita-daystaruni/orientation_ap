import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

String baseUrl = 'http://62.169.16.219:81';
Map<String, String> headers = {
  'Content-type': 'application/json; charset=UTF-8',
};

// Function to upload document with title and image
Future uploadDocument(
    String token, String documentTitle, XFile imageFile) async {
  // Create a multipart request
  var request = http.MultipartRequest(
    'POST',
    Uri.parse('$baseUrl/account/upload/'),
  );

  // Add authorization header
  request.headers['Authorization'] = 'Token $token';

  // Add document title as a field
  request.fields['title'] = documentTitle;

  // Add the image file as multipart
  request.files.add(await http.MultipartFile.fromPath(
    'file',
    imageFile.path,
  ));

  // Send the request
  var response = await request.send();

  if (response.statusCode == 201) {
    var responseBody = await response.stream.bytesToString();
    return jsonDecode(responseBody);
  } else {
    throw Exception(
        'Failed to upload document. Status code: ${response.statusCode}');
  }
}

Future<List> getDocuments(String token) async {
  try {
    // adding token to header
    headers.addAll(
      {
        "Authorization": "Token $token",
      },
    );
    var response = await http.get(
      Uri.parse('$baseUrl/account/documents/'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load document');
    }
  } catch (e) {
    throw Exception('Failed to load documents: $e');
  }
}
