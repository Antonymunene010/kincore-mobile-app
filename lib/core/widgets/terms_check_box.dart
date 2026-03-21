import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/features/screens/auth_flow/auth/auth_controller.dart';
import '../../../core/utils/app_colors.dart';
import 'app_text.dart';

class TermsCheckbox extends StatelessWidget {
  const TermsCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find();
    return Row(
      children: [
        Obx(() => Checkbox(
          value: controller.isTermsAccepted.value,
          onChanged: controller.toggleTerms,
          activeColor: Colors.green,
        )),
        AppText(
          "I accept Terms & Conditions",
          fontSize: Get.width * 0.032,
          color: AppColors.blackColor,
        ),
      ],
    );
  }
}