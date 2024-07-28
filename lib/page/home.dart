import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_flutter_app/data/helper/user_service.dart';
import 'package:shoes_flutter_app/data/model/user_model.dart';
import 'package:shoes_flutter_app/page/login.dart';
import 'package:shoes_flutter_app/data/provider/user_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final UserModel? user = userProvider.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang chủ'),
      ),
      body: FutureBuilder<UserModel?>( // Sử dụng FutureBuilder để gọi API
        future: user != null ? UserService().fetchUser(user.username) : null,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Lỗi: ${snapshot.error}');
          } else if (snapshot.hasData && snapshot.data != null) {
            final fetchedUser = snapshot.data!;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Xin chào, ${fetchedUser.username}!'),
                  Text('Email: ${fetchedUser.email}'),
                  // Hiển thị các thông tin khác của người dùng từ biến "fetchedUser"
                ],
              ),
            );
          } else {
            return const Text('Không có dữ liệu người dùng');
          }
        },
      ),
    );
  }
}
