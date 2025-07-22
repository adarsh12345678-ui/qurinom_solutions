import 'package:qc_chat/models/message_model.dart';

abstract class MessageState {}

class MessageLoading extends MessageState {}

class MessageLoaded extends MessageState {
  final List<MessageModel> messages;
  MessageLoaded(this.messages);
}

class MessageError extends MessageState {
  final String error;
  MessageError(this.error);
}
