import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qc_chat/models/message_model.dart';
import '../../repositories/chat_repo.dart';
import 'message_event.dart';
import 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final ChatRepository repo;

  MessageBloc(this.repo) : super(MessageLoading()) {
    on<FetchMessages>((event, emit) async {
      try {
        emit(MessageLoading());
        final messages = await repo.getChatMessages(event.chatId);
        emit(MessageLoaded(messages));
      } catch (e) {
        emit(MessageError(e.toString()));
      }
    });

    on<SendMessageEvent>((event, emit) async {
      if (state is! MessageLoaded) return;

      try {
        final newMessage = await repo.sendMessage(
          chatId: event.chatId,
          senderId: event.senderId,
          content: event.content,
          messageType: event.messageType,
          fileUrl: event.fileUrl,
        );

        final currentMessages = List<MessageModel>.from(
            (state as MessageLoaded).messages);
        currentMessages.add(newMessage);

        emit(MessageLoaded(currentMessages));
      } catch (e) {
        print('Send message failed: $e');
      }
    });
  }
}
