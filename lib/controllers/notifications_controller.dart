import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/web.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:orientation_app/models/user_model.dart';

class NotificationController extends GetxController {
  final Logger _logger = Logger();

  Future<bool> requestPermission(User user) async {
    try {
      final granted = await OneSignal.Notifications.requestPermission(true);
      if (granted) {
        OneSignal.User.addEmail(user.email);
        OneSignal.User.addAlias("id", user.id);
        OneSignal.User.addTags({
          "firstname": user.firstName,
          "othernames": user.otherNames,
          "school_email": user.expandedProfile?.schoolEmail
        });
        OneSignal.login(user.id);
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String> sendPushNotification(String title, String body,
      [List<String>? userEmails]) async {
    const url = 'https://onesignal.com/api/v1/notifications';

    try {
      final Map<String, dynamic> payload = {
        "app_id": "38534632-4801-4630-83b4-247fa15d02af",
        "headings": {"en": title},
        "contents": {"en": body},
      };

      if (userEmails == null) {
        payload["included_segments"] = ["All"];
      } else {
        List<Map<String, dynamic>> filters = [];
        for (int i = 0; i < userEmails.length; i++) {
          if (i > 0) filters.add({"operator": "OR"});
          filters.add({
            "field": "tag",
            "key": "school_email",
            "relation": "=",
            "value": userEmails[i],
          });
        }
        payload["filters"] = filters;
      }

      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':
              'Basic os_v2_app_hbjummsiafddba5uer72cxicv7qlg7iqfoyummnpimkgdugousorkdkmnh2rsrf4wjbrf7uubcxecrassrakbj2l4bodlnggh2n35ci',
        },
        body: jsonEncode(payload),
      );

      if (response.statusCode == 200) {
        _logger.t(response.body);
        return "Notification sent successfully!";
      } else {
        return "Failed to send notification: ${response.body}";
      }
    } catch (e) {
      return "Error: $e";
    }
  }
}
