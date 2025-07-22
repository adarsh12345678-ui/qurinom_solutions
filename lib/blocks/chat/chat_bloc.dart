import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qc_chat/repositories/chat_repo.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository chatRepository;

  ChatBloc(this.chatRepository) : super(ChatInitial()) {
    on<FetchChats>((event, emit) async {
      emit(ChatLoading());
      try {
        final chats = await chatRepository.fetchChats(event.userId);
        emit(ChatLoaded(chats));
      } catch (e) {
        print('Error fetching chats: $e');
        emit(ChatError(e.toString()));
      }
    });
  }
}
