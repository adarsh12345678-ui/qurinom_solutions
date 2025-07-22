import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qc_chat/models/chat_model.dart';
import 'package:qc_chat/models/message_model.dart';
import 'package:qc_chat/services/api_service.dart';

class ChatRepository {
  // final ApiService _apiService = ApiService();
final String baseUrl = 'http://45.129.87.38:6065';

 Future<List<ChatModel>> fetchChats(String userId) async {
  final response = await http.get(
    Uri.parse('${baseUrl}/chats/user-chats/$userId'),
  );

  if (response.statusCode == 200) {
    print(response.body);
    final List<dynamic> data = jsonDecode(response.body);

    return data.map((e) => ChatModel.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load chats');
  }
}


 Future<List<MessageModel>> getChatMessages(String chatId) async {
    final url = Uri.parse('${baseUrl}/messages/get-messagesformobile/$chatId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List decoded = json.decode(response.body);
      return decoded.map((msg) => MessageModel.fromJson(msg)).toList();
    } else {
      throw Exception('Failed to load messages');
    }
  }



   Future<MessageModel> sendMessage({
  required String chatId,
  required String senderId,
  required String content,
  required String messageType,
  required String fileUrl,
}) async {
  final url = Uri.parse('${baseUrl}/messages/sendMessage');

  final body = {
    "chatId": chatId,
    "senderId": senderId,
    "content": content,
    "messageType": messageType,
    "fileUrl": fileUrl,
  };

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: json.encode(body),
  );

  print('SEND MESSAGE STATUS: ${response.statusCode}');
  print('SEND MESSAGE BODY: ${response.body}');

  if (response.statusCode == 200 || response.statusCode == 201) {
    final data = json.decode(response.body);
    return MessageModel.fromJson(data);
  } else {
    throw Exception('Failed to send message');
  }
}


}
