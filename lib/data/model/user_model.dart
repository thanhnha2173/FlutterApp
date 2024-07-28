import 'package:flutter/material.dart';
class UserModel {
  final int id;
  final String username;
  final String password;
  final String email;
  final String role;
  final String? address;
  final String? phone;
  final bool? gender;
  final DateTime? birthday;

  UserModel({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.role,
    this.address,
    this.phone,
    this.gender,
    this.birthday,
  });

  // Phương thức chuyển đổi từ Map sang UserModel
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json["id"],
      username: json["username"],
      password: json["password"],
      email: json["email"],
      role: json["role"],
      address: json["address"],
      phone: json["phone"],
      gender: json["gender"],
      birthday: json["birthday"] == null ? null : DateTime.parse(json["birthday"]),
  );

  // Phương thức chuyển đổi từ UserModel sang Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'email': email,
      'role': role,
      'address': address,
      'phone': phone,
      'gender': gender,
      'birthday': birthday?.toIso8601String(),
  };
  }
}

