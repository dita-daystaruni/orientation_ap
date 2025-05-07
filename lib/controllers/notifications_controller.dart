import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:orientation_app/models/user_model.dart';

class NotificationController extends GetxController {

  Future<bool> requestPermission(User user) async {
    try {
      final granted = await OneSignal.Notifications.requestPermission(true);
      if (granted) {
        OneSignal.User.addEmail(user.email);
        OneSignal.User.addAlias("id", user.id);
        OneSignal.User.addTags({
          "firstname": user.firstName,
          "othernames": user.otherNames,
        });
      }
      return true;
    } catch (e) {
      return false;
    }
  }
  Future<String> sendPushNotification(String title, String body) async {
    const url = 'https://onesignal.com/api/v1/notifications';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':
              'Basic os_v2_app_hbjummsiafddba5uer72cxicv7vqo3y7ul4ulu4e3qcr4cldp6xklk7araxafarmekrvggvcjf6cpzprqga5dcjso5xbkcmlsscplki', // Replace or use oneSignalRestApiKey variable
        },
        body: jsonEncode({
          "app_id": "38534632-4801-4630-83b4-247fa15d02af",
          "included_segments": ["All"],
          "headings": {"en": title},
          "contents": {"en": body},
        }),
      );
      if (response.statusCode == 200) {
        print("Hereeeeeeeeeeeeeeeeeeeee");
        print(response.body);
        return "Notification sent successfully!";
        
      } else {
        return "Failed to send notification: ${response.body}";
      }

    
    } catch (e) {
      return "Error: $e";
    }
  }
}
