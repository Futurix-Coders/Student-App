import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/notification/notification_controller.dart';
// import removed: '../../models/notification_models.dart';
import '../../widgets/app_bar.dart';
import '../../theme/app_theme.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationController = Get.put(NotificationController());
    return Scaffold(
      appBar: const CustomAppBar(title: 'Notifications'),
      backgroundColor: AppTheme.lightGrey,
      body: Obx(() {
        final notifications = notificationController.notifications;
        if (notifications.isEmpty) {
          return const Center(child: Text('No notifications yet.'));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return Card(
              color: notification.isRead
                  ? AppTheme.white
                  : AppTheme.lightBlue.withValues(alpha: 0.2 * 255),
              margin: const EdgeInsets.only(bottom: 16),
              child: ListTile(
                title: Text(notification.title, style: AppTheme.heading3),
                subtitle: Text(notification.message),
                trailing: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    notificationController.sendNotificationToPhone(notification);
                    notificationController.markAsRead(notification.id);
                  },
                  tooltip: 'Send to phone',
                ),
                onTap: () {
                  notificationController.markAsRead(notification.id);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
