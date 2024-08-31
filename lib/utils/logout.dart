import 'package:shared_preferences/shared_preferences.dart';

// logouts users
Future<void> logOutUser() async {
  // get shared preferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}
