import 'package:get/get.dart';
import 'package:orientation_app/models/notification_model.dart';
import 'package:orientation_app/services/notiications_service.dart';

class NotificationController extends GetxController {
  var notifications = <dynamic>[].obs;
  var recentNotifications = <dynamic>[].obs;
  var isFetching = true.obs;

  final String userToken;

  NotificationController({required this.userToken});

  @override
  void onInit() async {
    super.onInit();
    await fetchNotifications();
    await fetchRecentNotifications();
  }

  // Function to fetch notifications from the server
  Future<void> fetchNotifications() async {
    try {
      var response = await getNotifications(userToken);
      notifications.assignAll(response[1]);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch notifications');
    } finally {
      isFetching.value = false;
    }
  }

  Future<void> fetchRecentNotifications() async {
    try {
      var response = await getRecentNotifications(userToken);
      recentNotifications.assignAll(response[1]);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch notifications');
    } finally {
      isFetching.value = false;
    }
  }

  Future<void> addNotifications(NotificationModel newNotification) async {
    try {
      await sendNotification(token: userToken, notification: newNotification);
      onInit();
      Get.snackbar('Success', 'Notification sent successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to add notifications');
    }
  }
}
