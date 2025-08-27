import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  // Observable variables
  final isLoading = false.obs;
  final isLoggedIn = false.obs;
  final currentUser = Rxn<Map<String, dynamic>>();

  // Form controllers
  final loginFormKey = GlobalKey<FormState>();
  final signupFormKey = GlobalKey<FormState>();

  // Login form fields
  final loginPhoneController = TextEditingController();
  final loginPasswordController = TextEditingController();

  // Signup form fields
  final signupFullNameController = TextEditingController();
  final signupEmailController = TextEditingController();
  final signupPhoneController = TextEditingController();
  final signupSemesterController = TextEditingController();
  final signupDepartmentController = TextEditingController();
  final signupClassRollController = TextEditingController();
  final signupMakautRollController = TextEditingController();
  final signupPasswordController = TextEditingController();

  // Selected values for dropdowns
  final selectedSemester = '1'.obs;
  final selectedDepartment = 'BCA'.obs;

  // Available options
  final List<String> semesters = ['1', '2', '3', '4', '5', '6', '7', '8'];
  final List<String> departments = [
    'BCA',
    'MCA',
    'BTech CSE',
    'BTech CS DS',
    'BBA/MBA',
    'Media Science'
  ];

  @override
  void onInit() {
    super.onInit();
    // Initialize any required setup
  }

  @override
  void onClose() {
    // Dispose controllers
    loginPhoneController.dispose();
    loginPasswordController.dispose();
    signupFullNameController.dispose();
    signupEmailController.dispose();
    signupPhoneController.dispose();
    signupSemesterController.dispose();
    signupDepartmentController.dispose();
    signupClassRollController.dispose();
    signupMakautRollController.dispose();
    signupPasswordController.dispose();
    super.onClose();
  }

  // Login method
  Future<void> login() async {
    if (!loginFormKey.currentState!.validate()) return;

    try {
      isLoading.value = true;
      
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      
      // Validate credentials (in real app, this would be API call)
      if (loginPhoneController.text == '1234567890' && 
          loginPasswordController.text == 'password') {
        isLoggedIn.value = true;
        currentUser.value = {
          'phone': loginPhoneController.text,
          'name': 'Demo User'
        };
        
        // Navigate to location permission
        Get.offAllNamed('/location-permission');
      } else {
        Get.snackbar(
          'Error',
          'Invalid phone number or password',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Something went wrong. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Signup method
  Future<void> signup() async {
    if (!signupFormKey.currentState!.validate()) return;

    try {
      isLoading.value = true;
      
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      
      // In real app, this would send data to API
      Get.snackbar(
        'Success',
        'Account created successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      
      // Navigate to login
      Get.offAllNamed('/login');
    } catch (e) {
      Get.snackbar(
        'Error',
        'Something went wrong. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Logout method
  void logout() {
    isLoggedIn.value = false;
    currentUser.value = null;
    Get.offAllNamed('/login');
  }

  // Navigate to signup
  void goToSignup() {
    Get.toNamed('/signup');
  }

  // Navigate to login
  void goToLogin() {
    Get.toNamed('/login');
  }

  // Navigate to location permission
  void goToLocationPermission() {
    Get.toNamed('/location-permission');
  }

  // Navigate to notification permission
  void goToNotificationPermission() {
    Get.toNamed('/notification-permission');
  }

  // Navigate back to login after permissions
  void goBackToLogin() {
    Get.offAllNamed('/login');
  }
}
