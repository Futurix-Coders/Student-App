import 'package:get/get.dart';

class HomeController extends GetxController {
  final currentIndex = 0.obs;
  final isLoading = false.obs;
  final currentPage = 0.obs;
  final userName = 'Student'.obs;
  final userDepartment = 'BCA'.obs;
  final userSemester = '3rd'.obs;

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
  ].obs;

  // Quick actions data
  final List<Map<String, dynamic>> quickActions = [
    {
      'title': 'Attendance',
      'subtitle': 'Check in/out',
      'icon': '📊',
      'color': 0xFF4CAF50,
      'action': 'attendance',
    },
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
      'title': 'Routine',
      'subtitle': 'View schedule',
      'icon': '📅',
      'color': 0xFFFF9800,
      'action': 'routine',
    },
    {
      'title': 'Clear Doubts',
      'subtitle': 'Ask questions',
      'icon': '❓',
      'color': 0xFFE91E63,
      'action': 'doubts',
    },
    {
      'title': 'Pay Fees',
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
  ].obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  void loadUserData() {
    // TODO: Load user data from storage/API
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 1), () {
      isLoading.value = false;
    });
  }

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  void onCarouselPageChanged(int page) {
    currentPage.value = page;
  }

  void onQuickActionTap(String action) {
    switch (action) {
      case 'attendance':
        Get.snackbar('Attendance', 'Opening attendance check-in/out...');
        break;
      case 'assignments':
        Get.snackbar('Assignments', 'Opening pending assignments...');
        break;
      case 'attendance_record':
        Get.snackbar('Record', 'Opening attendance record...');
        break;
      case 'routine':
        Get.snackbar('Routine', 'Opening class routine...');
        break;
      case 'doubts':
        Get.snackbar('Doubts', 'Opening doubt clearing section...');
        break;
      case 'fees':
        Get.snackbar('Fees', 'Opening fee payment section...');
        break;
      case 'results':
        Get.snackbar('Results', 'Opening results section...');
        break;
    }
  }

  void checkIn() {
    Get.snackbar('Success', 'Check-in successful!');
  }

  void checkOut() {
    Get.snackbar('Success', 'Check-out successful!');
  }
}
