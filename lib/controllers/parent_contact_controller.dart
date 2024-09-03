import 'dart:convert';
import 'package:get/get.dart';
import 'package:orientation_app/models/parent_contact.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ParentContactController extends GetxController {
  RxList<ParentContact> parentContacts = <ParentContact>[].obs;

  @override
  void onInit() async {
    // set contacts
    await getParentsContactsFromSP();
    super.onInit();
  }

  // caches users contacts
  Future<void> addParentsContactsToSP(List<String> parentContacts) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("parent contacts", parentContacts);
  }

  // gets users contacts from SP
  Future getParentsContactsFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? userContactsString = prefs.getStringList("parent contacts");
    if (userContactsString != null) {
      // clear contacts before adding new ones
      parentContacts.clear();
      // adding new contacts
      for (var element in userContactsString) {
        parentContacts.add(
          ParentContact.fromJson(
            jsonDecode(element),
          ),
        );
      }
      return parentContacts;
    }
    return null;
  }
}
