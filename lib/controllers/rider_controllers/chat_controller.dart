import 'package:get/get.dart';

class TailorChatController extends GetxController {
  var messages = <Map<String, String>>[
    {'sender': 'Tailor', 'message': 'Hello, how can I assist you with your order?'}
  ].obs;

  var messageController = ''.obs;

  void sendTailorMessage() {
    if (messageController.value.isNotEmpty) {
      messages.add({'sender': 'Tailor', 'message': messageController.value});
      messageController.value = '';

      Future.delayed(const Duration(seconds: 1), () {
        userReply(messages.last['message']!);
      });
    }
  }

  void userReply(String tailorMessage) {
    String userReply = '';

    if (tailorMessage.contains('order')) {
      userReply = 'I need a custom dress for an event.';
    } else if (tailorMessage.contains('assist')) {
      userReply = 'Can you help me choose a fabric for my dress?';
    } else {
      userReply = 'Thank you, I am just browsing.';
    }

    messages.add({'sender': 'User', 'message': userReply});
  }
}
