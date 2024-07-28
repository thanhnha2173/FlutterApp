import 'package:flutter/material.dart';
import 'package:shoes_flutter_app/page/login.dart';
import 'package:shoes_flutter_app/page/mainpage.dart';
import 'page/login.dart';
import 'package:provider/provider.dart';
import 'package:shoes_flutter_app/data/provider/user_provider.dart';

void main() => runApp(ChangeNotifierProvider(
                    create: (context) => UserProvider(),
                    child: const MaterialApp(
                      home: LoginScreen(),
                    ),
                  ),);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}
