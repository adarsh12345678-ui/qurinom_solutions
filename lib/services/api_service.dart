import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://45.129.87.38:6065';

  Future<http.Response> post(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('$baseUrl$endpoint');
    return await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body));
  }
}
