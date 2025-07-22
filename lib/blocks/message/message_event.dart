abstract class MessageEvent {}

class FetchMessages extends MessageEvent {
  final String chatId;
  FetchMessages(this.chatId);
}

class SendMessageEvent extends MessageEvent {
  final String chatId;
  final String senderId;
  final String content;
  final String messageType;
  final String fileUrl;

  SendMessageEvent({
    required this.chatId,
    required this.senderId,
    required this.content,
    required this.messageType,
    required this.fileUrl,
  });
}
