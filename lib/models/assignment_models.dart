class Assignment {
  final String subjectName;
  final DateTime lastDate;
  final String topic;
  final String description;
  final String todo;
  bool isSubmitted;

  Assignment({
    required this.subjectName,
    required this.lastDate,
    required this.topic,
    required this.description,
    required this.todo,
    this.isSubmitted = false,
  });
}