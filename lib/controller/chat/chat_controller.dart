import 'package:get/get.dart';
import '../../models/chat_models.dart';

class ChatController extends GetxController {
  var messages = <ChatMessage>[].obs;

  void sendMessage(String sender, String message, {bool isTeacher = false, String? profilePic}) {
    messages.add(ChatMessage(
      sender: sender,
      message: message,
      timestamp: DateTime.now(),
      isTeacher: isTeacher,
      profilePic: profilePic ?? '',
    ));
    messages.refresh();
    // Demo teacher reply after user message
    if (!isTeacher) {
      Future.delayed(const Duration(seconds: 2), () {
        messages.add(ChatMessage(
          sender: 'Teacher',
          message: 'Thank you for your question. I will clarify it soon.',
          timestamp: DateTime.now(),
          isTeacher: true,
          profilePic: 'assets/images/splash.png',
        ));
        messages.refresh();
      });
    }
  }
}
