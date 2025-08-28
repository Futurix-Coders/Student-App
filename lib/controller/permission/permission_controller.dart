import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionController extends GetxController {
  // Observable variables
  final locationPermissionGranted = false.obs;
  final notificationPermissionGranted = false.obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkPermissions();
  }

  // Check current permission status
  Future<void> checkPermissions() async {
    isLoading.value = true;
    
    try {
      // Check location permission
      final locationStatus = await Permission.location.status;
      locationPermissionGranted.value = locationStatus.isGranted;
      
      // Check notification permission
      final notificationStatus = await Permission.notification.status;
      notificationPermissionGranted.value = notificationStatus.isGranted;
    } catch (e) {
      if (kDebugMode) {
        print('Error checking permissions: $e');
      }
    } finally {
      isLoading.value = false;
    }
  }

  // Request location permission
  Future<void> requestLocationPermission() async {
    try {
      isLoading.value = true;
      
      final status = await Permission.location.request();
      
      if (status.isGranted) {
        locationPermissionGranted.value = true;
        // Navigate to notification permission
        await Future.delayed(const Duration(seconds: 1));
        Get.offAllNamed('/notification-permission');
      } else if (status.isDenied) {
      } else if (status.isPermanentlyDenied) {
        Get.snackbar(
          'Permission Required',
          'Location permission is permanently denied. Please enable it in app settings.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        
        // Open app settings
        await openAppSettings();
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to request location permission. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Request notification permission
  Future<void> requestNotificationPermission() async {
    try {
      isLoading.value = true;
      
      final status = await Permission.notification.request();
      
      if (status.isGranted) {
        notificationPermissionGranted.value = true;
        // Navigate to home after permissions
        await Future.delayed(const Duration(seconds: 1));
        Get.offAllNamed('/home');
      } else if (status.isDenied) {
        Get.snackbar(
          'Permission Denied',
          'Notification permission is required for this app to function properly.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange,
          colorText: Colors.white,
        );
      } else if (status.isPermanentlyDenied) {
        Get.snackbar(
          'Permission Required',
          'Notification permission is permanently denied. Please enable it in app settings.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        
        // Open app settings
        await openAppSettings();
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to request notification permission. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Skip location permission (for testing)
  void skipLocationPermission() {
    Get.offAllNamed('/notification-permission');
  }

  // Skip notification permission (for testing)
  void skipNotificationPermission() {
    Get.offAllNamed('/home');
  }

  // Check if all permissions are granted
  bool get allPermissionsGranted {
    return locationPermissionGranted.value && notificationPermissionGranted.value;
  }
}
