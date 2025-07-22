class ChatModel {
  final String chatId;
  final String senderId;
  final String content;
  final String messageType;
  final String fileUrl;
  final List<dynamic> deletedBy;
  final String status;
  final DateTime? deliveredAt;
  final DateTime? seenAt;
  final List<dynamic> seenBy;
  final String id;
  final List<dynamic> reactions;
  final DateTime sentAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  ChatModel({
    required this.chatId,
    required this.senderId,
    required this.content,
    required this.messageType,
    required this.fileUrl,
    required this.deletedBy,
    required this.status,
    required this.deliveredAt,
    required this.seenAt,
    required this.seenBy,
    required this.id,
    required this.reactions,
    required this.sentAt,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

 factory ChatModel.fromJson(Map<String, dynamic> json) {
  return ChatModel(
    chatId: json['chatId']?.toString() ?? '',
    senderId: json['senderId']?.toString() ?? '',
    content: json['content']?.toString() ?? '',
    messageType: json['messageType']?.toString() ?? '',
    fileUrl: json['fileUrl']?.toString() ?? '',
    deletedBy: json['deletedBy'] ?? [],
    status: json['status']?.toString() ?? '',
    deliveredAt: json['deliveredAt'] != null ? DateTime.tryParse(json['deliveredAt'].toString()) : null,
    seenAt: json['seenAt'] != null ? DateTime.tryParse(json['seenAt'].toString()) : null,
    seenBy: json['seenBy'] ?? [],
    id: json['_id']?.toString() ?? '',
    reactions: json['reactions'] ?? [],
    sentAt: json['sentAt'] != null ? DateTime.tryParse(json['sentAt'].toString()) ?? DateTime.now() : DateTime.now(),
    createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt'].toString()) ?? DateTime.now() : DateTime.now(),
    updatedAt: json['updatedAt'] != null ? DateTime.tryParse(json['updatedAt'].toString()) ?? DateTime.now() : DateTime.now(),
    v: int.tryParse(json['__v']?.toString() ?? '0') ?? 0,
  );
}

}
