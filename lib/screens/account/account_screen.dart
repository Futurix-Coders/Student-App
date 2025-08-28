import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import '../../controller/account/account_controller.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/bottom_nav_bar.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final accountController = Get.put(AccountController());

    return Scaffold(
      backgroundColor: AppTheme.lightGrey,
      appBar: const CustomAppBar(
        title: 'My Account',
        showBackButton: false,
      ),
      body: Obx(() => accountController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryBlue),
              ),
            )
          : accountController.userProfile.value == null
              ? const Center(
                  child: Text('Failed to load profile'),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      _buildProfileHeader(accountController),
                      const SizedBox(height: 24),
                      _buildProfileInfo(accountController),
                      const SizedBox(height: 24),
                      _buildActionButtons(accountController),
                    ],
                  ),
                )),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget _buildProfileHeader(AccountController controller) {
    final profile = controller.userProfile.value!;
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.primaryBlue,
            AppTheme.lightBlue,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryBlue.withAlpha(30),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          // Profile Picture
          GestureDetector(
            onTap: controller.isUpdatingProfilePicture.value 
                ? null 
                : controller.changeProfilePicture,
            child: Stack(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.white.withValues(alpha: 0.2 * 255),
                    border: Border.all(
                      color: AppTheme.white,
                      width: 4,
                    ),
                  ),
                  child: Obx(() => controller.isUpdatingProfilePicture.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(AppTheme.white),
                            strokeWidth: 3,
                          ),
                        )
                      : profile.profilePictureUrl != null
                          ? ClipOval(
                              child: profile.profilePictureUrl!.startsWith('http')
                                  ? Image.network(
                                      profile.profilePictureUrl!,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) =>
                                          _buildDefaultProfileIcon(),
                                    )
                                  : Image.file(
                                      File(profile.profilePictureUrl!),
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) =>
                                          _buildDefaultProfileIcon(),
                                    ),
                            )
                          : _buildDefaultProfileIcon()),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppTheme.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(40),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Obx(() => controller.isUpdatingProfilePicture.value
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryBlue),
                            ),
                          )
                        : Icon(
                            Icons.camera_alt,
                            size: 20,
                            color: AppTheme.primaryBlue,
                          )),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          
          // Name
          Text(
            profile.name,
            style: AppTheme.heading2.copyWith(
              color: AppTheme.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          
          // Email
          Text(
            profile.email,
            style: AppTheme.bodyMedium.copyWith(
              color: AppTheme.white.withValues(alpha: 0.9 * 255),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          
          // Department and Semester
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 12,
            runSpacing: 8,
            children: [
              _buildInfoChip(
                'Department',
                profile.department,
                Icons.business,
              ),
              _buildInfoChip(
                'Semester',
                profile.semester,
                Icons.grade,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDefaultProfileIcon() {
    return Icon(
      Icons.person,
      size: 60,
      color: AppTheme.white.withValues(alpha: 0.8 * 255),
    );
  }

  Widget _buildInfoChip(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.white.withValues(alpha: 0.2 * 255),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: AppTheme.white,
          ),
          const SizedBox(width: 6),
          Text(
            '$label: $value',
            style: AppTheme.bodySmall.copyWith(
              color: AppTheme.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInfo(AccountController controller) {
    final profile = controller.userProfile.value!;
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryBlue.withValues(alpha: 0.1 * 255),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Profile Information',
            style: AppTheme.heading3.copyWith(
              color: AppTheme.primaryBlue,
            ),
          ),
          const SizedBox(height: 20),
          
          _buildInfoRow('Phone Number', profile.phoneNumber, Icons.phone),
          _buildInfoRow('Date of Birth', '${profile.formattedDateOfBirth} (${profile.age} years)', Icons.cake),
          _buildInfoRow('Class Roll', profile.classRoll, Icons.badge),
          _buildInfoRow('MAKAUT Roll', profile.makautRoll, Icons.school),
          _buildInfoRow('Member Since', '${profile.createdAt.day}/${profile.createdAt.month}/${profile.createdAt.year}', Icons.calendar_today),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTheme.primaryBlue.withValues(alpha: 0.1 * 255),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              size: 20,
              color: AppTheme.primaryBlue,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTheme.bodySmall.copyWith(
                    color: AppTheme.darkGrey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: AppTheme.bodyMedium.copyWith(
                    color: AppTheme.primaryBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(AccountController controller) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryBlue.withValues(alpha: 0.1 * 255),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Actions',
            style: AppTheme.heading3.copyWith(
              color: AppTheme.primaryBlue,
            ),
          ),
          const SizedBox(height: 20),
          
          _buildActionButton(
            'Edit Profile',
            Icons.edit,
            AppTheme.primaryBlue,
            controller.editProfile,
          ),
          const SizedBox(height: 12),
          _buildActionButton(
            'Logout',
            Icons.logout,
            AppTheme.errorRed,
            controller.logout,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: color.withValues(alpha: 0.2 * 255),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
              size: 24,
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: AppTheme.bodyMedium.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: color.withValues(alpha: 0.6 * 255),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
