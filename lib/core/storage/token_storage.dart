import 'package:shared_preferences/shared_preferences.dart';
class TokenStorage {
  static const String _tokenKey = 'token';
  static const String _userKey = 'user';
  static const String _languageKey = 'language';
  static const String _defaultLanguage = 'ar';
  static const String _rememberMe = 'remember';
  static const String _onboarding = 'onboarding';
  static const String _password = 'password';

  Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<void> deleteToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  Future<void> saveRemember(bool rememberMe) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_rememberMe, rememberMe);
  }

  Future<bool?> getRemember() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_rememberMe);
  }

  Future<void> deleteRemember() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_rememberMe);
  }
  Future<void> saveOnboarding(bool onboarding) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_onboarding, onboarding);
  }

  Future<bool?> getOnboarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_onboarding);
  }

  Future<void> deleteOnboarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_onboarding);
  }

  Future<void> savePassword(String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_password, password);
  }

  Future<String?> getPassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_password);
  }

  Future<void> deletePassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_password);
  }
  
  // Language methods
  Future<void> saveLanguage(String languageCode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, languageCode);
  }

  Future<String> getLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_languageKey) ?? _defaultLanguage;
  }

  // Future<void> saveUser(User user) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final jsonString = jsonEncode(user.toJson());
  //   await prefs.setString(_userKey, jsonString);
  // }
  //
  // Future<User?> getUser() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final jsonString = prefs.getString(_userKey);
  //   if (jsonString == null) return null;
  //   try {
  //     final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
  //     return User.fromJson(jsonMap);
  //   } catch (_) {
  //     return null;
  //   }
  // }

  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_userKey);
    await prefs.remove(_rememberMe);
    await prefs.remove(_password);
  }
}
