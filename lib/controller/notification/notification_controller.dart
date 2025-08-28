import 'package:get/get.dart';
import '../../models/notification_models.dart';

class NotificationController extends GetxController {
  var notifications = <NotificationModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadNotifications();
  }

  void loadNotifications() {
    // Simulate loading notifications
    notifications.value = [
      NotificationModel(
        id: '1',
        title: 'Welcome!',
        message: 'Thanks for joining the Student App.',
        date: DateTime.now().subtract(const Duration(hours: 1)),
      ),
      NotificationModel(
        id: '2',
        title: 'Assignment Due',
        message: 'Your DBMS assignment is due tomorrow.',
        date: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ];
  }

  void sendNotificationToPhone(NotificationModel notification) {
    // Here you would integrate with local notification plugin
    // For now, just simulate
    Get.snackbar(
      notification.title,
      notification.message,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void markAsRead(String id) {
    final index = notifications.indexWhere((n) => n.id == id);
    if (index != -1) {
      notifications[index] = NotificationModel(
        id: notifications[index].id,
        title: notifications[index].title,
        message: notifications[index].message,
        date: notifications[index].date,
        isRead: true,
      );
      notifications.refresh();
    }
  }
}
