import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  var conversations = <Conversation>[].obs;
  var filteredConversations = <Conversation>[].obs;
  var selectedConversation = Rx<Conversation?>(null);
  var searchQuery = "".obs;
  var messageController = "".obs;
  var messageController1 = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    conversations.addAll([
      Conversation(
        userName: "Jane Doe",
        lastMessage: "Hey there!",
        messages: [
          ChatMessage(message: "Hey!", isSender: false, time: "8:30pm"),
          ChatMessage(message: "How are you?", isSender: false, time: "8:31pm"),
        ],
      ),
      Conversation(
        userName: "Jack Johan",
        lastMessage: "See you tomorrow",
        messages: [
          ChatMessage(message: "See you tomorrow!", isSender: true, time: "9:15pm"),
        ],
      ),
    ]);

    filteredConversations.assignAll(conversations);
  }

  void updateSearch(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredConversations.assignAll(conversations);
    } else {
      filteredConversations.assignAll(
        conversations.where((c) =>
        c.userName.toLowerCase().contains(query.toLowerCase()) ||
            c.lastMessage.toLowerCase().contains(query.toLowerCase())),
      );
    }
  }

  void selectConversation(Conversation convo) {
    convo.isUnread = false;
    selectedConversation.value = convo;
    conversations.refresh();
    filteredConversations.refresh();
  }


  void sendMessage(String text) {
    if (text.trim().isEmpty || selectedConversation.value == null) return;
    selectedConversation.value!.messages.add(
      ChatMessage(message: text, isSender: true, time: "8:40pm"),
    );
    selectedConversation.refresh();
    messageController.value = "";
    messageController1.clear();
  }

  void receiveMessage(String text, Conversation convo) {
    convo.messages.add(ChatMessage(message: text, isSender: false, time: "8:45pm"));
    convo.lastMessage = text;
    convo.isUnread = true;
    conversations.refresh();
    filteredConversations.refresh();
  }
}

class Conversation {
  final String userName;
  String lastMessage;
  final List<ChatMessage> messages;
  bool isUnread;

  Conversation({
    required this.userName,
    required this.lastMessage,
    required this.messages,
    this.isUnread = false,
  });
}

class ChatMessage {
  final String message;
  final bool isSender;
  final String time;

  ChatMessage({required this.message, required this.isSender, required this.time});
}
