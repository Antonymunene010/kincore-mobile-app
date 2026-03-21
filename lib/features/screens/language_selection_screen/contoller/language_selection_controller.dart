import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/features/screens/auth_flow/auth/auth_controller.dart';
import 'package:kincore_app/features/screens/switch_space/choose_space_screen.dart';

import '../../auth_flow/auth/auth_screen.dart';

class LanguageSelectionController extends GetxController {
  /// Selected language code
  final selectedLang = 'en'.obs;

  /// 🌍 Language list (UI ke liye)
  final List<Map<String, String>> languages = [
    {
      'code': 'en',
      'title': 'English',
      'subtitle': 'Set as app language',
    },
    {
      'code': 'zh',
      'title': '中文 (Chinese)',
      'subtitle': '设为应用语言',
    },
    {
      'code': 'es',
      'title': 'Española (Spanish)',
      'subtitle': 'Establecer como idioma de la aplicación',
    },
    {
      'code': 'ms',
      'title': 'Bahasa Melayu (Malay)',
      'subtitle': 'Tetapkan sebagai bahasa aplikasi',
    },
    {
      'code': 'ja',
      'title': '日本語 (Japanese)',
      'subtitle': 'アプリの言語として設定する',
    },
  ];

  /// 🌐 Language → Locale map
  final Map<String, Locale> localeMap = const {
    'en': Locale('en', 'US'),
    'zh': Locale('zh', 'CN'),
    'es': Locale('es', 'ES'),
    'ms': Locale('ms', 'MY'),
    'ja': Locale('ja', 'JP'),
  };

  void selectLanguage(String lang) {
    selectedLang.value = lang;
    debugPrint("Language selected: $lang");
    update(['Lang']);
  }

  void confirmLanguage() {
    final locale = localeMap[selectedLang.value] ?? const Locale('en', 'US');

    /// Update locale
    Get.updateLocale(locale);
    debugPrint("Locale updated: $locale");

    /// Ensure signup controller exists
    if (!Get.isRegistered<AuthController>()) {
      Get.put(AuthController(), permanent: true);
    }

    // Get.to(ChooseSpaceScreen());

    /// Navigate to auth
    Get.offAll(() =>  AuthScreen());
  }
}
