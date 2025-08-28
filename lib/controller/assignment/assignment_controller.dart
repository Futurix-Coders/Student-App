import 'package:get/get.dart';
import '../../models/assignment_models.dart';

class AssignmentController extends GetxController {
  var assignments = <Assignment>[].obs;

  @override
  void onInit() {
    super.onInit();
    assignments.value = [
      Assignment(
        subjectName: 'Mathematics',
        lastDate: DateTime.now().add(const Duration(days: 2)),
        topic: 'Probability',
        description: 'Complete the problems from chapter 5.',
        todo: 'Solve all exercises and upload your solutions.',
      ),
      Assignment(
        subjectName: 'Computer Science',
        lastDate: DateTime.now().add(const Duration(days: 4)),
        topic: 'OOP Concepts',
        description: 'Write a report on OOP principles.',
        todo: 'Submit a PDF report.',
      ),
    ];
  }

  void submitAssignment(Assignment assignment) {
    assignment.isSubmitted = true;
    assignments.refresh();
  }
}