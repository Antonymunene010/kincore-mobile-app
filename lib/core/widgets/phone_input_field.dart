import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_colors.dart';
import 'app_text.dart';
import '../../../core/utils/app_fonts.dart';

class PhoneInputField extends StatelessWidget {
  // 1. Controller ko parameter banaya taaki UI se pass ho sake
  final TextEditingController? controller;

  const PhoneInputField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: Get.height * 0.02,
            bottom: Get.height * 0.01,
          ),
          child: AppText(
            'addMember.phoneNumber'.tr,            fontSize: 16,
            fontWeight: AppFonts.bold,
          ),
        ),

        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // +91 Country Code Box
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.greyColor.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    AppText("+91", fontSize: 14),
                    const Icon(Icons.arrow_drop_down, size: 20),
                  ],
                ),
              ),

              SizedBox(width: Get.width * 0.02),

              // Phone Number Input Box
              Expanded(
                child: TextField(
                  // 2. Yahan parameter wala controller assign kiya
                  controller: controller,
                  keyboardType: TextInputType.phone, // Keyboard fix
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    hintText: 'addMember.phoneHint'.tr,                    hintStyle: TextStyle(color: AppColors.greyColor.withOpacity(0.5)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    suffixIcon: const Icon(
                      Icons.check,
                      color: Colors.grey,
                      size: 20,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: AppColors.greyColor.withOpacity(0.3),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColors.orangeColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}