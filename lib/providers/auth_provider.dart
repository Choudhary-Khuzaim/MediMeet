import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  bool _isLoading = true;
  String? _userId;
  String? _userEmail;
  String? _userName;
  String? _userPhone;

  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading;
  String? get userId => _userId;
  String? get userEmail => _userEmail;
  String? get userName => _userName;
  String? get userPhone => _userPhone;

  AuthProvider() {
    _loadUser();
  }

  Future<void> _loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    _isAuthenticated = prefs.getBool('isAuthenticated') ?? false;
    _userId = prefs.getString('userId');
    _userEmail = prefs.getString('userEmail');
    _userName = prefs.getString('userName');
    _userPhone = prefs.getString('userPhone');
    _isLoading = false;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('savedEmail');
    final savedPassword = prefs.getString('savedPassword');
    final savedPhone = prefs.getString('savedPhone');

    // Check credentials (either admin or previously signed up user)
    bool isValidLogin =
        (email.toLowerCase().trim() == 'admin' && password.trim() == 'admin') ||
        (savedEmail != null &&
            savedPassword != null &&
            email.toLowerCase().trim() == savedEmail.toLowerCase().trim() &&
            password == savedPassword);

    if (isValidLogin) {
      bool isAdmin = email.toLowerCase().trim() == 'admin';
      _isAuthenticated = true;

      if (isAdmin) {
        _userId = 'admin_${DateTime.now().millisecondsSinceEpoch}';
        _userEmail = email;
        _userName = 'Admin';
        _userPhone = '+1 234 567 890'; // Default phone for admin
      } else {
        _userId =
            prefs.getString('savedUserId') ??
            'user_${DateTime.now().millisecondsSinceEpoch}';
        _userEmail = savedEmail ?? email;
        _userName = prefs.getString('savedUserName') ?? 'User';
        _userPhone = savedPhone;
      }

      await prefs.setBool('isAuthenticated', true);
      await prefs.setString('userId', _userId!);
      await prefs.setString('userEmail', _userEmail!);
      await prefs.setString('userName', _userName!);

      if (_userPhone != null) {
        await prefs.setString('userPhone', _userPhone!);
      } else {
        await prefs.remove('userPhone');
      }

      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> updateProfile(String name, String phone) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    _userName = name;
    _userPhone = phone;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
    await prefs.setString('userPhone', phone);

    // Also update saved credentials so next login has the new data
    // Only if not admin
    if (_userEmail?.toLowerCase().trim() != 'admin') {
      await prefs.setString('savedUserName', name);
      await prefs.setString('savedPhone', phone);
    }

    notifyListeners();
    return true;
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
      _userPhone = phone;

      final prefs = await SharedPreferences.getInstance();

      // Save credentials for future login simulation
      await prefs.setString('savedEmail', email);
      await prefs.setString('savedPassword', password);
      await prefs.setString('savedUserName', name);
      await prefs.setString('savedPhone', phone);
      await prefs.setString('savedUserId', _userId!);

      await prefs.setBool('isAuthenticated', true);
      await prefs.setString('userId', _userId!);
      await prefs.setString('userEmail', _userEmail!);
      await prefs.setString('userName', _userName!);
      await prefs.setString('userPhone', _userPhone!);

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
    _userPhone = null;

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isAuthenticated');
    await prefs.remove('userId');
    await prefs.remove('userEmail');
    await prefs.remove('userName');
    await prefs.remove('userPhone');

    notifyListeners();
  }
}
