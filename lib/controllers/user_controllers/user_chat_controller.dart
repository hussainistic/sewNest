import 'package:get/get.dart';

class UserChatController extends GetxController {
  var messages = <Map<String, String>>[
    {'sender': 'Tailor', 'message': 'Hello, how can I assist you with your order?'}
  ].obs;

  var messageController = ''.obs;

  void sendUserMessage() {
    if (messageController.value.isNotEmpty) {
      messages.add({'sender': 'User', 'message': messageController.value});
      String userMessage = messageController.value;
      messageController.value = '';

      Future.delayed(const Duration(seconds: 1), () {
        tailorReply(userMessage);
      });
    }
  }

  void tailorReply(String userMessage) {
    String tailorReply = '';

    if (userMessage.contains('custom dress')) {
      tailorReply = 'Sure! Do you have a specific design in mind?';
    } else if (userMessage.contains('fabric')) {
      tailorReply = 'We have a variety of fabrics. Would you like silk or cotton?';
    } else if (userMessage.contains('measurement')) {
      tailorReply = 'Please share your measurements, or visit us for a free measurement session.';
    } else if (userMessage.contains('order status')) {
      tailorReply = 'Your order is in progress. It will be ready next week.';
    } else if (userMessage.contains('price')) {
      tailorReply = 'Our prices start from \$50, depending on the design and fabric.';
    } else if (userMessage.contains('urgent')) {
      tailorReply = 'We can expedite your order for an additional fee.';
    } else if (userMessage.contains('alteration')) {
      tailorReply = 'Yes, we provide alteration services. Bring your item, and we’ll take care of it.';
    } else if (userMessage.contains('appointment')) {
      tailorReply = 'You can book an appointment on our website or visit our shop directly.';
    } else if (userMessage.contains('color options')) {
      tailorReply = 'We have a wide range of colors. Let us know what you’re looking for.';
    } else if (userMessage.contains('delivery')) {
      tailorReply = 'We offer delivery services. Please provide your address for details.';
    } else if (userMessage.contains('discount')) {
      tailorReply = 'We currently have a 10% discount for first-time customers!';
    } else if (userMessage.contains('payment method')) {
      tailorReply = 'We accept cash, credit/debit cards, and online payments.';
    } else if (userMessage.contains('design suggestions')) {
      tailorReply = 'We can suggest designs based on the occasion. Let us know your preferences!';
    } else if (userMessage.contains('refund policy')) {
      tailorReply = 'We offer refunds only for defective items. Please check our policy for details.';
    } else if (userMessage.contains('store hours')) {
      tailorReply = 'Our store is open from 9 AM to 9 PM, Monday to Saturday.';
    } else if (userMessage.contains('availability')) {
      tailorReply = 'Let us know your requirements, and we’ll confirm availability for you.';
    } else if (userMessage.contains('stitching time')) {
      tailorReply = 'Standard stitching takes 5-7 days. Custom designs may take longer.';
    } else if (userMessage.contains('kids clothing')) {
      tailorReply = 'Yes, we also specialize in kids’ clothing. Let us know your requirements.';
    } else if (userMessage.contains('bulk order')) {
      tailorReply = 'We handle bulk orders. Please share the details for a quote.';
    } else {
      tailorReply = 'Thank you for reaching out. Let us know how we can assist further.';
    }

    messages.add({'sender': 'Tailor', 'message': tailorReply});
  }
}
