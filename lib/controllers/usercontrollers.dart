import 'dart:convert';
import 'package:get/get.dart';
import 'package:orientation_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  Rx<User?> user = Rxn<User>();
  Rx<bool> isLoggedIn = false.obs;

  // get user object and loggenedin value
  @override
  void onInit() async {
    await getUserFromSP();
    await getLoggedInFromSP();
    super.onInit();
  }

  // set login to true or false
  Future<void> setLoginToSp(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLoggedIn", isLoggedIn);
  }

  // getCurrent Login Value
  Future getLoggedInFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? isLogged = prefs.getBool("isLoggedIn");
    if (isLogged != null) {
      isLoggedIn.value = isLogged;
    }
    return isLoggedIn.value;
  }

  // caches users info
  Future<void> addUserToSP(String user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", user);
  }

  // gets users info from SP
  Future getUserFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? usersString = prefs.getString("user");
    if (usersString != null) {
      user.value = User.fromJson(
        jsonDecode(usersString),
      );
      return user.value;
    }
    return null;
  }
}
