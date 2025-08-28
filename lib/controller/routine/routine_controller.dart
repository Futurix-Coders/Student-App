import 'package:get/get.dart';
import '../../models/routine_models.dart';

class RoutineController extends GetxController {
  var routine = <RoutineEntry>[].obs;

  @override
  void onInit() {
    super.onInit();
    routine.value = [
      RoutineEntry(day: 'Monday', classes: [
        ClassSchedule(time: '09:00 - 09:50', subject: 'Mathematics'),
        ClassSchedule(time: '10:00 - 10:50', subject: 'English'),
        ClassSchedule(time: '11:00 - 11:50', subject: 'Computer Science'),
        ClassSchedule(time: '12:00 - 12:50', subject: 'Physics'),
        ClassSchedule(time: '01:00 - 01:50', subject: 'Chemistry'),
        ClassSchedule(time: '02:00 - 02:50', subject: 'Physical Education'),
      ]),
      RoutineEntry(day: 'Tuesday', classes: [
        ClassSchedule(time: '09:00 - 09:50', subject: 'English'),
        ClassSchedule(time: '10:00 - 10:50', subject: 'Mathematics'),
        ClassSchedule(time: '11:00 - 11:50', subject: 'Computer Science'),
        ClassSchedule(time: '12:00 - 12:50', subject: 'Chemistry'),
        ClassSchedule(time: '01:00 - 01:50', subject: 'Physics'),
        ClassSchedule(time: '02:00 - 02:50', subject: 'Physical Education'),
      ]),
      RoutineEntry(day: 'Wednesday', classes: [
        ClassSchedule(time: '09:00 - 09:50', subject: 'Computer Science'),
        ClassSchedule(time: '10:00 - 10:50', subject: 'Mathematics'),
        ClassSchedule(time: '11:00 - 11:50', subject: 'English'),
        ClassSchedule(time: '12:00 - 12:50', subject: 'Physics'),
        ClassSchedule(time: '01:00 - 01:50', subject: 'Chemistry'),
        ClassSchedule(time: '02:00 - 02:50', subject: 'Physical Education'),
      ]),
      RoutineEntry(day: 'Thursday', classes: [
        ClassSchedule(time: '09:00 - 09:50', subject: 'Physics'),
        ClassSchedule(time: '10:00 - 10:50', subject: 'Mathematics'),
        ClassSchedule(time: '11:00 - 11:50', subject: 'English'),
        ClassSchedule(time: '12:00 - 12:50', subject: 'Computer Science'),
        ClassSchedule(time: '01:00 - 01:50', subject: 'Chemistry'),
        ClassSchedule(time: '02:00 - 02:50', subject: 'Physical Education'),
      ]),
      RoutineEntry(day: 'Friday', classes: [
        ClassSchedule(time: '09:00 - 09:50', subject: 'Chemistry'),
        ClassSchedule(time: '10:00 - 10:50', subject: 'Mathematics'),
        ClassSchedule(time: '11:00 - 11:50', subject: 'English'),
        ClassSchedule(time: '12:00 - 12:50', subject: 'Computer Science'),
        ClassSchedule(time: '01:00 - 01:50', subject: 'Physics'),
        ClassSchedule(time: '02:00 - 02:50', subject: 'Physical Education'),
      ]),
    ];
  }
}
