import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:orientation_app/models/user_model.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  final _baseUrl = "http://192.168.221.235:8090";
  final Logger _logger = Logger();
  Rx<User?> user = Rxn<User>();
  Rx<bool> isLoggedIn = false.obs;
  Rx<bool> isLoading = false.obs;

  // get user object and loggenedin value
  @override
  void onInit() async {
    await _loadPocketBase();
    _logger.i("PocketBase loaded successfully");
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    final PocketBase pocketBase = GetIt.instance.get<PocketBase>();
    if (pocketBase.authStore.isValid) {
      user.value = await _getUserFromCache();
    } else {}
  }

  Future<void> _loadPocketBase() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getString("pb_auth") == null) {
      if (GetIt.instance.isRegistered<PocketBase>()) {
        GetIt.instance.unregister<PocketBase>();
      }

      GetIt.instance.registerSingleton<PocketBase>(
        PocketBase(_baseUrl),
      );
      return;
    }

    // Load the authentication token
    final store = AsyncAuthStore(
      save: (String data) async => prefs.setString("pb_auth", data),
      initial: prefs.getString("pb_auth"),
    );

    if (GetIt.instance.isRegistered<PocketBase>()) {
      GetIt.instance.unregister<PocketBase>();
    }

    GetIt.instance.registerSingleton<PocketBase>(
      PocketBase(_baseUrl, authStore: store),
    );
  }

  // caches users info
  Future<void> _addUserToCache(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", json.encode(user.toJson()));
    _logger.i("user information cached successfully");
  }

  // gets users info from cache
  Future<User?> _getUserFromCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.reload();
    final String? userString = prefs.getString("user");
    if (userString != null) {
      final user = User.fromJson(
        jsonDecode(userString),
      );
      _logger.i("User info retrieved successfully");
      return user;
    }
    _logger.w("No user information was cached yet!");
    return null;
  }

  Future<bool> _removeUserFromCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.reload();
    return await prefs.clear();
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
      final userData = authStore.record.toJson();
      userData["profile"] = userData["expand"]["profile"];
      user.value = User.fromJson(userData);
      _addUserToCache(user.value!);
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

  Future<Either<String, bool>> logout() async {
    if (isLoading.value) return right(false);
    isLoading.value = true;

    try {
      final pocketBase = GetIt.instance.get<PocketBase>();
      pocketBase.authStore.clear();
      _removeUserFromCache();
      user.value = null;
      _logger.i("successfully logged out user");
      isLoading.value = false;
      return right(true);
    } on ClientException catch (e) {
      _logger.e(
        "Exception occurred while logging out",
        error: e,
      );
      isLoading.value = false;
      return left(
        e.response["message"] ??
            "Please check your internet connection and try again.",
      );
    } catch (e) {
      _logger.e(
        "Exception occurred while logging out",
        error: e,
      );
      isLoading.value = false;
      return left(
        "Please check your internet connection and try again.",
      );
    }
  }
}
