import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/classroom_models.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_bar.dart';

class ClassroomDetailScreen extends StatelessWidget {
  final Classroom classroom;
  const ClassroomDetailScreen({super.key, required this.classroom});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: classroom.name, showBackButton: true),
      backgroundColor: AppTheme.lightGrey,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                  image: DecorationImage(
                    image: AssetImage(classroom.profilePic),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.45),
                      BlendMode.darken,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primaryBlue.withOpacity(0.15),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Container(),
              ),
              Positioned(
                left: 24,
                right: 24,
                bottom: 24,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      classroom.name,
                      style: AppTheme.heading1.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      classroom.description,
                      style: AppTheme.bodyLarge.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 6,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 36),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildQuickActionBox(
                    icon: Icons.assignment_outlined,
                    label: 'View Pending Assignments',
                    color: AppTheme.primaryBlue,
                    onTap: () {
                      Get.toNamed('/pending-assignments');
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildQuickActionBox(
                    icon: Icons.upload_file,
                    label: 'Upload Pending Assignments',
                    color: AppTheme.lightBlue,
                    onTap: () {
                      // TODO: Navigate to upload assignments screen
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildQuickActionBox(
                    icon: Icons.chat_bubble_outline,
                    label: 'Enter Chat for Doubt Clearance',
                    color: AppTheme.primaryBlue,
                    onTap: () {
                      // TODO: Navigate to chat screen
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionBox({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 18),
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.12),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: color.withOpacity(0.18),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(12),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Text(
                label,
                style: AppTheme.heading3.copyWith(
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
