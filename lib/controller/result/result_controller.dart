import 'package:get/get.dart';
import '../../models/result_models.dart';

class ResultController extends GetxController {
  var results = <SemesterResult>[].obs;

  @override
  void onInit() {
    super.onInit();
    results.value = [
      SemesterResult(
        semester: 'Semester 1',
        subjects: [
          SubjectResult(subject: 'Mathematics', ca1: 18, ca2: 20, ca3: 19, ca4: 20, pca1: 19, pca2: 20, theory: 75),
          SubjectResult(subject: 'English', ca1: 17, ca2: 18, ca3: 19, ca4: 20, pca1: 18, pca2: 19, theory: 72),
          SubjectResult(subject: 'Computer Science', ca1: 20, ca2: 20, ca3: 20, ca4: 20, pca1: 20, pca2: 20, theory: 80),
          SubjectResult(subject: 'Physics', ca1: 16, ca2: 17, ca3: 18, ca4: 19, pca1: 17, pca2: 18, theory: 70),
          SubjectResult(subject: 'Chemistry', ca1: 18, ca2: 19, ca3: 18, ca4: 19, pca1: 19, pca2: 18, theory: 74),
          SubjectResult(subject: 'Physical Education', ca1: 20, ca2: 20, ca3: 20, ca4: 20, pca1: 20, pca2: 20, theory: 80),
          SubjectResult(subject: 'Economics', ca1: 15, ca2: 16, ca3: 17, ca4: 18, pca1: 16, pca2: 17, theory: 68),
          SubjectResult(subject: 'History', ca1: 14, ca2: 15, ca3: 16, ca4: 17, pca1: 15, pca2: 16, theory: 65),
        ],
      ),
      SemesterResult(
        semester: 'Semester 2',
        subjects: [
          SubjectResult(subject: 'Mathematics', ca1: 19, ca2: 20, ca3: 20, ca4: 20, pca1: 20, pca2: 20, theory: 78),
          SubjectResult(subject: 'English', ca1: 18, ca2: 19, ca3: 20, ca4: 20, pca1: 19, pca2: 20, theory: 75),
          SubjectResult(subject: 'Computer Science', ca1: 20, ca2: 20, ca3: 20, ca4: 20, pca1: 20, pca2: 20, theory: 82),
          SubjectResult(subject: 'Physics', ca1: 17, ca2: 18, ca3: 19, ca4: 20, pca1: 18, pca2: 19, theory: 72),
          SubjectResult(subject: 'Chemistry', ca1: 19, ca2: 20, ca3: 19, ca4: 20, pca1: 20, pca2: 19, theory: 76),
          SubjectResult(subject: 'Physical Education', ca1: 20, ca2: 20, ca3: 20, ca4: 20, pca1: 20, pca2: 20, theory: 80),
          SubjectResult(subject: 'Economics', ca1: 16, ca2: 17, ca3: 18, ca4: 19, pca1: 17, pca2: 18, theory: 70),
          SubjectResult(subject: 'History', ca1: 15, ca2: 16, ca3: 17, ca4: 18, pca1: 16, pca2: 17, theory: 67),
        ],
      ),
    ];
  }
}
