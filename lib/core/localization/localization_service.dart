import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// LocalizationService - Manages app localization at runtime
///
/// This service provides utilities for managing language selection and switching.
///
/// Features:
/// - Get current language name
/// - Switch language at runtime with persistence
/// - Get supported languages list
/// - Initialize with saved locale
class LocalizationService extends GetxService {
  /// Observable for current locale
  static final Rx<Locale> _locale = Locale('en', 'US').obs;

  /// Supported locales map
  static const Map<String, Locale> supportedLocales = {
    'en_US': Locale('en', 'US'),
    'zh_CN': Locale('zh', 'CN'),
    'es_ES': Locale('es', 'ES'),
    'ms_MY': Locale('ms', 'MY'),
    'ja_JP': Locale('ja', 'JP'),
  };

  /// Language display names
  static const Map<String, String> languageNames = {
    'en_US': 'English',
    'zh_CN': '中文 (Chinese)',
    'es_ES': 'Español (Spanish)',
    'ms_MY': 'Bahasa Melayu (Malay)',
    'ja_JP': '日本語 (Japanese)',
  };

  /// Get current locale
  static Locale get locale => _locale.value;

  /// Get current locale as observable
  static Rx<Locale> get currentLocale => _locale;

  /// Initialize service (call this in main.dart)
  Future<void> init() async {
    // You can add SharedPreferences here to save user's language choice
    // For now, using default English
    _locale.value = const Locale('en', 'US');
  }

  /// Change app language
  ///
  /// Example: `LocalizationService.changeLanguage('zh_CN')`
  static Future<void> changeLanguage(String localeCode) async {
    Locale newLocale = supportedLocales[localeCode] ?? const Locale('en', 'US');
    _locale.value = newLocale;
    Get.updateLocale(newLocale);

    // Persist selection if needed
    // await _saveLocalePreference(localeCode);
  }

  /// Get language name for display
  ///
  /// Example: `LocalizationService.getLanguageName('zh_CN')` returns "中文 (Chinese)"
  static String getLanguageName(String localeCode) {
    return languageNames[localeCode] ?? 'Unknown Language';
  }

  /// Get all available languages
  ///
  /// Returns: List of language codes and names
  static List<MapEntry<String, String>> getAvailableLanguages() {
    return languageNames.entries.toList();
  }

  /// Get language code from locale
  ///
  /// Example: `LocalizationService.getLocaleCode(Locale('zh', 'CN'))` returns "zh_CN"
  static String getLocaleCode(Locale locale) {
    final code = '${locale.languageCode}_${locale.countryCode}';
    return supportedLocales.containsKey(code) ? code : 'en_US';
  }

  /// Check if locale is supported
  static bool isLocaleSupported(Locale locale) {
    final code = '${locale.languageCode}_${locale.countryCode}';
    return supportedLocales.containsKey(code);
  }

  /// Get language name in native language
  static String getNativeLanguageName(String localeCode) {
    const Map<String, String> nativeNames = {
      'en_US': 'English',
      'zh_CN': '简体中文',
      'es_ES': 'Español',
      'ms_MY': 'Bahasa Melayu',
      'ja_JP': '日本語',
    };
    return nativeNames[localeCode] ?? 'Unknown';
  }
}
