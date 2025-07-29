import 'package:get/get.dart';

class ChatController extends GetxController {
  var messages = <ChatMessage>[].obs;
  var messageController = "".obs;

  @override
  void onInit() {
    super.onInit();
    messages.addAll([
      ChatMessage(message: "Lorem ipsum dolor sit amet", isSender: false, time: "8:36pm"),
      ChatMessage(message: "Hello!", isSender: true, time: "8:36pm"),
      ChatMessage(message: "I want to say something about", isSender: true, time: "8:36pm"),
      ChatMessage(
        message: "Lorem ipsum dolor sit amet consectetur. Sit egestas leo integer sed vitae tortor cras.",
        isSender: true,
        time: "8:36pm",
      ),
    ]);
  }

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;
    messages.add(ChatMessage(message: text, isSender: true, time: "8:40pm"));
    messageController.value = "";
  }
}


class ChatMessage {
  final String message;
  final bool isSender;
  final String time;

  ChatMessage({required this.message, required this.isSender, required this.time});
}
