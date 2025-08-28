import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/assignment/assignment_controller.dart';
import '../../models/assignment_models.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_bar.dart';

class PendingAssignmentScreen extends StatelessWidget {
  const PendingAssignmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final assignmentController = Get.put(AssignmentController());
    return Scaffold(
      appBar: const CustomAppBar(title: 'Pending Assignments', showBackButton: true),
      backgroundColor: AppTheme.lightGrey,
      body: Obx(() => ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: assignmentController.assignments.length,
        itemBuilder: (context, index) {
          final assignment = assignmentController.assignments[index];
          return _buildAssignmentCard(assignment, assignmentController);
        },
      )),
    );
  }

  Widget _buildAssignmentCard(Assignment assignment, AssignmentController controller) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.book, color: AppTheme.primaryBlue, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    assignment.subjectName,
                    style: AppTheme.heading3.copyWith(color: AppTheme.primaryBlue),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.lightBlue.withValues(alpha: 38),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Due: ${assignment.lastDate.day}/${assignment.lastDate.month}/${assignment.lastDate.year}',
                    style: AppTheme.bodySmall.copyWith(color: AppTheme.primaryBlue),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text('Topic: ${assignment.topic}', style: AppTheme.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Text(assignment.description, style: AppTheme.bodyMedium),
            const SizedBox(height: 8),
            Text('To Do: ${assignment.todo}', style: AppTheme.bodySmall.copyWith(color: AppTheme.darkGrey)),
            const SizedBox(height: 16),
            assignment.isSubmitted
                ? Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppTheme.lightBlue.withValues(alpha: 51),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text('Submitted', style: AppTheme.bodyMedium.copyWith(color: AppTheme.primaryBlue)),
                  )
                : SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/submit-assignment', arguments: assignment);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryBlue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text('Submit Now'),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
