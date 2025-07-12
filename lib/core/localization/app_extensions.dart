import 'package:flutter/material.dart';
import 'app_localizations.dart';

extension LocalizedStrings on BuildContext {
  AppLocalizations get tr => AppLocalizations.of(this);
}

extension LocaleExtension on BuildContext {
  bool get isRtl => Localizations.localeOf(this).languageCode == 'ar';
  TextDirection get textDirection => isRtl ? TextDirection.rtl : TextDirection.ltr;
} 