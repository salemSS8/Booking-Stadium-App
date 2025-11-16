import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/auth_service.dart';

class UserProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  UserProvider() {
    _loadUser();
  }

  Future<void> _loadUser() async {
    _user = await AuthService.getCurrentUser();
    notifyListeners();
  }

  Future<void> setUser(User user) async {
    _user = user;
    await AuthService.signUp(user); // persist
    notifyListeners();
  }

  Future<void> clearUser() async {
    _user = null;
    await AuthService.logout();
    notifyListeners();
  }
}
