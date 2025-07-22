import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qc_chat/blocks/chat/chat_bloc.dart';
import 'package:qc_chat/blocks/chat/chat_event.dart';
import 'package:qc_chat/blocks/chat/chat_state.dart';
import 'package:qc_chat/blocks/message/message_bloc.dart';
import 'package:qc_chat/blocks/message/message_event.dart';
import 'package:qc_chat/models/user_model.dart';
import 'package:qc_chat/repositories/chat_repo.dart';
import 'package:qc_chat/views/chat_detail_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart'; // <-- Make sure this is imported

class HomeScreen extends StatelessWidget {
  final UserModel user;

  const HomeScreen({Key? key, required this.user}) : super(key: key);

  void _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // clear stored user
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final userId = user.data.user!.id;

    return BlocProvider(
      create: (_) => ChatBloc(ChatRepository())..add(FetchChats(userId)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(
            'Chats (${user.data.user!.role})',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.logout,color: Colors.white,),
              tooltip: 'Logout',
              onPressed: () => _logout(context),
            )
          ],
        ),
        body: BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            if (state is ChatLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ChatLoaded) {
              if (state.chats.isEmpty) {
                return const Center(child: Text('No chats found'));
              }
              return ListView.builder(
                itemCount: state.chats.length,
                itemBuilder: (context, index) {
                  final chat = state.chats[index];
                  return ListTile(
                    title: Text(
                      "Chat ID: ${chat.id}",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    subtitle: Text("Type: ${chat.messageType}"),
                    trailing: const Icon(Icons.chat_bubble_outline, color: Colors.deepPurple),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider(
                            create: (_) =>
                                MessageBloc(ChatRepository())..add(FetchMessages(chat.id)),
                            child: ChatDetailScreen(
                              chatId: chat.id,
                              userId: userId,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            } else if (state is ChatError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const Center(child: Text('No chats found'));
            }
          },
        ),
      ),
    );
  }
}
