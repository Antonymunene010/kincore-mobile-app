import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  // Profile Image Observable
  var profileImageUrl = "https://picsum.photos/200/300".obs; // API URL yahan aayega

  // Date Selection Logic (Isme controller pass karenge)
  Future<void> selectDate(BuildContext context, TextEditingController dateController) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      dateController.text = "${picked.month}/${picked.day}/${picked.year}";
    }
  }

  // Update logic (Isme data pass kar sakte hain)
  void updateProfile(String firstName) {
    print("Updating profile for: $firstName");
    Get.back();
  }
}