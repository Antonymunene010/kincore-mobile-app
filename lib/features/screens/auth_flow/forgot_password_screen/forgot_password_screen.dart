import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_input_field.dart';
import 'package:kincore_app/core/widgets/soft_gradient_bg.dart';
import '../auth/auth_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.find because AuthController is already initialized in AuthScreen
    final AuthController controller = Get.find<AuthController>();
    final double sh = Get.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: AppText(
          'auth.forgotPasswordTitle'.tr,
          fontSize: 18,
          fontWeight: AppFonts.semiBold,
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SoftGradientBackground(
        child: SafeArea(
          // [FIX] Wrapped in Theme to force CustomInputField label to be Black
          // regardless of system Light/Dark mode, because background is always light.
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: Theme.of(context).colorScheme.copyWith(
                onSurface: Colors.black,          // Fixes Label Color & Input Text
                onSurfaceVariant: Colors.black54, // Fixes Hints & Icons
                outlineVariant: Colors.grey,      // Fixes Borders
              ),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: sh * 0.04),

                  AppText(
                    'auth.forgotPasswordHeading'.tr,
                    fontSize: 28,
                    fontWeight: AppFonts.bold,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 12),

                  AppText(
                    'auth.forgotPasswordDesc'.tr,
                    fontSize: 14,
                    color: Colors.black54,
                    height: 1.5,
                  ),

                  SizedBox(height: sh * 0.05),

                  CustomInputField(
                    label: 'auth.emailLabel'.tr, // Reuse the email label key
                    hint: 'auth.enterEmail'.tr,
                    controller: controller.forgotPasswordEmailController,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: const Icon(Icons.email_outlined, color: Colors.black54, size: 22),
                  ),

                  const SizedBox(height: 40),

                  Obx(() => CustomButton(
                    text: controller.isLoading.value ? 'auth.sending'.tr : 'auth.sendCode'.tr,
                    onPressed: controller.isLoading.value
                        ? () {}
                        : () => controller.sendResetLink(),
                    backgroundColor: AppColors.orangeColor,
                    width: double.infinity,
                    height: 52,
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}