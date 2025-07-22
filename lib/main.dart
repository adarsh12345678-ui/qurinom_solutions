import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qc_chat/blocks/auth/auth_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'repositories/auth_repository.dart';
import 'views/login_screen.dart';
import 'views/home_screen.dart';
import 'models/user_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepository = AuthRepository();

Future<Widget> checkLogin() async {
  final prefs = await SharedPreferences.getInstance();
  final userJson = prefs.getString('user');

  if (userJson != null) {
    final user = UserModel.fromJson(jsonDecode(userJson));
    return HomeScreen(user: user);
  } else {
    return LoginScreen();
  }
}



  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(authRepository: authRepository),
        ),
      ],
      child: MaterialApp(
        title: 'QC Chat',
        debugShowCheckedModeBanner: false,
        home: FutureBuilder<Widget>(
          future: checkLogin(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return snapshot.data!;
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
