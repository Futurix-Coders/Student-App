class SubjectResult {
  final String subject;
  final int ca1;
  final int ca2;
  final int ca3;
  final int ca4;
  final int pca1;
  final int pca2;
  final int theory;

  SubjectResult({
    required this.subject,
    required this.ca1,
    required this.ca2,
    required this.ca3,
    required this.ca4,
    required this.pca1,
    required this.pca2,
    required this.theory,
  });
}

class SemesterResult {
  final String semester;
  final List<SubjectResult> subjects;

  SemesterResult({
    required this.semester,
    required this.subjects,
  });
}