import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../scanner_screen/scanner_screen.dart';

class LoginController extends GetxController {
  // OTP ki value observable rakhenge
  var otpCode = "".obs;

  // Login function jo UI se phone number lega
  void performLogin({required String phoneNumber}) {

    // 1. VALIDATION: Phone Number
    if (phoneNumber.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "Phone number cannot be empty",
        backgroundColor: Colors.red.withOpacity(0.1),
        snackPosition: SnackPosition.TOP, // Top par snackbar
      );
      return;
    }

    if (phoneNumber.length < 10) {
      Get.snackbar(
        "Invalid Number",
        "Please enter a valid 10-digit phone number",
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    // 2. VALIDATION: OTP
    if (otpCode.value.length < 6) {
      Get.snackbar(
        "OTP Missing",
        "Please enter the 6-digit verification code",
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    // --- 3. SUCCESS LOGIC (Login Successful) ---
    debugPrint("Login successful for: $phoneNumber");

    // Welcome Snackbar (Modern & Green)
    Get.snackbar(
      "Welcome Back!",
      "Login successful. Connecting you to your roots...",
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green.shade600,
      colorText: Colors.white,
      icon: const Icon(Icons.check_circle_outline, color: Colors.white, size: 30),
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(15),
      borderRadius: 15,
      shouldIconPulse: true,
      snackStyle: SnackStyle.FLOATING,
    );

    // Thoda sa wait karke next screen par bhejo taaki user message dekh sake
    Future.delayed(const Duration(milliseconds: 1500), () {
      Get.offAll(() => const ScannerScreen());
    });
  }
}