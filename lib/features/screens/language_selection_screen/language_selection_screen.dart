import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_text.dart';
import '../../../core/widgets/custom_button.dart';
import 'widget/language_tile.dart';
import 'contoller/language_selection_controller.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Permanent: false (default) hi rehne de, taaki screen leave karte hi memory free ho jaye
    final controller = Get.put(LanguageSelectionController());

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),

            AppText(
              "Kincore",
              fontSize: 25,
              fontWeight: AppFonts.bold,
              gradient: LinearGradient(
                colors: [AppColors.primaryColor, AppColors.orangeColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: AppText(
                "Select Your Language!",
                fontSize: 20,
                fontWeight: AppFonts.semiBold,
                color: AppColors.blackColor,
              ),
            ),

            const SizedBox(height: 10),

            Center(
              child: AppText(
                "Choose Your Preferred Language for the app to enhance your experience.",
                fontSize: 14,
                textAlign: TextAlign.center,
                fontWeight: AppFonts.medium,
                color: AppColors.greyColor,
              ),
            ),

            const SizedBox(height: 40),

            // English Tile
            Obx(() => LanguageTile(
              title: "English",
              subtitle: "Set as app language",
              selected: controller.selectedLang.value == 'en',
              onTap: () => controller.selectLanguage('en'),
            )),

            const SizedBox(height: 10),

            // Chinese Tile
            Obx(() => LanguageTile(
              title: "中文 (Chinese)",
              subtitle: "设为应用语言",
              selected: controller.selectedLang.value == 'zh',
              onTap: () => controller.selectLanguage('zh'),
            )),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: CustomButton(
                text: "Confirm language",
                onPressed: () => controller.confirmLanguage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}