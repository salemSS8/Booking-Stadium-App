import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class AuthService {
  static const _userKey = 'logged_user';

  // Mock sign up: save the user locally
  static Future<void> signUp(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, jsonEncode(user.toJson()));
  }

  // Mock login: check stored user matches credentials
  static Future<User?> login(String emailOrPhone, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_userKey);
    if (raw == null) return null;
    final map = jsonDecode(raw) as Map<String, dynamic>;
    final stored = User.fromJson(map);

    final matchesEmail =
        stored.email.toLowerCase() == emailOrPhone.toLowerCase();
    final matchesPhone = stored.phone == emailOrPhone;
    final matchesPassword = stored.password == password;

    if ((matchesEmail || matchesPhone) && matchesPassword) {
      return stored;
    }
    return null;
  }

  static Future<User?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_userKey);
    if (raw == null) return null;
    final map = jsonDecode(raw) as Map<String, dynamic>;
    return User.fromJson(map);
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }
}
