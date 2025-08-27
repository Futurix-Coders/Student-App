import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/home/home_controller.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../widgets/carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());

    return Scaffold(
      backgroundColor: AppTheme.lightGrey,
      appBar: const CustomAppBar(
        title: 'Student Dashboard',
        showBackButton: false,
      ),
      body: Obx(() => homeController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryBlue),
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Welcome Section
                  _buildWelcomeSection(homeController),
                  const SizedBox(height: 24),
                  
                  // Advertisement Carousel
                  _buildCarouselSection(),
                  const SizedBox(height: 24),
                  
                  // Attendance Check-in/out Section
                  _buildAttendanceSection(homeController),
                  const SizedBox(height: 24),
                  
                  // Quick Actions Section
                  _buildQuickActionsSection(homeController),
                ],
              ),
            )),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget _buildWelcomeSection(HomeController controller) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.primaryBlue,
            AppTheme.lightBlue,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryBlue.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppTheme.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.school,
                  size: 30,
                  color: AppTheme.white,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back,',
                      style: AppTheme.bodyLarge.copyWith(
                        color: AppTheme.white.withOpacity(0.9),
                      ),
                    ),
                    Text(
                      controller.userName.value,
                      style: AppTheme.heading2.copyWith(
                        color: AppTheme.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildInfoChip(
                'Department',
                controller.userDepartment.value,
                Icons.business,
              ),
              const SizedBox(width: 12),
              _buildInfoChip(
                'Semester',
                controller.userSemester.value,
                Icons.grade,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.white.withOpacity(0.2),
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

  Widget _buildCarouselSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Announcements',
          style: AppTheme.heading3.copyWith(
            color: AppTheme.primaryBlue,
          ),
        ),
        const SizedBox(height: 16),
        const AdvertisementCarousel(),
      ],
    );
  }

  Widget _buildAttendanceSection(HomeController controller) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryBlue.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Attendance',
            style: AppTheme.heading3.copyWith(
              color: AppTheme.primaryBlue,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: controller.checkIn,
                  icon: const Icon(Icons.login, color: AppTheme.white),
                  label: const Text('Check In'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.successGreen,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: controller.checkOut,
                  icon: const Icon(Icons.logout, color: AppTheme.white),
                  label: const Text('Check Out'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.errorRed,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionsSection(HomeController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: AppTheme.heading3.copyWith(
            color: AppTheme.primaryBlue,
          ),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.2,
          ),
          itemCount: controller.quickActions.length,
          itemBuilder: (context, index) {
            final action = controller.quickActions[index];
            return _buildQuickActionCard(action, controller);
          },
        ),
      ],
    );
  }

  Widget _buildQuickActionCard(Map<String, dynamic> action, HomeController controller) {
    return GestureDetector(
      onTap: () => controller.onQuickActionTap(action['action']),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Color(action['color']).withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              action['icon'],
              style: const TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 12),
            Text(
              action['title'],
              style: AppTheme.bodyMedium.copyWith(
                fontWeight: FontWeight.w600,
                color: AppTheme.primaryBlue,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              action['subtitle'],
              style: AppTheme.bodySmall.copyWith(
                color: AppTheme.darkGrey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
