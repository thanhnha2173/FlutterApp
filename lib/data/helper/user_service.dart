import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shoes_flutter_app/data/model/user_model.dart';

class UserService {
  Future<UserModel?> fetchUser(String username) async {
  try {
    final response = await http.get(Uri.parse('http://192.168.1.10:3000/user?username=$username'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      if (data['message'] == 'success') {
        return UserModel.fromJson(data['data']);
      } else {
        throw Exception(data['error']);
      }
    } else {
      throw Exception('Failed to load user');
      }
    } catch (e) {
      print(e);
      throw Exception('Error fetching user data: $e');
    }
  }
}
