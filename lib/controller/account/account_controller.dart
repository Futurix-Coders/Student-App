import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../models/account_models.dart';

class AccountController extends GetxController {
  final isLoading = false.obs;
  final isUpdatingProfilePicture = false.obs;
  final userProfile = Rxn<UserProfile>();
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    loadUserProfile();
  }

  void loadUserProfile() {
    isLoading.value = true;
    
    // Simulate API call to load user profile
    Future.delayed(const Duration(seconds: 1), () {
      // Mock data - replace with actual API call
      userProfile.value = UserProfile(
        id: '1',
        name: 'John Doe',
        email: 'john.doe@example.com',
        phoneNumber: '+91 98765 43210',
        semester: '3rd Semester',
        department: 'BCA',
        dateOfBirth: DateTime(2000, 5, 15),
        classRoll: 'BCA/2023/001',
        makautRoll: 'MAKAUT/2023/BCA/001',
        profilePictureUrl: null,
        createdAt: DateTime(2023, 8, 1),
        updatedAt: DateTime.now(),
      );
      isLoading.value = false;
    });
  }

  void editProfile() {
    // TODO: Navigate to edit profile screen
    Get.snackbar(
      'Edit Profile',
      'Edit profile functionality will be implemented soon.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void logout() {
    Get.dialog(
      AlertDialog(
        title: const Text('Confirm Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();
              // TODO: Clear user data and navigate to login screen
              Get.snackbar(
                'Logged Out',
                'You have been successfully logged out.',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: const Color(0xFF4CAF50),
                colorText: Colors.white,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD32F2F),
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  void changeProfilePicture() async {
    final result = await Get.dialog<String>(
      AlertDialog(
        title: const Text('Select Image Source'),
        content: const Text('Choose where to get your profile picture from'),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: 'camera'),
            child: const Text('Camera'),
          ),
          TextButton(
            onPressed: () => Get.back(result: 'gallery'),
            child: const Text('Gallery'),
          ),
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );

    if (result == null) return;

    isUpdatingProfilePicture.value = true;

    try {
      final ImageSource source = result == 'camera' 
          ? ImageSource.camera 
          : ImageSource.gallery;
          
      // Pick image directly - image_picker will handle permissions automatically
      XFile? image;
      try {
        image = await _picker.pickImage(
          source: source,
          maxWidth: 512,
          maxHeight: 512,
          imageQuality: 85,
        );
      } catch (pickerError) {
        Get.snackbar(
          'Error',
          'Failed to access image picker. Please check permissions and try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color(0xFFD32F2F),
          colorText: Colors.white,
        );
        return;
      }

      if (image != null) {
        // Update the profile with the new image path
        final updatedProfile = userProfile.value?.copyWith(
          profilePictureUrl: image.path,
          updatedAt: DateTime.now(),
        );
        
        if (updatedProfile != null) {
          userProfile.value = updatedProfile;
          Get.snackbar(
            'Success',
            'Profile picture updated successfully!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: const Color(0xFF4CAF50),
            colorText: Colors.white,
          );
        }
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to update profile picture: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFFD32F2F),
        colorText: Colors.white,
      );
    } finally {
      isUpdatingProfilePicture.value = false;
    }
  }

  void changeIndex(int index) {
    switch (index) {
      case 0:
        Get.offAllNamed('/home');
        break;
      case 1:
        Get.offAllNamed('/classroom');
        break;
      case 2:
        Get.offAllNamed('/routine');
        break;
      case 3:
        Get.offAllNamed('/account');
        break;
    }
  }
}
