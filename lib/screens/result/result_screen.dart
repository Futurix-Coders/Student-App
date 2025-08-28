import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/result/result_controller.dart';
import '../../models/result_models.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_bar.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final resultController = Get.put(ResultController());
    return Scaffold(
      appBar: const CustomAppBar(title: 'Results', showBackButton: true),
      backgroundColor: AppTheme.lightGrey,
      body: Obx(() => ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: resultController.results.length,
        itemBuilder: (context, semIndex) {
          final semester = resultController.results[semIndex];
          return Card(
            margin: const EdgeInsets.only(bottom: 24),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    semester.semester,
                    style: AppTheme.heading2.copyWith(color: AppTheme.primaryBlue),
                  ),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingRowColor: WidgetStateProperty.all(AppTheme.primaryBlue.withOpacity(0.08)),
                      columns: const [
                        DataColumn(label: Text('Subject')),
                        DataColumn(label: Text('CA1')),
                        DataColumn(label: Text('CA2')),
                        DataColumn(label: Text('CA3')),
                        DataColumn(label: Text('CA4')),
                        DataColumn(label: Text('PCA1')),
                        DataColumn(label: Text('PCA2')),
                        DataColumn(label: Text('Theory')),
                      ],
                      rows: [
                        for (final subject in semester.subjects)
                          DataRow(
                            cells: [
                              DataCell(Text(subject.subject)),
                              DataCell(Text(subject.ca1.toString())),
                              DataCell(Text(subject.ca2.toString())),
                              DataCell(Text(subject.ca3.toString())),
                              DataCell(Text(subject.ca4.toString())),
                              DataCell(Text(subject.pca1.toString())),
                              DataCell(Text(subject.pca2.toString())),
                              DataCell(Text(subject.theory.toString())),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
