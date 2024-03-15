import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wiwikost/modules/models/user_models.dart';

class LocalDBService {
  LocalDBService._();

  ///Set User Data
  static Future<void> setUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', json.encode(user.toJson()));
  }

  ///Get User data
  static Future<User?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user = prefs.getString('user');
    if (user == null) return null;
    return User.fromJson(json.decode(user));
  }

  /// Delete User Data
  static Future<void> clearUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
  }

  ///Set Token
  static Future<void> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', token);
  }

  ///Get Token
  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  ///Delete Token
  static Future<void> clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
  }
  // ///Set Phone And OTP
  // static Future<void> setPhoneNumber(String phoneNumber) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('phone_number', phoneNumber);
  // }
  // static Future<void> Setotp(String otp) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('otp', otp);
  // }
  // ///Get Phobe And Otp
  // static Future<String?> getPhoneNumber() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString('phone_number');
  // }
  //   static Future<String?> getOtp() async {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     return prefs.getString('otp');
  //   }
}
