import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../controller/attendance/attendance_controller.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_bar.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    final attendanceController = Get.put(AttendanceController());
    return Scaffold(
      appBar: const CustomAppBar(title: 'Attendance Record', showBackButton: true),
      backgroundColor: AppTheme.lightGrey,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryBlue.withValues(alpha: 0.08 * 255),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: TableCalendar(
              firstDay: DateTime.utc(DateTime.now().year - 1, 1, 1),
              lastDay: DateTime.utc(DateTime.now().year + 1, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              calendarFormat: CalendarFormat.month,
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: AppTheme.primaryBlue.withValues(alpha: 0.15 * 255),
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: AppTheme.primaryBlue,
                  shape: BoxShape.circle,
                ),
                weekendTextStyle: AppTheme.bodySmall.copyWith(color: AppTheme.mediumGrey),
                defaultTextStyle: AppTheme.bodySmall,
                selectedTextStyle: AppTheme.bodySmall.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                todayTextStyle: AppTheme.bodySmall.copyWith(color: AppTheme.primaryBlue, fontWeight: FontWeight.bold),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleTextStyle: AppTheme.heading3.copyWith(color: AppTheme.primaryBlue),
                leftChevronIcon: Icon(Icons.chevron_left, color: AppTheme.primaryBlue),
                rightChevronIcon: Icon(Icons.chevron_right, color: AppTheme.primaryBlue),
                headerPadding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: AppTheme.lightBlue.withValues(alpha: 0.12 * 255),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) {
                  final record = attendanceController.getRecordForDate(day);
                  if (record != null) {
                    return Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: record.attendedAllClasses ? AppTheme.primaryBlue : Colors.redAccent,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${day.day}',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    );
                  }
                  return null;
                },
              ),
            ),
          ),
          const SizedBox(height: 24),
          Obx(() {
            final record = _selectedDay != null ? attendanceController.getRecordForDate(_selectedDay!) : null;
            if (record == null) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primaryBlue.withValues(alpha: 0.08 * 255),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text('No attendance record for selected date.', style: AppTheme.bodyMedium, textAlign: TextAlign.center),
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primaryBlue.withValues(alpha: 0.08 * 255),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          record.attendedAllClasses ? Icons.check_circle : Icons.cancel,
                          color: record.attendedAllClasses ? AppTheme.primaryBlue : Colors.redAccent,
                          size: 28,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Date: ${record.date.day}/${record.date.month}/${record.date.year}',
                          style: AppTheme.heading3.copyWith(color: AppTheme.primaryBlue),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(Icons.login, color: AppTheme.primaryBlue, size: 20),
                        const SizedBox(width: 6),
                        Text('Check-in: ', style: AppTheme.bodyMedium),
                        Text(
                          record.checkInTime != null ? '${record.checkInTime!.hour.toString().padLeft(2, '0')}:${record.checkInTime!.minute.toString().padLeft(2, '0')}' : 'N/A',
                          style: AppTheme.bodyMedium.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.logout, color: AppTheme.primaryBlue, size: 20),
                        const SizedBox(width: 6),
                        Text('Check-out: ', style: AppTheme.bodyMedium),
                        Text(
                          record.checkOutTime != null ? '${record.checkOutTime!.hour.toString().padLeft(2, '0')}:${record.checkOutTime!.minute.toString().padLeft(2, '0')}' : 'N/A',
                          style: AppTheme.bodyMedium.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Attended All Classes: ${record.attendedAllClasses ? 'Yes' : 'No'}',
                      style: AppTheme.bodyMedium.copyWith(
                        color: record.attendedAllClasses ? AppTheme.primaryBlue : Colors.redAccent,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (record.notes != null) ...[
                      const SizedBox(height: 12),
                      Text('Notes:', style: AppTheme.bodySmall.copyWith(fontWeight: FontWeight.bold)),
                      Text('${record.notes}', style: AppTheme.bodySmall),
                    ],
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
