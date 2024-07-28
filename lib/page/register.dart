import 'package:flutter/material.dart';
import 'package:shoes_flutter_app/data/helper/databasehelper.dart';
import 'package:shoes_flutter_app/data/model/user_model.dart';
import 'package:shoes_flutter_app/page/login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack( // Sử dụng Stack để xếp chồng các thành phần
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
            color: Colors.black.withOpacity(0.25), // Làm mờ nền
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Logo
                Image.asset(
                  'assets/logo/white_icon.png', // Thay bằng đường dẫn đến logo của bạn
                  height: 100,
                ),
                const SizedBox(height: 32.0),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // TextFormField được thay thế bằng TextField
                      TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          labelText: 'Tên đăng nhập',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      // Các TextField khác cho password, confirmPassword và email
                      TextField(
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
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_clock),
                          labelText: 'Nhập lại mật khẩu',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email),
                          labelText: 'Email',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),
                // Nút "Đăng ký"
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () async {
                      // ... (logic xử lý đăng ký)
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text('Đăng ký'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

