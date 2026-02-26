import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/constants/variables.dart';

class AuthProvider {
  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse("${Variables.baseUrl}/api/v1/auth/login");

    final response = await http.post(
      url,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );

    return {
      "status": response.statusCode,
      "body": response.body,
    };
  }
}
