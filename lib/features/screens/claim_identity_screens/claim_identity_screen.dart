import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import 'package:kincore_app/features/screens/claim_identity_screens/identity_status_screen.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_input_field.dart';
import '../memory_screen/widget/dotted_container.dart';
import 'controller/claim_identity_controller.dart';
import 'widget/claim_tabs_switch.dart';
import 'widget/profile_match_card.dart';

class ClaimIdentityScreen extends StatelessWidget {
  // [FIX] Controller ko build method ke bahar class level par initialize kiya
  final ClaimIdentityController controller = Get.put(ClaimIdentityController());

  // [FIX] Yahan se 'const' hata diya kyunki controller non-const variable hai
  ClaimIdentityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final double sh = Get.height;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        title: AppText("claim.title".tr, fontSize: 18, fontWeight: AppFonts.semiBold),
        centerTitle: true,
        backgroundColor: colors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, size: 20, color: colors.onSurface),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header Description
            AppText(
              "claim.description".tr,
              fontSize: 12,
              color: colors.onSurface.withOpacity(0.8),
            ),
            const SizedBox(height: 20),

            /// 1. Tab Switcher
            Obx(() => ClaimTabSwitch(
              currentIndex: controller.currentTabIndex.value,
              onTabChanged: (index) => controller.changeTab(index),
            )),

            const SizedBox(height: 24),

            /// Invited Code Section
            AppText("claim.inviteCode".tr, fontSize: 16, fontWeight: AppFonts.bold),
            CustomInputField(
              label: "",
              hint: "common.add".tr,
              controller: controller.inviteCodeController,
              showCheck: true,
            ),
            const SizedBox(height: 8),
            AppText(
              "claim.inviteCodeHint".tr,
              fontSize: 11,
              color: colors.onSurface.withOpacity(0.6),
            ),

            const SizedBox(height: 24),

            /// 2. Profile Match Card
            ProfileMatchCard(
              isConfirmed: controller.isConfirmed,
              onToggle: () => controller.toggleConfirmation(),
            ),

            const SizedBox(height: 30),

            /// Verify Ownership Section
            AppText("claim.verifyOwnership".tr, fontSize: 18, fontWeight: AppFonts.bold),
            const SizedBox(height: 20),

            // --- EMAIL ID FIELD ---
            CustomInputField(
              label: "auth.emailLabel".tr,
              hint: "claim.emailHint".tr,
              controller: controller.emailController,
              prefixIcon: Icon(Icons.email_outlined, color: colors.primary, size: 22),
            ),

            const SizedBox(height: 20),
            AppText("claim.govId".tr, fontSize: 14, fontWeight: AppFonts.semiBold),
            const SizedBox(height: 12),

            /// 3. Dotted Upload Container
            DottedContainer(
              color: AppColors.orangeColor.withOpacity(0.7),
              borderRadius: 15,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: sh * 0.03),
                decoration: BoxDecoration(
                  color: AppColors.orangeColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.add_a_photo_outlined,
                        color: AppColors.orangeColor,
                        size: 38
                    ),
                    const SizedBox(height: 12),
                    AppText(
                      "claim.addGovId".tr,
                      fontSize: 16,
                      fontWeight: AppFonts.bold,
                      color: colors.onSurface,
                    ),
                    const SizedBox(height: 4),
                    AppText(
                      "gift.uploadSupport".tr,
                      fontSize: 12,
                      color: colors.onSurface.withOpacity(0.7),
                    ),
                    const SizedBox(height: 18),
                    SizedBox(
                      width: 160,
                      height: 44,
                      child: CustomButton(
                        text: "common.upload".tr,
                        onPressed: () {},
                        backgroundColor: AppColors.orangeColor.withOpacity(0.2),
                        foregroundColor: AppColors.orangeColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),

            /// Submit Button
            CustomButton(
              text: "claim.submitClaim".tr,
              onPressed: () => Get.to(()=>const IdentityStatusScreen()),
              backgroundColor: AppColors.orangeColor,
              width: double.infinity,
              height: 52,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}