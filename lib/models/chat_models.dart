class ChatMessage {
  final String sender;
  final String message;
  final DateTime timestamp;
  final bool isTeacher;
  final String profilePic;

  ChatMessage({
    required this.sender,
    required this.message,
    required this.timestamp,
    this.isTeacher = false,
    this.profilePic = '',
  });
}