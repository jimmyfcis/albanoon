import 'package:albanoon/core/storage/token_storage.dart';
import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('ar');
  final TokenStorage _tokenStorage = TokenStorage();

  Locale get locale => _locale;

  LocaleProvider() {
    _loadSavedLocale();
  }

  Future<void> _loadSavedLocale() async {
    final String languageCode = await _tokenStorage.getLanguage();
    _locale = Locale(languageCode);
    notifyListeners();
  }

  Future<void> setLocale(Locale locale) async {
    if (!['en', 'ar'].contains(locale.languageCode)) return;
    
    _locale = locale;
    await _tokenStorage.saveLanguage(locale.languageCode);
    notifyListeners();
  }

  Future<void> setEnglish() async {
    await setLocale(const Locale('en'));
  }

  Future<void> setArabic() async {
    await setLocale(const Locale('ar'));
  }

  bool get isRtl => _locale.languageCode == 'ar';
} 