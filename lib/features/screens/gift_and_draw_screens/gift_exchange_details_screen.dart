// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:kincore_app/features/screens/gift_and_draw_screens/gift_swap_screen.dart';
// import '../../../core/utils/app_fonts.dart';
// import '../../../core/utils/app_colors.dart';
// import '../../../core/widgets/app_text.dart';
// import '../../../core/widgets/custom_input_field.dart';
// import '../../../core/widgets/custom_button.dart';
// import '../memory_screen/widget/dotted_container.dart';
// import 'controller/gift_exchange_details_controller.dart';
//
// class GiftDetailsScreen extends StatelessWidget {
//   const GiftDetailsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(GiftDetailsController());
//     final colors = Theme.of(context).colorScheme;
//     final double w = Get.width;
//     final double h = Get.height;
//
//     return Scaffold(
//       backgroundColor: colors.surface,
//       appBar: AppBar(
//         backgroundColor: colors.surface,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios, color: colors.onSurface, size: 20),
//           onPressed: () => Get.back(),
//         ),
//         title: AppText("gift.exchangeDetails".tr, fontWeight: AppFonts.bold, fontSize: 18),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: 10),
//         child: Column(
//           children: [
//             // --- Input Fields ---
//             CustomInputField(label: "", hint: "gift.senderName".tr, controller: controller.senderNameController, isFiiled: true),
//             const SizedBox(height: 12),
//             CustomInputField(label: "", hint: "gift.receiverName".tr, controller: controller.receiverNameController, isFiiled: true),
//             const SizedBox(height: 12),
//             CustomInputField(label: "", hint: "gift.exchangeName".tr, controller: controller.exchangeNameController, isFiiled: true),
//             const SizedBox(height: 12),
//             CustomInputField(
//                 label: "", hint: "gift.selectDate".tr, controller: controller.dateController,
//                 suffixIcon: IconButton(icon: const Icon(Icons.calendar_month_outlined, size: 22), onPressed: () => controller.selectDate(context)),
//                 isFiiled: true
//             ),
//             const SizedBox(height: 12),
//             CustomInputField(label: "", hint: "gift.budget".tr, controller: controller.budgetController, isFiiled: true),
//             const SizedBox(height: 12),
//             CustomInputField(label: "", hint: "gift.addNote".tr, controller: controller.noteController, maxLines: 4, isFiiled: true),
//
//             const SizedBox(height: 25),
//
//             // --- Updated Dotted Box (Using your DottedContainer) ---
//             DottedContainer(
//               color: AppColors.orangeColor.withOpacity(0.5),
//               borderRadius: 15,
//               child: Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.symmetric(vertical: h * 0.04),
//                 decoration: BoxDecoration(
//                   color: AppColors.orangeColor.withOpacity(0.05),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Column(
//                   children: [
//                     // Agar SVG icon hai toh, nahi toh normal icon bhi laga sakte ho
//                     Icon(Icons.cloud_upload_outlined, color: AppColors.orangeColor, size: 40),
//                     SizedBox(height: h * 0.015),
//                     AppText(
//                       "gift.addGiftPhoto".tr,
//                       fontSize: 18,
//                       fontWeight: AppFonts.medium,
//                       color: colors.onSurface,
//                     ),
//                     AppText(
//                       "gift.uploadSupport".tr,
//                       fontSize: 13,
//                       fontWeight: AppFonts.regular,
//                       color: colors.onSurfaceVariant,
//                     ),
//                     SizedBox(height: h * 0.02),
//
//                     // Small Upload Button like your memory screen
//                     SizedBox(
//                       width: 140,
//                       height: 44,
//                       child: CustomButton(
//                         text: "common.upload".tr,
//                         onPressed: () {
//                           // Placeholder for now
//                         },
//                         backgroundColor: AppColors.orangeColor.withOpacity(0.15),
//                         foregroundColor: AppColors.orangeColor,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//             const SizedBox(height: 30),
//             // CustomButton(text: "gift.sendGift".tr, onPressed: () => controller.sendGift()),
//             CustomButton(text: "gift.sendGift".tr, onPressed: () => Get.to(GiftSwapScreen())),
//             const SizedBox(height: 40),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_input_field.dart';
import '../../../core/widgets/custom_button.dart';
import '../memory_screen/widget/dotted_container.dart';
import 'animated_gift_dashboard_screen.dart';
import 'controller/gift_exchange_details_controller.dart';

class GiftDetailsScreen extends StatelessWidget {
  const GiftDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GiftDetailsController());
    final colors = Theme.of(context).colorScheme;
    final double w = Get.width;
    final double h = Get.height;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        backgroundColor: colors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: colors.onSurface, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText("gift.exchangeDetails".tr, fontWeight: AppFonts.bold, fontSize: 18),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: 10),
        child: Column(
          children: [
            // --- Input Fields ---
            CustomInputField(label: "", hint: "gift.senderName".tr, controller: controller.senderNameController, isFiiled: true),
            const SizedBox(height: 12),
            CustomInputField(label: "", hint: "gift.receiverName".tr, controller: controller.receiverNameController, isFiiled: true),
            const SizedBox(height: 12),
            CustomInputField(label: "", hint: "gift.exchangeName".tr, controller: controller.exchangeNameController, isFiiled: true),
            const SizedBox(height: 12),
            CustomInputField(
                label: "", hint: "gift.selectDate".tr, controller: controller.dateController,
                suffixIcon: IconButton(icon: const Icon(Icons.calendar_month_outlined, size: 22), onPressed: () => controller.selectDate(context)),
                isFiiled: true
            ),
            const SizedBox(height: 12),
            CustomInputField(label: "", hint: "gift.budget".tr, controller: controller.budgetController, isFiiled: true),
            const SizedBox(height: 12),
            CustomInputField(label: "", hint: "gift.addNote".tr, controller: controller.noteController, maxLines: 4, isFiiled: true),

            const SizedBox(height: 25),

            // --- Updated Dotted Box ---
            DottedContainer(
              color: AppColors.orangeColor.withOpacity(0.5),
              borderRadius: 15,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: h * 0.04),
                decoration: BoxDecoration(
                  color: AppColors.orangeColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.cloud_upload_outlined, color: AppColors.orangeColor, size: 40),
                    SizedBox(height: h * 0.015),
                    AppText(
                      "gift.addGiftPhoto".tr,
                      fontSize: 18,
                      fontWeight: AppFonts.medium,
                      color: colors.onSurface,
                    ),
                    AppText(
                      "gift.uploadSupport".tr,
                      fontSize: 13,
                      fontWeight: AppFonts.regular,
                      color: colors.onSurfaceVariant,
                    ),
                    SizedBox(height: h * 0.02),
                    SizedBox(
                      width: 140,
                      height: 44,
                      child: CustomButton(
                        text: "common.upload".tr,
                        onPressed: () {},
                        backgroundColor: AppColors.orangeColor.withOpacity(0.15),
                        foregroundColor: AppColors.orangeColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // --- NEW: Set Restrictions Option ---
            Container(
              decoration: BoxDecoration(
                color: colors.surfaceContainerHighest.withOpacity(0.3),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: colors.outlineVariant.withOpacity(0.5)),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.orangeColor.withOpacity(0.1),
                  child: const Icon(Icons.rule_folder_outlined, color: AppColors.orangeColor),
                ),
                // [FIXED]: Translated Title
                title: AppText('giftSwap.setRestrictions'.tr, fontSize: 14, fontWeight: AppFonts.semiBold, color: colors.onSurface),
                // [FIXED]: Translated Subtitle
                subtitle: AppText('giftSwap.setRestrictionsSub'.tr, fontSize: 12, color: colors.onSurfaceVariant),
                trailing: Icon(Icons.arrow_forward_ios, size: 16, color: colors.onSurfaceVariant),
                onTap: () {
                  // Yahan par restrictions set karne wali screen khulegi
                  Get.snackbar(
                      'giftSwap.restrictionsTitle'.tr,
                      'giftSwap.restrictionsMsg'.tr
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            // --- FIXED: Create Event Button ---
            CustomButton(
              text: 'createEvent.createEventBtn'.tr, // Updated from "Send Gift"
              onPressed: () {
                Get.to(() => const AdminGiftDashboardScreen());
                Get.snackbar(
                    'giftSwap.successTitle'.tr,
                    'giftSwap.createdMsg'.tr
                );
              },
              backgroundColor: AppColors.orangeColor,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}