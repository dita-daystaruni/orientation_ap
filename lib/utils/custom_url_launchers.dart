import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  try {
    await launchUrl(launchUri);
  } catch (e) {
    debugPrint(e.toString());
  }
}

Future<void> sendEmail(String email) async {
  final Uri launchUri = Uri(
    scheme: 'mailto',
    path: email,
  );
  try {
    await launchUrl(launchUri);
  } catch (e) {
    debugPrint(e.toString());
  }
}
