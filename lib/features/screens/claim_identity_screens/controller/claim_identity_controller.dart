import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClaimIdentityController extends GetxController {
  // [FIX] Controllers ko 'late' declare kiya taaki unhe onInit me properly memory mile
  late TextEditingController inviteCodeController;
  late TextEditingController emailController;

  // Reactive states
  var currentTabIndex = 0.obs;
  var isConfirmed = false.obs;

  @override
  void onInit() {
    super.onInit();
    // [FIX] Controllers yahan initialize karne se dispose error nahi aati
    inviteCodeController = TextEditingController();
    emailController = TextEditingController();
  }

  void changeTab(int index) {
    currentTabIndex.value = index;
  }

  void toggleConfirmation() {
    isConfirmed.value = !isConfirmed.value;
  }

  @override
  void onClose() {
    inviteCodeController.dispose();
    emailController.dispose();
    super.onClose();
  }
}