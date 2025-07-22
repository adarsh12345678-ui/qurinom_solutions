class MessageModel {
  final String id;
  final String chatId;
  final String senderId;
  final String content;
  final String messageType;
  final String fileUrl;
  final String status;
  final DateTime sentAt;

  MessageModel({
    required this.id,
    required this.chatId,
    required this.senderId,
    required this.content,
    required this.messageType,
    required this.fileUrl,
    required this.status,
    required this.sentAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['_id'],
      chatId: json['chatId'],
      senderId: json['senderId'],
      content: json['content'],
      messageType: json['messageType'],
      fileUrl: json['fileUrl'] ?? '',
      status: json['status'] ?? 'sent',
      sentAt: DateTime.parse(json['sentAt']),
    );
  }
}
