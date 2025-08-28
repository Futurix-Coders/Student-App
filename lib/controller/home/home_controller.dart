import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../models/attendance_models.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  final currentIndex = 0.obs;
  final isLoading = false.obs;
  final currentPage = 0.obs;
  final userName = 'Student'.obs;
  final userDepartment = 'BCA'.obs;
  final userSemester = '3rd'.obs;

  // Attendance status
  final attendanceStatus = AttendanceStatus().obs;
  final isCheckingIn = false.obs;
  final isCheckingOut = false.obs;

  // Carousel data
  final List<Map<String, String>> carouselItems = [
    {
      'title': 'Welcome to New Semester!',
      'subtitle': 'Check your updated routine and assignments',
      'image': 'assets/images/splash.png',
    },
    {
      'title': 'Exam Schedule Released',
      'subtitle': 'View your upcoming exam dates',
      'image': 'assets/images/splash.png',
    },
    {
      'title': 'Library Hours Extended',
      'subtitle': 'Study late with extended library hours',
      'image': 'assets/images/splash.png',
    },
    {
      'title': 'Sports Meet Registration',
      'subtitle': 'Join the annual college sports competition',
      'image': 'assets/images/splash.png',
    },
    {
      'title': 'Tech Fest 2024',
      'subtitle': 'Showcase your projects and win prizes',
      'image': 'assets/images/splash.png',
    },
  ].obs;

  // Quick actions data
  final List<Map<String, dynamic>> quickActions = [
    {
      'title': 'Assignments',
      'subtitle': 'View pending',
      'icon': '📝',
      'color': 0xFF2196F3,
      'action': 'assignments',
    },
    {
      'title': 'Attendance Record',
      'subtitle': 'View history',
      'icon': '📈',
      'color': 0xFF9C27B0,
      'action': 'attendance_record',
    },
    {
      'title': 'MAR Certificate',
      'subtitle': 'View your MAR certificates',
      'icon': '📅',
      'color': 0xFFFF9800,
      'action': 'mar_certificate',
    },
    {
      'title': 'Fees',
      'subtitle': 'View dues',
      'icon': '💰',
      'color': 0xFF607D8B,
      'action': 'fees',
    },
    {
      'title': 'Results',
      'subtitle': 'View grades',
      'icon': '🏆',
      'color': 0xFF4CAF50,
      'action': 'results',
    },
    {
      'title': 'Classroom',
      'subtitle': 'Join Classroom',
      'icon': '🏫',
      'color': 0xFF4CAF50,
      'action': 'classroom',
    },
  ].obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
    loadAttendanceStatus();
    _checkDailyReset();
  }

  void loadUserData() {
    // TODO: Load user data from storage/API
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 1), () {
      isLoading.value = false;
    });
  }

  void loadAttendanceStatus() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final statusJson = prefs.getString('attendance_status');
      
      if (statusJson != null) {
        // Parse the JSON string back to Map
        final Map<String, dynamic> statusMap = json.decode(statusJson);
        final status = AttendanceStatus.fromJson(statusMap);
        attendanceStatus.value = status;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error loading attendance status: $e');
      }
      // If there's an error, start with fresh status
      attendanceStatus.value = AttendanceStatus();
    }
  }

  void _saveAttendanceStatus() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = json.encode(attendanceStatus.value.toJson());
      await prefs.setString('attendance_status', jsonString);
    } catch (e) {
      if (kDebugMode) {
        print('Error saving attendance status: $e');
      }
    }
  }

  void _checkDailyReset() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final resetTime = DateTime(now.year, now.month, now.day, 9, 0); // 9 AM

    // Check if it's past 9 AM and we need to reset
    if (now.isAfter(resetTime)) {
      final lastResetDate = attendanceStatus.value.lastCheckOutTime;
      if (lastResetDate == null || 
          !_isSameDay(lastResetDate, today)) {
        _resetAttendanceStatus();
      }
    }
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year && 
           date1.month == date2.month && 
           date1.day == date2.day;
  }

  void _resetAttendanceStatus() {
    attendanceStatus.value = AttendanceStatus();
    _saveAttendanceStatus();
  }

  void changeIndex(int index) {
    currentIndex.value = index;
    // Handle navigation based on selected index
    switch (index) {
      case 0: // Home
        Get.offAllNamed('/home');
        break;
      case 1: // Classroom
        Get.offAllNamed('/classroom');
        break;
      case 2: // Routine
        Get.offAllNamed('/routine');
        break;
      case 3: // Account
        Get.offAllNamed('/account');
        break;
    }
  }

  void onCarouselPageChanged(int page) {
    currentPage.value = page;
  }

  void onQuickActionTap(String action) {
    switch (action) {
      case 'attendance_record':
        Get.toNamed('/attendance-record');
        break;
      case 'routine':
        Get.snackbar('Routine', 'Opening class routine...');
        break;
      case 'fees':
        Get.toNamed('/fees');
        break;
      case 'results':
        Get.toNamed('/results');
        break;
      case 'classroom':
        Get.toNamed('/classroom');
        break;
      case 'mar_certificate':
        Get.toNamed('/mar-certificates');
        break;
    }
  }

  void checkIn() async {
    if (attendanceStatus.value.isDisabled) {
      Get.snackbar(
        'Attendance Disabled', 
        'Check-in is disabled for today. It will reset tomorrow at 9 AM.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (attendanceStatus.value.isCheckedIn) {
      Get.snackbar(
        'Already Checked In', 
        'You have already checked in today.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isCheckingIn.value = true;
    
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      
      final now = DateTime.now();
      attendanceStatus.value = attendanceStatus.value.copyWith(
        isCheckedIn: true,
        lastCheckInTime: now,
      );
      
      _saveAttendanceStatus();
      
      Get.snackbar(
        'Check-in Successful!', 
        'You have been checked in at ${_formatTime(now)}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF4CAF50),
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Error', 
        'Failed to check in. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFFD32F2F),
        colorText: Colors.white,
      );
    } finally {
      isCheckingIn.value = false;
    }
  }

  void checkOut() async {
    if (!attendanceStatus.value.isCheckedIn) {
      Get.snackbar(
        'Not Checked In', 
        'You need to check in first before checking out.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (attendanceStatus.value.isCheckedOut) {
      Get.snackbar(
        'Already Checked Out', 
        'You have already checked out today.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Show confirmation dialog
    final result = await Get.dialog<bool>(
      AlertDialog(
        title: const Text('Confirm Check-out'),
        content: const Text(
          'Did you attend all your classes today? Your attendance will not be recorded if you missed any classes.',
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: const Text('No, I missed some classes'),
          ),
          ElevatedButton(
            onPressed: () => Get.back(result: true),
            child: const Text('Yes, I attended all classes'),
          ),
        ],
      ),
    );

    if (result == null) return; // User cancelled

    isCheckingOut.value = true;
    
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      
      final now = DateTime.now();
      attendanceStatus.value = attendanceStatus.value.copyWith(
        isCheckedOut: true,
        lastCheckOutTime: now,
        isDisabled: true, // Disable check-in for the rest of the day
      );
      
      _saveAttendanceStatus();
      
      final message = result 
          ? 'Check-out successful! Your attendance has been recorded.'
          : 'Check-out successful! Note: Your attendance may not be recorded due to missed classes.';
      
      Get.snackbar(
        'Check-out Successful!', 
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF4CAF50),
        colorText: Colors.white,
        duration: const Duration(seconds: 4),
      );
    } catch (e) {
      Get.snackbar(
        'Error', 
        'Failed to check out. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFFD32F2F),
        colorText: Colors.white,
      );
    } finally {
      isCheckingOut.value = false;
    }
  }

  String _formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  // Getter for attendance button state
  bool get canCheckIn => !attendanceStatus.value.isDisabled && 
                        !attendanceStatus.value.isCheckedIn;

  bool get canCheckOut => attendanceStatus.value.isCheckedIn && 
                         !attendanceStatus.value.isCheckedOut;

  String get attendanceStatusText {
    if (attendanceStatus.value.isDisabled) {
      return 'Attendance disabled for today';
    } else if (attendanceStatus.value.isCheckedOut) {
      return 'Checked out at ${_formatTime(attendanceStatus.value.lastCheckOutTime!)}';
    } else if (attendanceStatus.value.isCheckedIn) {
      return 'Checked in at ${_formatTime(attendanceStatus.value.lastCheckInTime!)}';
    } else {
      return 'Not checked in today';
    }
  }
}
