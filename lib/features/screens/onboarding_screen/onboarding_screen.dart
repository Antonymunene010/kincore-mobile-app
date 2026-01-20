import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/widgets/custom_button.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_text.dart';
import '../../routes/dashboard_screen.dart';
import '../language_selection_screen/language_selection_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // 🔴 3 Circles Stack (Top Half-Cut)
            SizedBox(
              height: Get.height * 0.45,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  // 🟡 Bottom Circle (Yellow)
                  Positioned(
                    top: -330, // ⬆️ moved up
                    left: -160,
                    child: Container(
                      width: 700,
                      height: 620,
                      decoration: const BoxDecoration(
                        color: AppColors.yellowColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),

                  // 🟠 Middle Circle (Orange)
                  Positioned(
                    top: -400, // ⬆️ moved up
                    left: -140,
                    child: Container(
                      width: 660,
                      height: 620,
                      decoration: const BoxDecoration(
                        color: AppColors.orangeColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),

                  // 🔴 Top Circle (Red) with Center Text
                  Positioned(
                    top: -500,
                    left: -130,
                    child: Container(
                      width: 630,
                      height: 630,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 80),
                          child: AppText(
                            "Kincore",
                            fontSize: 32,
                            fontWeight: AppFonts.bold,
                            color: AppColors.whiteColor,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),


            // 📝 Text Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
              child: Column(
                children: const [
                  AppText(
                    "Preserve your family legacy.",
                    fontSize: 20,
                    fontWeight: AppFonts.bold,
                    color: AppColors.blackColor,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  AppText(
                    "Build a detailed family tree and keep your heritage alive for future generations.",
                    fontSize: 14,
                    fontWeight: AppFonts.medium,
                    color: AppColors.blackColor,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            /// 🔽 Push button to bottom
            const Spacer(),

            // Get Started Button (Bottom)
            Padding(
              padding: const EdgeInsets.only(bottom: 24,right: 16,left: 16),
              child: CustomButton(
                text: 'Get Started',
                onPressed: () {
                  // Get.to(LanguageSelectionScreen());
                  Get.to(DashboardScreen());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
