import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kincore_app/features/screens/auth_screens/auth_screen.dart';
import '../../auth_screens/controller/signup_controller.dart';

class LanguageSelectionController extends GetxController {
  var selectedLang = 'en'.obs;

  void selectLanguage(String lang) {
    selectedLang.value = lang;
  }

  void confirmLanguage() {
    // Locale update
    Get.updateLocale(selectedLang.value == 'en'
        ? const Locale('en', 'US')
        : const Locale('zh', 'CN'));

    // FIX: Navigation se pehle controller ko memory me daal do
    Get.put(SignUpController());

    // Sabse safe navigation
    Future.delayed(const Duration(milliseconds: 100), () {
      Get.offAll(() => const AuthScreen());
    });
  }
}