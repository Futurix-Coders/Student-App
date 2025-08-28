class Classroom {
  final String name;
  final String description;
  final String profilePic;
  bool isJoined;

  Classroom({
    required this.name,
    required this.description,
    required this.profilePic,
    this.isJoined = false,
  });
}