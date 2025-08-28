import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/fee/fees_controller.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_bar.dart';

class FeesScreen extends StatelessWidget {
  const FeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final feesController = Get.put(FeesController());
    return Scaffold(
      appBar: const CustomAppBar(title: 'Semester Fees', showBackButton: true),
      backgroundColor: AppTheme.lightGrey,
      body: Obx(() => ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: feesController.fees.length,
        itemBuilder: (context, index) {
          final fee = feesController.fees[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  Icon(
                    fee.isPaid ? Icons.check_circle : Icons.cancel,
                    color: fee.isPaid ? AppTheme.primaryBlue : Colors.redAccent,
                    size: 32,
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(fee.semester, style: AppTheme.heading3.copyWith(color: AppTheme.primaryBlue)),
                        const SizedBox(height: 8),
                        Text('Amount: ₹${fee.amount.toStringAsFixed(2)}', style: AppTheme.bodyMedium),
                        const SizedBox(height: 6),
                        Text(fee.description, style: AppTheme.bodySmall.copyWith(color: AppTheme.darkGrey)),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: fee.isPaid ? AppTheme.primaryBlue.withValues(alpha: 0.12) : Colors.redAccent.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      fee.isPaid ? 'Paid' : 'Unpaid',
                      style: AppTheme.bodySmall.copyWith(
                        color: fee.isPaid ? AppTheme.primaryBlue : Colors.redAccent,
                        fontWeight: FontWeight.w600,
                      ),
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
