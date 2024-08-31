import 'package:get/get.dart';
import 'package:orientation_app/models/notification_model.dart';
import 'package:orientation_app/services/notiications_service.dart';

class NotificationController extends GetxController {
  var notifications = <dynamic>[].obs;
  var recentNotifications = <dynamic>[].obs;

  final String userToken;

  NotificationController(this.userToken);

  @override
  void onInit() {
    super.onInit();
    fetchNotifications();
    fetchRecentNotifications();
  }

  // Function to fetch documents from the server
  void fetchNotifications() async {
    try {
      var response = await getNotifications(userToken);
      notifications.assignAll(response[1]);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch notifications');
    }
  }

  void fetchRecentNotifications() async {
    try {
      var response = await getRecentNotifications(userToken);
      recentNotifications.assignAll(response[1]);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch notifications');
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
