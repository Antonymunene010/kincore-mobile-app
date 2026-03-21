import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_images_const.dart';
import '../../../core/utils/fetch_pixels.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_widgets.dart';
import '../../../core/widgets/soft_gradient_bg.dart';
import 'contoller/language_selection_controller.dart';
import 'widget/language_tile.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LanguageSelectionController());

    return Scaffold(
      body: SoftGradientBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal:  Get.width * 0.05),
              child: Column(
                children: [
                  const SizedBox(height: 30),

                  CustomAssetImage(
                    imageName: AppImagesConst.kincoreLogo,
                    height: FetchPixels.h(100),
                    width: FetchPixels.w(100),
                  ),

                  const SizedBox(height: 10),

                  AppText(
                    "Kincore",
                    fontSize: 24,
                    fontWeight: AppFonts.bold,
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primaryColor,
                        AppColors.yellowColor,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),

                  const SizedBox(height: 20),

                  AppText(
                    "Select Your Language!",
                    fontSize: 20,
                    fontWeight: AppFonts.semiBold,
                    color: AppColors.blackColor,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppText(
                      "Choose Your Preferred Language for the app to enhance your experience.",
                      fontSize: 14,
                      textAlign: TextAlign.center,
                      fontWeight: AppFonts.medium,
                      color: AppColors.greyColor,
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// 🌍 Language List (NO Expanded)
                  GetBuilder<LanguageSelectionController>(
                    id: 'Lang',
                    builder: (controller) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.languages.length,
                        itemBuilder: (context, index) {
                          final lang = controller.languages[index];

                          return LanguageTile(
                            title: lang['title']!,
                            subtitle: lang['subtitle']!,
                            selected:
                            controller.selectedLang.value == lang['code'],
                            onTap: () =>
                                controller.selectLanguage(lang['code']!),
                          );
                        },
                      );
                    },
                  ),

                  const SizedBox(height: 16),

                  CustomButton(
                    text: "Confirm Language",
                    onPressed: controller.confirmLanguage,
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
