import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shoes_flutter_app/data/model/user_model.dart';

class LoginService {
  Future<UserModel?> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/login'),  // Endpoint đăng nhập trong API của bạn
        body: jsonEncode({'username': username, 'password': password}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      if (json['message'] == 'success') {
        return UserModel.fromJson(json['data']);
      } else {
        throw Exception(json['error']); // Ném lỗi cụ thể từ server
      }
    } else {
      throw Exception('Login failed');
    }
    } catch (e) {
      print(e);
      throw Exception('Error during login');
    }
  }
}
