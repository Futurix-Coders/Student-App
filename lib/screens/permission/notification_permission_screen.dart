import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/permission/permission_controller.dart';
import '../../theme/app_theme.dart';

class NotificationPermissionScreen extends StatelessWidget {
  const NotificationPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final permissionController = Get.put(PermissionController());

    return Scaffold(
      backgroundColor: AppTheme.lightGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              
              // Header Section
              Column(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryBlue,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                                                     color: AppTheme.primaryBlue.withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.notifications_active,
                      size: 60,
                      color: AppTheme.white,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Notification Permission',
                    style: AppTheme.heading1,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Stay updated with important academic information and updates',
                    style: AppTheme.bodyLarge.copyWith(
                      color: AppTheme.darkGrey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              
              const SizedBox(height: 48),
              
              // Permission Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.notifications,
                        size: 48,
                        color: AppTheme.primaryBlue,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Why Notifications?',
                        style: AppTheme.heading3,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '• Class schedule updates\n• Assignment deadlines\n• Exam notifications\n• Important announcements\n• Attendance reminders',
                        style: AppTheme.bodyMedium.copyWith(
                          color: AppTheme.darkGrey,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Action Buttons
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Obx(() => ElevatedButton(
                    onPressed: permissionController.isLoading.value
                        ? null
                        : permissionController.requestNotificationPermission,
                    child: permissionController.isLoading.value
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppTheme.white,
                              ),
                            ),
                          )
                        : const Text('Allow Notifications'),
                  )),
                  
                  const SizedBox(height: 16),
                  
                  OutlinedButton(
                    onPressed: permissionController.skipNotificationPermission,
                    child: const Text('Skip for Now'),
                  ),
                ],
              ),
              
              const SizedBox(height: 40),
              
              // Footer
              Text(
                'You can change this permission later in app settings',
                style: AppTheme.bodySmall.copyWith(
                  color: AppTheme.darkGrey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
