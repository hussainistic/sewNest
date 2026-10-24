import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sewnest/custom_widgets/header_design.dart';
import 'package:sewnest/utilis/styles/customColors.dart';
import '../../../controllers/tailer_controllers/chat_controller.dart';

class TailorChatScreen extends StatelessWidget {
  const TailorChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TailorChatController chatController = Get.put(TailorChatController());
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
                  bool isSenderTailor = message['sender'] == 'Tailor';
                  return _buildMessageItem(message, isSenderTailor);
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
                    chatController.sendTailorMessage();
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

  Widget _buildMessageItem(Map<String, String> message, bool isSenderTailor) {
    return Container(
      alignment: isSenderTailor ? Alignment.centerRight : Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        crossAxisAlignment: isSenderTailor ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 250),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              color: isSenderTailor ? CustomColors.primaryColor : Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: isSenderTailor ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(
                  message['message']!,
                  style: TextStyle(
                    color: isSenderTailor ? Colors.white : Colors.black87,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 3),
                if (isSenderTailor)
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.done_all, size: 14, color: Colors.white),
                      SizedBox(width: 3),
                      Text(
                        "Seen",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
