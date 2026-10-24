import 'package:get/get.dart';

class TailorChatController extends GetxController {
  var messages = <Map<String, String>>[
    {'sender': 'User', 'message': 'Hi, I\'m excited to work with you on my order!'}
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
    } else if (tailorMessage.contains('fabric')) {
      userReply = 'I like cotton fabric. Can you suggest something?';
    } else if (tailorMessage.contains('measurement')) {
      userReply = 'I will send you my measurements tomorrow.';
    } else if (tailorMessage.contains('time')) {
      userReply = 'How much time will it take to complete the dress?';
    } else if (tailorMessage.contains('cost')) {
      userReply = 'Can you tell me the cost of a custom dress?';
    } else if (tailorMessage.contains('thanks')) {
      userReply = 'You’re welcome! Let me know if you need anything else.';
    } else if (tailorMessage.contains('ready')) {
      userReply = 'Great! I am excited to see the final dress.';
    } else if (tailorMessage.contains('design')) {
      userReply = 'Can I send you some design references for my dress?';
    } else if (tailorMessage.contains('color')) {
      userReply = 'I would like to go with a pastel color for my dress.';
    } else if (tailorMessage.contains('alteration')) {
      userReply = 'Can you alter an old dress for me?';
    } else if (tailorMessage.contains('urgent')) {
      userReply = 'I need this dress urgently. Can it be done within 3 days?';
    } else if (tailorMessage.contains('bulk')) {
      userReply = 'I need dresses for a wedding party. Can you manage a bulk order?';
    } else if (tailorMessage.contains('delivery')) {
      userReply = 'Do you offer delivery? I live out of town.';
    } else if (tailorMessage.contains('style')) {
      userReply = 'I’m looking for a trendy style. Can you suggest something?';
    } else if (tailorMessage.contains('appointment')) {
      userReply = 'Can I book an appointment for measurements?';
    } else if (tailorMessage.contains('occasion')) {
      userReply = 'I need a dress for a formal occasion. What do you recommend?';
    } else if (tailorMessage.contains('refund')) {
      userReply = 'What is your refund policy if I am not satisfied?';
    } else if (tailorMessage.contains('accessories')) {
      userReply = 'Do you also provide matching accessories with the dress?';
    } else if (tailorMessage.contains('kids')) {
      userReply = 'Do you design clothes for kids as well?';
    } else {
      userReply = 'Thank you, I am just browsing.';
    }

    messages.add({'sender': 'User', 'message': userReply});
  }
}
