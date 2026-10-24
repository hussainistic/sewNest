import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sewnest/custom_widgets/header_design.dart';
import 'package:sewnest/utilis/styles/customColors.dart';
import '../../../controllers/user_controllers/user_chat_controller.dart';

class UserChatScreen extends StatelessWidget {
  const UserChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserChatController chatController = Get.put(UserChatController());
    TextEditingController messageController = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          HeaderDesign(
            title: "Chat",
            icon: null,
            onIconPressed: null,
            backIconPressed: () => Get.off(()),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: chatController.messages.length,
                itemBuilder: (context, index) {
                  var message = chatController.messages[index];
                  bool isSenderUser = message['sender'] == 'User';
                  return _buildMessageItem(message, isSenderUser);
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    onChanged: (value) => chatController.messageController.value = value,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    chatController.sendUserMessage();
                    messageController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageItem(Map<String, String> message, bool isSenderUser) {
    return Container(
      alignment: isSenderUser ? Alignment.centerRight : Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        crossAxisAlignment: isSenderUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 250),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              color: isSenderUser ? CustomColors.primaryColor : Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              message['message']!,
              style: TextStyle(
                color: isSenderUser ? Colors.white : Colors.black87,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
