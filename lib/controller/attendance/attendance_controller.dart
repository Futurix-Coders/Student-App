import 'package:get/get.dart';
import '../../models/attendance_models.dart';

class AttendanceController extends GetxController {
  var records = <AttendanceRecord>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Demo records for calendar
    records.value = [
      AttendanceRecord(
        id: '1',
        studentId: 'student1',
        date: DateTime.now().subtract(const Duration(days: 1)),
        checkInTime: DateTime.now().subtract(const Duration(days: 1, hours: 8)),
        checkOutTime: DateTime.now().subtract(const Duration(days: 1, hours: 2)),
        attendedAllClasses: true,
        notes: 'Attended all classes',
      ),
      AttendanceRecord(
        id: '2',
        studentId: 'student1',
        date: DateTime.now().subtract(const Duration(days: 2)),
        checkInTime: DateTime.now().subtract(const Duration(days: 2, hours: 8)),
        checkOutTime: DateTime.now().subtract(const Duration(days: 2, hours: 2)),
        attendedAllClasses: false,
        notes: 'Missed Chemistry class',
      ),
      // Add more demo records as needed
    ];
  }

  AttendanceRecord? getRecordForDate(DateTime date) {
    return records.firstWhereOrNull((r) => r.date.year == date.year && r.date.month == date.month && r.date.day == date.day);
  }
}
