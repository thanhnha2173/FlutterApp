import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_flutter_app/data/helper/databasehelper.dart';
import 'package:shoes_flutter_app/data/model/user_model.dart';
import 'package:shoes_flutter_app/page/home.dart';
import 'package:shoes_flutter_app/page/mainpage.dart';
import 'package:shoes_flutter_app/page/register.dart';
import 'package:provider/provider.dart';// Import UserProvider
import 'package:shoes_flutter_app/data/provider/user_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background GIF (Nếu bạn muốn sử dụng)
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/gif/background.gif'), // Đường dẫn đến GIF
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.25), // Làm tối GIF
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/logo/white_icon.png', // Thay thế bằng đường dẫn đến logo của bạn
                  height: 100,
                ),
                const SizedBox(height: 32.0),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          labelText: 'Tài khoản',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vui lòng nhập tên đăng nhập';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          labelText: 'Mật khẩu',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vui lòng nhập mật khẩu';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24.0),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        String username = _usernameController.text;
                        String password = _passwordController.text;
                
                        UserModel? user = await DatabaseHelper.instance.getUserByUsername(username);
                        if (user != null && user.password == password) {
                          Provider.of<UserProvider>(context, listen: false).setUser(user); // Lưu vào Provider
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const MainPage()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Sai tên đăng nhập hoặc mật khẩu')),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text('Đăng nhập'),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Xử lý quên mật khẩu (nếu cần)
                  },
                  child: const Text('Quên mật khẩu?', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterScreen()),
                  );
                },
                child: const Text('Đăng ký', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

