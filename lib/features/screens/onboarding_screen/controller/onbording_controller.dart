import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/features/screens/language_selection_screen/contoller/language_selection_controller.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs;
  final PageController pageController = PageController();

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void goToLanguagePage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void completeOnboarding() {
    // Language confirm logic call karke aage badho
    final langController = Get.find<LanguageSelectionController>();
    langController.confirmLanguage();
  }
}