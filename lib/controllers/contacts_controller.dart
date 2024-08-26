import 'dart:convert';
import 'package:get/get.dart';
import 'package:orientation_app/models/user_contact.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserContactController extends GetxController {
  RxList<UserContact> userContacts = <UserContact>[].obs;

  // caches users contacts
  Future<void> addUsersContactsToSP(List<String> userContacts) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("contacts", userContacts);
  }

  // gets users contacts from SP
  Future getUsersContactsFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? userContactsString = prefs.getStringList("contacts");
    if (userContactsString != null) {
      // clear contacts before adding new ones
      userContacts.clear();
      // adding new contacts
      for (var element in userContactsString) {
        userContacts.add(
          UserContact.fromJson(
            jsonDecode(element),
          ),
        );
      }
      return userContacts;
    }
    return null;
  }
}
