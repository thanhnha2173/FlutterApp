import 'package:flutter/material.dart';
import 'package:shoes_flutter_app/page/security.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cài đặt')),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Cài đặt', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              const Text('Tài khoản', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
              _buildSettingsItem('Tài khoản và Bảo mật', context),
              _buildSettingsItem('Địa Chỉ', context),
              _buildSettingsItem('Tài khoản / Thẻ ngân hàng', context),
              const SizedBox(height: 20),
              const Text('Cài đặt', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
              _buildSettingsItem('Cài đặt Thông báo', context, trailing: 'On'),
              _buildSettingsItem('Ngôn ngữ', context, trailing: 'Tiếng Việt'),
              const SizedBox(height: 20),
              const Text('Hỗ trợ', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
              _buildSettingsItem('Tiêu chuẩn cộng đồng', context),
              _buildSettingsItem('Điều khoản', context),
              _buildSettingsItem('Yêu cầu huỷ tài khoản', context),
              const Spacer(),
              const Center(child: Text('Đăng xuất', style: TextStyle(color: Colors.black, fontSize: 18))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsItem(String title, BuildContext context, {String? trailing}) {
    return GestureDetector(
      onTap: () {
        if (title == 'Tài khoản và Bảo mật') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SecurityScreen()));
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(color: Colors.black, fontSize: 16)),
            if (trailing != null) Text(trailing, style: const TextStyle(color: Colors.black, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
