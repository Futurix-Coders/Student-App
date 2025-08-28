import 'package:get/get.dart';
import '../../models/fees_models.dart';

class FeesController extends GetxController {
  var fees = <SemesterFee>[].obs;

  @override
  void onInit() {
    super.onInit();
    fees.value = [
      SemesterFee(semester: 'Semester 1', amount: 25000, isPaid: true, description: 'Paid on 10 Jan 2025'),
      SemesterFee(semester: 'Semester 2', amount: 25000, isPaid: false, description: 'Due by 10 Aug 2025'),
      SemesterFee(semester: 'Semester 3', amount: 25000, isPaid: false, description: 'Due by 10 Jan 2026'),
      SemesterFee(semester: 'Semester 4', amount: 25000, isPaid: false, description: 'Upcoming'),
    ];
  }
}