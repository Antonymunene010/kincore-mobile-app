import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddParentsController extends GetxController {
  var selectedGender = "Father".obs; // Default selected
  var isAlive = true.obs;
  var profileImage = "https://i.pravatar.cc/150?u=parent".obs;

  void toggleGender(String gender) {
    selectedGender.value = gender;
  }

  void toggleLivingStatus(bool value) {
    isAlive.value = value;
  }

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

  void saveData() {
    print("Saving Parent Data...");
    Get.back();
  }
}