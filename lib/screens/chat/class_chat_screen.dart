import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/chat/chat_controller.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_bar.dart';

class ClassChatScreen extends StatefulWidget {
  const ClassChatScreen({super.key});

  @override
  State<ClassChatScreen> createState() => _ClassChatScreenState();
}

class _ClassChatScreenState extends State<ClassChatScreen> {
  final ChatController chatController = Get.put(ChatController());
  final TextEditingController _textController = TextEditingController();

  void _sendMessage() {
    final text = _textController.text.trim();
    if (text.isNotEmpty) {
      chatController.sendMessage('You', text, profilePic: 'assets/images/student.png');
      _textController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Classroom Chat', showBackButton: true),
      backgroundColor: AppTheme.lightGrey,
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: chatController.messages.length,
              itemBuilder: (context, index) {
                final msg = chatController.messages[index];
                return Align(
                  alignment: msg.isTeacher ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: msg.isTeacher ? AppTheme.primaryBlue.withValues(alpha: 0.15 * 255) : AppTheme.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: msg.profilePic.isNotEmpty ? AssetImage(msg.profilePic) : null,
                          backgroundColor: AppTheme.lightBlue,
                          child: msg.profilePic.isEmpty ? Icon(Icons.person, color: AppTheme.primaryBlue) : null,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                msg.sender + (msg.isTeacher ? ' (Teacher)' : ''),
                                style: AppTheme.bodySmall.copyWith(
                                  color: msg.isTeacher ? AppTheme.primaryBlue : AppTheme.darkGrey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(msg.message, style: AppTheme.bodyMedium),
                              const SizedBox(height: 2),
                              Text(
                                '${msg.timestamp.hour.toString().padLeft(2, '0')}:${msg.timestamp.minute.toString().padLeft(2, '0')}',
                                style: AppTheme.bodySmall.copyWith(color: Colors.grey),
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
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: AppTheme.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Type your question or doubt...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppTheme.primaryBlue.withValues(alpha: 0.2 * 255)),
                      ),
                      filled: true,
                      fillColor: AppTheme.white,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.send, color: AppTheme.primaryBlue),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
