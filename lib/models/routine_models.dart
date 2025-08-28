class RoutineEntry {
  final String day;
  final List<ClassSchedule> classes;

  RoutineEntry({
    required this.day,
    required this.classes,
  });
}

class ClassSchedule {
  final String time;
  final String subject;

  ClassSchedule({
    required this.time,
    required this.subject,
  });
}