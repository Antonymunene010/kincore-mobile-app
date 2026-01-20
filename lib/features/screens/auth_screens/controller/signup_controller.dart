import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  // 0 = SignUp, 1 = Login
  var selectedTab = 0.obs;
  var isTermsAccepted = false.obs;

  // OTP ki value yahan store hogi
  var otpCode = "".obs;

  void changeTab(int index) => selectedTab.value = index;
  void toggleTerms(bool? value) => isTermsAccepted.value = value ?? false;

  void performSignUp({
    required String name,
    required String email,
    required String phone,
  }) {
    // 1. Validations
    if (name.trim().isEmpty) {
      Get.snackbar("Error", "Please enter your name", backgroundColor: Colors.red.withOpacity(0.1));
      return;
    }
    if (email.trim().isEmpty || !GetUtils.isEmail(email)) {
      Get.snackbar("Error", "Please enter a valid email", backgroundColor: Colors.red.withOpacity(0.1));
      return;
    }
    if (phone.trim().isEmpty || phone.length < 10) {
      Get.snackbar("Error", "Please enter a valid phone number", backgroundColor: Colors.red.withOpacity(0.1));
      return;
    }
    if (!isTermsAccepted.value) {
      Get.snackbar("Terms", "Please accept terms and conditions", backgroundColor: Colors.red.withOpacity(0.1));
      return;
    }
    if (otpCode.value.length < 6) {
      Get.snackbar("Error", "Please enter valid 6 digit OTP", backgroundColor: Colors.red.withOpacity(0.1));
      return;
    }

    // --- SUCCESS CASE ---
    debugPrint("Signing up with: $name, $email, $phone");

    // Success Snackbar
    Get.snackbar(
      "Success",
      "Account created successfully! Switching to Login.",
      backgroundColor: Colors.green.withOpacity(0.1),
      colorText: Colors.green,
    );

    // 2. SUCCESS HONE PAR LOGIN TAB PAR BHEJO
    // 1000ms (1 sec) ka delay diya hai taaki user snackbar dekh sake
    Future.delayed(const Duration(milliseconds: 1000), () {
      selectedTab.value = 1; // Tab switch to Login
      otpCode.value = "";    // Clear OTP for security
    });
  }
}