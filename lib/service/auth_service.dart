import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../view/login_page.dart';

class AuthService {
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('loginData', false);

    Get.offAll(() => const LoginPage());
    Get.snackbar(
      'Success!',
      'Logged out Successfully',
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }
}