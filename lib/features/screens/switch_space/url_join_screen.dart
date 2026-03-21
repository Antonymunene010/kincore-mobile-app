import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_input_field.dart';

class UrlJoinScreen extends StatelessWidget {
  const UrlJoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final double screenW = Get.width;

    // Controller to get pasted link
    final TextEditingController urlController = TextEditingController();

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        backgroundColor: colors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: colors.onSurface, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText(
          'urlJoin.title'.tr,
          fontSize: 20,
          fontWeight: AppFonts.bold,
          color: colors.onSurface,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenW * 0.05, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon and Instructions
              Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.orangeColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.link_rounded, size: 50, color: AppColors.orangeColor),
                ),
              ),
              const SizedBox(height: 30),

              AppText(
                'urlJoin.subtitle'.tr,
                fontSize: 15,
                color: colors.onSurfaceVariant,
                textAlign: TextAlign.center,
                height: 1.4,
              ),
              const SizedBox(height: 30),

              // URL Input Field
              CustomInputField(
                label: '',
                hint: 'urlJoin.hint'.tr,
                controller: urlController,
                color: colors.onSurface,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.content_paste_rounded, color: Colors.grey),
                  onPressed: () {
                    // Logic to paste from clipboard will go here in the controller
                    Get.snackbar("Paste", "Clipboard logic goes here");
                  },
                ),
              ),

              const Spacer(), // Pushes the button to the bottom

              // Submit Button
              CustomButton(
                text: 'urlJoin.submit'.tr,
                onPressed: () {
                  // Link validation and joining logic
                  if(urlController.text.isNotEmpty) {
                    Get.snackbar("Success", "Verifying Link...", backgroundColor: Colors.green, colorText: Colors.white);
                  } else {
                    Get.snackbar("Error", "Please enter a valid link", backgroundColor: Colors.red, colorText: Colors.white);
                  }
                },
                backgroundColor: AppColors.orangeColor,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}