import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddChildController extends GetxController {
  // Observables
  var selectedGender = "Male".obs;
  var isAlive = true.obs;
  var profileImage = "https://i.pravatar.cc/150?u=child".obs;

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

  void saveChildData() {
    print("Saving Child Data...");
    Get.back();
  }
}