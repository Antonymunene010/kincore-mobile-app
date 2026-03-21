import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import 'package:kincore_app/features/routes/dashboard_screen.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_button.dart';
import '../memory_screen/widget/dotted_container.dart';
import 'controller/identity_status_controller.dart';
import 'widget/status_header_box.dart';
import 'widget/identity_detail_card.dart';
import 'widget/verification_time_line.dart';

class IdentityStatusScreen extends StatelessWidget {
  const IdentityStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(IdentityStatusController());
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final double sh = Get.height;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        title: AppText("identity.statusTitle".tr, fontSize: 18, fontWeight: AppFonts.semiBold),
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
            /// 1. Hourglass Status Header
            const StatusHeaderBox(),

            const SizedBox(height: 20),

            /// 2. Identity Detail Card (With Date & Relationship)
            const IdentityDetailCard(),

            const SizedBox(height: 25),

            /// 3. Vertical Progress Timeline
            const VerificationTimeline(),

            const SizedBox(height: 30),
            AppText("identity.addProof".tr, fontSize: 14, fontWeight: AppFonts.semiBold),
            const SizedBox(height: 12),

            /// 4. Dotted Container (Same as before)
            DottedContainer(
              color: AppColors.orangeColor.withOpacity(0.7),
              borderRadius: 15,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: sh * 0.035),
                decoration: BoxDecoration(
                  color: AppColors.orangeColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.add_a_photo_outlined, color: AppColors.orangeColor, size: 38),
                    const SizedBox(height: 12),
                    AppText("identity.addProofPhoto".tr, fontSize: 16, fontWeight: AppFonts.bold),
                    AppText("gift.uploadSupport".tr, fontSize: 12, color: colors.onSurface.withOpacity(0.6)),
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

            const SizedBox(height: 30),
            CustomButton(
              text: "identity.backToProfile".tr,
              onPressed: () => Get.to(DashboardScreen()),
              backgroundColor: AppColors.orangeColor,
              width: double.infinity,
              height: 52,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
