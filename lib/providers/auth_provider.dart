import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  bool _isLoading = true;
  String? _userId;
  String? _userEmail;
  String? _userName;

  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading;
  String? get userId => _userId;
  String? get userEmail => _userEmail;
  String? get userName => _userName;

  AuthProvider() {
    _loadUser();
  }

  Future<void> _loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    _isAuthenticated = prefs.getBool('isAuthenticated') ?? false;
    _userId = prefs.getString('userId');
    _userEmail = prefs.getString('userEmail');
    _userName = prefs.getString('userName');
    _isLoading = false;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    // Fixed credentials
    const String validEmail = 'admin';
    const String validPassword = 'admin';

    // Check credentials
    if (email.toLowerCase().trim() == validEmail &&
        password.trim() == validPassword) {
      _isAuthenticated = true;
      _userId = 'user_${DateTime.now().millisecondsSinceEpoch}';
      _userEmail = email;
      _userName = 'Admin';

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isAuthenticated', true);
      await prefs.setString('userId', _userId!);
      await prefs.setString('userEmail', _userEmail!);
      await prefs.setString('userName', _userName!);

      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> signup(
    String name,
    String email,
    String phone,
    String password,
  ) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    // For demo purposes, accept any valid signup
    if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      _isAuthenticated = true;
      _userId = 'user_${DateTime.now().millisecondsSinceEpoch}';
      _userEmail = email;
      _userName = name;

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isAuthenticated', true);
      await prefs.setString('userId', _userId!);
      await prefs.setString('userEmail', _userEmail!);
      await prefs.setString('userName', _userName!);

      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    _isAuthenticated = false;
    _userId = null;
    _userEmail = null;
    _userName = null;

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isAuthenticated');
    await prefs.remove('userId');
    await prefs.remove('userEmail');
    await prefs.remove('userName');

    notifyListeners();
  }
}
