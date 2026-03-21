import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/dashboard_screen.dart';
import '../switch_space_screen.dart';
import 'switch_space_controller.dart';

class CreateFamilySpaceController extends GetxController {
  // Text Controllers for input fields
  final familyNameController = TextEditingController();
  final descriptionController = TextEditingController();

  // Observable variable image select karne ke liye
  RxString selectedImagePath = ''.obs;

  // Image pick karne ka function (Yaha image_picker package use kar sakte ho)
  void pickImage() {
    Get.snackbar(
      'createSpace.selectImageTitle'.tr,
      'createSpace.selectImageMsg'.tr,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Form submit karne ka function
  void createSpace() {
    // 1. Validation check
    if (familyNameController.text.trim().isEmpty) {
      Get.snackbar(
        'createSpace.validationErrorTitle'.tr,
        'createSpace.validationErrorMsg'.tr,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
      return;
    }

    // 2. Success Snackbar (Dynamic name ke sath .trParams use kiya)
    Get.snackbar(
      'createSpace.successTitle'.tr,
      'createSpace.successMsg'.trParams({'name': familyNameController.text}),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.1),
      colorText: Colors.green,
    );

    // 3. SwitchSpaceController me data add karna
    final switchSpaceController = Get.put(SwitchSpaceController());
    switchSpaceController.addNewSpace(name: familyNameController.text);

    // 4. Thoda delay dekar Switch Space screen par bhej do (taaki snackbar dikh jaye)
    Future.delayed(const Duration(milliseconds: 500), () {
      Get.off(() => const DashboardScreen()); // Get.off use kiya taaki create form history se hat jaye
    });
  }

  @override
  void onClose() {
    familyNameController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}