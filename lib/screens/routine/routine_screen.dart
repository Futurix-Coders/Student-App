import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import '../../controller/routine/routine_controller.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_bar.dart';

class RoutineScreen extends StatefulWidget {
  const RoutineScreen({super.key});

  @override
  State<RoutineScreen> createState() => _RoutineScreenState();
}

class _RoutineScreenState extends State<RoutineScreen> {
  @override
  void initState() {
    super.initState();
    // Set landscape orientation for this screen only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    // Reset to allow all orientations when leaving
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final routineController = Get.put(RoutineController());
    return Scaffold(
      appBar: const CustomAppBar(title: 'Class Routine', showBackButton: true),
      backgroundColor: AppTheme.lightGrey,
      body: Obx(() => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor: WidgetStateProperty.all(AppTheme.primaryBlue.withValues(alpha: 0.08)),
          columns: [
            DataColumn(label: Text('Day', style: AppTheme.heading3)),
            for (int i = 0; i < 6; i++)
              DataColumn(label: Text('Class ${i + 1}', style: AppTheme.heading3)),
          ],
          rows: [
            for (final entry in routineController.routine)
              DataRow(
                cells: [
                  DataCell(Text(entry.day, style: AppTheme.bodyMedium.copyWith(fontWeight: FontWeight.bold))),
                  for (final classSchedule in entry.classes)
                    DataCell(Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(classSchedule.subject, style: AppTheme.bodyMedium),
                        const SizedBox(height: 4),
                        Text(classSchedule.time, style: AppTheme.bodySmall.copyWith(color: AppTheme.darkGrey)),
                      ],
                    )),
                ],
              ),
          ],
        ),
      )),
    );
  }
}
