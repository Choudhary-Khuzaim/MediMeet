import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _locale = const Locale('en', 'US');
  bool _isUrdu = false;

  Locale get locale => _locale;
  bool get isUrdu => _isUrdu;

  LanguageProvider() {
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('language_code') ?? 'en';
    _isUrdu = languageCode == 'ur';
    _locale = _isUrdu ? const Locale('ur', 'PK') : const Locale('en', 'US');
    notifyListeners();
  }

  Future<void> setLanguage(String language) async {
    if (language == 'Urdu' || language == 'اردو (Urdu)') {
      _locale = const Locale('ur', 'PK');
      _isUrdu = true;
    } else {
      _locale = const Locale('en', 'US');
      _isUrdu = false;
    }
    notifyListeners();

    // Save to preferences asynchronously
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', _isUrdu ? 'ur' : 'en');
  }

  String getLanguageName() {
    return _isUrdu ? 'اردو (Urdu)' : 'English';
  }
}
