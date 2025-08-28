import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/classroom/classroom_controller.dart';
import '../../models/classroom_models.dart';
import '../../widgets/app_bar.dart';
import '../../theme/app_theme.dart';

class ClassroomScreen extends StatelessWidget {
  const ClassroomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final classroomController = Get.put(ClassroomController());
    return Scaffold(
      appBar: const CustomAppBar(title: 'Classroom', showBackButton: false),
      backgroundColor: AppTheme.lightGrey,
      body: Obx(() => ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: classroomController.classrooms.length,
        itemBuilder: (context, index) {
          final classroom = classroomController.classrooms[index];
          return _buildClassroomCard(classroom, classroomController);
        },
      )),
    );
  }

  Widget _buildClassroomCard(Classroom classroom, ClassroomController controller) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundImage: AssetImage(classroom.profilePic),
              backgroundColor: AppTheme.lightBlue,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    classroom.name,
                    style: AppTheme.heading3.copyWith(color: AppTheme.primaryBlue),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    classroom.description,
                    style: AppTheme.bodyMedium.copyWith(color: AppTheme.darkGrey),
                  ),
                  const SizedBox(height: 12),
                  classroom.isJoined
                      ? ElevatedButton(
                          onPressed: () {
                            // Enter classroom logic (demo)
                            Get.snackbar('Classroom', 'Entering ${classroom.name}');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primaryBlue,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          child: const Text('Enter Classroom'),
                        )
                      : ElevatedButton(
                          onPressed: () => controller.joinClassroom(classroom),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primaryBlue,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          child: const Text('Join Classroom'),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}