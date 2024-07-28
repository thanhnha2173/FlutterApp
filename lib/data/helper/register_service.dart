import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shoes_flutter_app/data/model/user_model.dart';

class RegisterService {
  Future<UserModel?> register(String username, String password, String email) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.10:3000/register'), 
        body: jsonEncode({'username': username, 'password': password, 'email': email}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body)['data'];
        return UserModel.fromJson(data);
      } else {
        final error = jsonDecode(response.body)['error'];
        throw Exception(error); 
      }
    } catch (e) {
      print(e);
    throw Exception('Error during registration');
    }
  }
}

