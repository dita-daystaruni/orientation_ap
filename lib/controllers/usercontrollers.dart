import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:orientation_app/models/user_model.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  final Logger _logger = Logger();
  Rx<User?> user = Rxn<User>();
  Rx<bool> isLoggedIn = false.obs;
  Rx<bool> isLoading = false.obs;

  // get user object and loggenedin value
  @override
  void onInit() async {
    // await getUserFromSP();
    // await getLoggedInFromSP();
    await _loadPocketBase();
    _logger.i("PocketBase loaded successfully");
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    final PocketBase pocketBase = GetIt.instance.get<PocketBase>();
    if (pocketBase.authStore.isValid) {
      _loadUserFromPrefs();
    } else {}
  }

  Future<bool> _loadUserFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    user.value = prefs.getString("user") == null
        ? null
        : User.fromJson(json.decode(prefs.getString("user")!));
    _logger.t(user.value?.toJson());
    return user.value == null ? true : false;
  }

  Future<void> _loadPocketBase() async {
    final prefs = await SharedPreferences.getInstance();

    final store = AsyncAuthStore(
      save: (String data) async => prefs.setString("pb_auth", data),
      initial: prefs.getString("pb_auth"),
    );

    if (GetIt.instance.isRegistered<PocketBase>()) {
      GetIt.instance.unregister<PocketBase>();
    }

    GetIt.instance.registerSingleton<PocketBase>(
      PocketBase('http://192.168.2.114:8090', authStore: store),
    );
  }

  // set login to true or false
  Future<void> setLoginToSp(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLoggedIn", isLoggedIn);
  }

  // getCurrent Login Value
  Future getLoggedInFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.reload();
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
    await prefs.reload();
    final String? usersString = prefs.getString("user");
    if (usersString != null) {
      user.value = User.fromJson(
        jsonDecode(usersString),
      );
      return user.value;
    }
    return null;
  }

  // Attempts to perform authentication as a student who's to be onboarded.
  // The username can be passed as the user's admission number.
  Future<Either<String, bool>> login(String username, String password) async {
    if (isLoading.value) return right(false);
    isLoading.value = true;

    try {
      final pocketBase = GetIt.instance.get<PocketBase>();
      final authStore = await pocketBase.collection("users").authWithPassword(
            username,
            password,
            expand: "profile",
          );
      _logger.i(authStore.record.toJson());
      user.value = User.fromJson(authStore.record.toJson());

      isLoading.value = false;
      return right(true);
    } on ClientException catch (e) {
      _logger.e(
        "Exception occurred while logging in",
        error: e,
      );
      isLoading.value = false;
      return left(
        e.response["message"] ??
            "Please check your internet connection and try again.",
      );
    } catch (e) {
      _logger.e(
        "Exception occurred while logging in",
        error: e,
      );
      isLoading.value = false;
      return left("");
    }
  }
}
