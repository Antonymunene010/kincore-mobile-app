import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/localization/app_translations.dart';
import 'features/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      // 🌍 Localization setup
      translations: AppTranslations(),
      locale: const Locale('en', 'US'), // default
      fallbackLocale: const Locale('en', 'US'),

      home: const SplashScreen(),
    );
  }
}
