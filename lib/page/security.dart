import 'package:flutter/material.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tài khoản và Bảo mật'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Tài khoản và Bảo mật', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              _buildAccountInfo('Tên', 'Bánh Tôn'),
              _buildAccountInfo('Ngày sinh', '31/02/2024'),
              _buildAccountInfo('Giới tính', 'Nam'),
              _buildAccountInfo('Tên người dùng', 'banhton_123'),
              _buildAccountInfo('Số điện thoại', '*****89'),
              _buildAccountInfo('Email', 'b*********3@gmail.com'),
              _buildAccountInfo('Tài khoản liên kết', ''),
              _buildAccountInfo('Đổi mật khẩu', ''),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountInfo(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.black, fontSize: 16)),
          Text(value, style: const TextStyle(color: Colors.black, fontSize: 16)),
        ],
      ),
    );
  }
}
