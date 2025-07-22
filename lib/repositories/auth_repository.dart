import 'dart:convert';
import 'package:qc_chat/models/user_model.dart';
import 'package:qc_chat/services/api_service.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  final ApiService _apiService = ApiService();

  Future<UserModel> login(String email, String password, String role) async {
    try {
      final http.Response response = await _apiService.post('/user/login', {
        "email": email,
        "password": password,
        "role": role,
      });

      if (response.statusCode == 200) {
        print(response.body);
        final Map<String, dynamic> json = jsonDecode(response.body);
       if (json['data'] != null) {
  return UserModel.fromJson(json);

        } else {
          throw Exception('Invalid data from server');
        }
      } else {
        final Map<String, dynamic> error = jsonDecode(response.body);
        throw Exception(error['message'] ?? 'Login failed');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Login error: $e');
    }
  }
}
