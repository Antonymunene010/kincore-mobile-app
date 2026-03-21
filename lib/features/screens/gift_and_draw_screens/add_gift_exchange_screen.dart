// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:kincore_app/features/screens/gift_and_draw_screens/gift_swap_screen.dart';
// // import '../../../core/utils/app_fonts.dart';
// // import '../../../core/utils/app_colors.dart';
// // import '../../../core/widgets/app_text.dart';
// // import '../../../core/widgets/custom_input_field.dart';
// // import '../../../core/widgets/custom_button.dart';
// // import 'controller/gift_exchange_controller.dart';
// //
// // class AddGiftExchangeScreen extends StatelessWidget {
// //   const AddGiftExchangeScreen({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final controller = Get.put(GiftExchangeController());
// //     final colors = Theme.of(context).colorScheme;
// //     final double w = Get.width;
// //     final double h = Get.height;
// //
// //     return Scaffold(
// //       backgroundColor: colors.surface,
// //       appBar: AppBar(
// //         backgroundColor: colors.surface,
// //         elevation: 0,
// //         leading: IconButton(
// //           icon: Icon(Icons.arrow_back_ios_new, color: colors.onSurface, size: 20),
// //           onPressed: () => Get.back(),
// //         ),
// //         title: AppText("gift.addGiftExchange".tr, fontWeight: AppFonts.bold, fontSize: 18),
// //       ),
// //       body: SingleChildScrollView(
// //         padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: 10),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             // Passing colors.onSurface to handle light/dark mode
// //             sectionTitle("gift.eventDetails".tr, colors.onSurface),
// //             CustomInputField(label: "", hint: "gift.eventName".tr, controller: controller.eventNameController, isFiiled: true),
// //             const SizedBox(height: 12),
// //             CustomInputField(label: "", hint: "gift.festivalType".tr, controller: controller.festivalTypeController, isFiiled: true),
// //             const SizedBox(height: 12),
// //             CustomInputField(label: "", hint: "gift.description".tr, controller: controller.descriptionController, maxLines: 3, isFiiled: true),
// //             const SizedBox(height: 12),
// //             CustomInputField(label: "", hint: "gift.scope".tr, controller: controller.scopeController, isFiiled: true),
// //
// //             const SizedBox(height: 30),
// //             sectionTitle("gift.deadlines".tr, colors.onSurface),
// //
// //             CustomInputField(
// //                 label: "", hint: "gift.signupDeadline".tr, controller: controller.signupDeadlineController,
// //                 suffixIcon: IconButton(icon: const Icon(Icons.calendar_today, size: 20), onPressed: () => controller.selectDate(context, controller.signupDeadlineController)),
// //                 isFiiled: true
// //             ),
// //             const SizedBox(height: 12),
// //             CustomInputField(
// //                 label: "", hint: "gift.drawDeadline".tr, controller: controller.drawDeadlineController,
// //                 suffixIcon: IconButton(icon: const Icon(Icons.shuffle, size: 20), onPressed: () => controller.selectDate(context, controller.drawDeadlineController)),
// //                 isFiiled: true
// //             ),
// //             const SizedBox(height: 12),
// //             CustomInputField(
// //                 label: "", hint: "gift.giftDeadline".tr, controller: controller.giftDeadlineController,
// //                 suffixIcon: IconButton(icon: const Icon(Icons.event_available, size: 20), onPressed: () => controller.selectDate(context, controller.giftDeadlineController)),
// //                 isFiiled: true
// //             ),
// //
// //             const SizedBox(height: 30),
// //             sectionTitle("gift.budgetPreference".tr, colors.onSurface),
// //
// //             Obx(() => AppText("gift.budgetRange".trParams({'value': controller.budgetValue.value.toInt().toString()}), fontSize: 14, fontWeight: AppFonts.medium)),
// //
// //             Obx(() => Slider(
// //               value: controller.budgetValue.value,
// //               min: 100, max: 1000, divisions: 18,
// //               activeColor: AppColors.orangeColor,
// //               onChanged: (val) => controller.budgetValue.value = val,
// //             )),
// //
// //             const SizedBox(height: 20),
// //             CustomInputField(label: "", hint: "gift.preferredGiftType".tr, controller: controller.giftTypeController, isFiiled: true),
// //
// //             Container(
// //               margin: const EdgeInsets.only(top: 20),
// //               padding: const EdgeInsets.all(16),
// //               decoration: BoxDecoration(
// //                 color: colors.surface,
// //                 borderRadius: BorderRadius.circular(18),
// //                 border: Border.all(color: colors.outlineVariant.withOpacity(0.6)),
// //               ),
// //               child: Row(
// //                 children: [
// //                   Expanded(
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         AppText("gift.anonymity".tr, fontSize: 15, fontWeight: AppFonts.bold),
// //                         AppText("gift.anonymitySub".tr, fontSize: 12, color: colors.onSurfaceVariant),
// //                       ],
// //                     ),
// //                   ),
// //                   Obx(() => Switch(
// //                     value: controller.isAnonymous.value,
// //                     activeTrackColor: AppColors.orangeColor,
// //                     onChanged: (val) => controller.isAnonymous.value = val,
// //                   )),
// //                 ],
// //               ),
// //             ),
// //
// //             const SizedBox(height: 40),
// //             CustomButton(text: "gift.createExchange".tr, onPressed: () {Get.to(const GiftSwapScreen());}),
// //             const SizedBox(height: 40),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   // Helper function with titleColor parameter
// //   Widget sectionTitle(String text, Color titleColor) {
// //     return Padding(
// //       padding: const EdgeInsets.only(bottom: 12),
// //       child: AppText(
// //         text,
// //         fontSize: 17,
// //         fontWeight: AppFonts.bold,
// //         color: titleColor,
// //       ),
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kincore_app/features/screens/gift_and_draw_screens/gift_exchange_details_screen.dart';
// import 'package:kincore_app/features/screens/gift_and_draw_screens/gift_swap_screen.dart';
// import '../../../core/utils/app_fonts.dart';
// import '../../../core/utils/app_colors.dart';
// import '../../../core/widgets/app_text.dart';
// import '../../../core/widgets/custom_input_field.dart';
// import '../../../core/widgets/custom_button.dart';
// import 'controller/gift_exchange_controller.dart';
//
// class AddGiftExchangeScreen extends StatelessWidget {
//   const AddGiftExchangeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(GiftExchangeController());
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
//           icon: Icon(Icons.arrow_back_ios_new, color: colors.onSurface, size: 20),
//           onPressed: () => Get.back(),
//         ),
//         title: AppText("gift.addGiftExchange".tr, fontWeight: AppFonts.bold, fontSize: 18),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             sectionTitle("gift.eventDetails".tr, colors.onSurface),
//             CustomInputField(label: "", hint: "gift.eventName".tr, controller: controller.eventNameController, isFiiled: true),
//             const SizedBox(height: 12),
//             CustomInputField(label: "", hint: "gift.festivalType".tr, controller: controller.festivalTypeController, isFiiled: true),
//             const SizedBox(height: 12),
//             CustomInputField(label: "", hint: "gift.description".tr, controller: controller.descriptionController, maxLines: 3, isFiiled: true),
//             const SizedBox(height: 12),
//             CustomInputField(label: "", hint: "gift.scope".tr, controller: controller.scopeController, isFiiled: true),
//
//             const SizedBox(height: 30),
//             sectionTitle("gift.deadlines".tr, colors.onSurface),
//
//             // --- Signup Deadline Field ---
//             GestureDetector(
//               onTap: () => controller.selectDate(context, controller.signupDeadlineController),
//               child: AbsorbPointer( // Prevents keyboard from opening
//                 child: CustomInputField(
//                     label: "",
//                     hint: "gift.signupDeadline".tr,
//                     controller: controller.signupDeadlineController,
//                     suffixIcon: const Icon(Icons.calendar_today, size: 20),
//                     isFiiled: true
//                 ),
//               ),
//             ),
//             const SizedBox(height: 12),
//
//             // --- Draw Deadline Field ---
//             GestureDetector(
//               onTap: () => controller.selectDate(context, controller.drawDeadlineController),
//               child: AbsorbPointer(
//                 child: CustomInputField(
//                     label: "",
//                     hint: "gift.drawDeadline".tr,
//                     controller: controller.drawDeadlineController,
//                     suffixIcon: const Icon(Icons.shuffle, size: 20),
//                     isFiiled: true
//                 ),
//               ),
//             ),
//             const SizedBox(height: 12),
//
//             // --- Gift Deadline Field ---
//             GestureDetector(
//               onTap: () => controller.selectDate(context, controller.giftDeadlineController),
//               child: AbsorbPointer(
//                 child: CustomInputField(
//                     label: "",
//                     hint: "gift.giftDeadline".tr,
//                     controller: controller.giftDeadlineController,
//                     suffixIcon: const Icon(Icons.event_available, size: 20),
//                     isFiiled: true
//                 ),
//               ),
//             ),
//
//             const SizedBox(height: 30),
//             sectionTitle("gift.budgetPreference".tr, colors.onSurface),
//
//             Obx(() => AppText("gift.budgetRange".trParams({'value': controller.budgetValue.value.toInt().toString()}), fontSize: 14, fontWeight: AppFonts.medium)),
//
//             Obx(() => Slider(
//               value: controller.budgetValue.value,
//               min: 100, max: 1000, divisions: 18,
//               activeColor: AppColors.orangeColor,
//               onChanged: (val) => controller.budgetValue.value = val,
//             )),
//
//             const SizedBox(height: 20),
//             CustomInputField(label: "", hint: "gift.preferredGiftType".tr, controller: controller.giftTypeController, isFiiled: true),
//
//             Container(
//               margin: const EdgeInsets.only(top: 20),
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: colors.surface,
//                 borderRadius: BorderRadius.circular(18),
//                 border: Border.all(color: colors.outlineVariant.withOpacity(0.6)),
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         AppText("gift.anonymity".tr, fontSize: 15, fontWeight: AppFonts.bold),
//                         AppText("gift.anonymitySub".tr, fontSize: 12, color: colors.onSurfaceVariant),
//                       ],
//                     ),
//                   ),
//                   Obx(() => Switch(
//                     value: controller.isAnonymous.value,
//                     activeTrackColor: AppColors.orangeColor,
//                     onChanged: (val) => controller.isAnonymous.value = val,
//                   )),
//                 ],
//               ),
//             ),
//
//             const SizedBox(height: 40),
//             CustomButton(text: "gift.createExchange".tr, onPressed: () {Get.to(const GiftDetailsScreen());}),
//             const SizedBox(height: 40),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget sectionTitle(String text, Color titleColor) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12),
//       child: AppText(
//         text,
//         fontSize: 17,
//         fontWeight: AppFonts.bold,
//         color: titleColor,
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
import 'animated_gift_dashboard_screen.dart'; // Aapka admin dashboard
import 'controller/gift_exchange_controller.dart';

class AddGiftExchangeScreen extends StatelessWidget {
  const AddGiftExchangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GiftExchangeController());
    final colors = Theme.of(context).colorScheme;
    final double w = Get.width;
    // final double h = Get.height; // Height ki abhi yahan direct zarurat nahi

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        backgroundColor: colors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: colors.onSurface, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText("gift.addGiftExchange".tr, fontWeight: AppFonts.bold, fontSize: 18),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Note: Event Name, Description aur Photo hata diye gaye hain kyunki wo
            // Create Event screen par pehle hi pooch liye gaye hain.

            // ==========================================
            // 1. EXCHANGE DEADLINES
            // ==========================================
            sectionTitle("gift.deadlines".tr, colors.onSurface),

            GestureDetector(
              onTap: () => controller.selectDate(context, controller.signupDeadlineController),
              child: AbsorbPointer(
                child: CustomInputField(
                    label: "",
                    hint: "gift.signupDeadline".tr,
                    controller: controller.signupDeadlineController,
                    suffixIcon: const Icon(Icons.calendar_today, size: 20, color: AppColors.orangeColor),
                    isFiiled: true
                ),
              ),
            ),
            const SizedBox(height: 12),

            GestureDetector(
              onTap: () => controller.selectDate(context, controller.drawDeadlineController),
              child: AbsorbPointer(
                child: CustomInputField(
                    label: "",
                    hint: "gift.drawDeadline".tr,
                    controller: controller.drawDeadlineController,
                    suffixIcon: const Icon(Icons.shuffle, size: 20, color: AppColors.orangeColor),
                    isFiiled: true
                ),
              ),
            ),
            const SizedBox(height: 12),

            GestureDetector(
              onTap: () => controller.selectDate(context, controller.giftDeadlineController),
              child: AbsorbPointer(
                child: CustomInputField(
                    label: "",
                    hint: "gift.giftDeadline".tr,
                    controller: controller.giftDeadlineController,
                    suffixIcon: const Icon(Icons.event_available, size: 20, color: AppColors.orangeColor),
                    isFiiled: true
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==========================================
            // 2. BUDGET & RULES
            // ==========================================
            sectionTitle("gift.budgetPreference".tr, colors.onSurface),

            // USD Currency Format
            Obx(() => AppText(
              "Budget: USD \$${controller.budgetValue.value.toInt()}",
              fontSize: 16,
              fontWeight: AppFonts.bold,
              color: AppColors.orangeColor,
            )),

            Obx(() => Slider(
              value: controller.budgetValue.value,
              min: 10, max: 1000, divisions: 99,
              activeColor: AppColors.orangeColor,
              onChanged: (val) => controller.budgetValue.value = val,
            )),

            const SizedBox(height: 10),
            CustomInputField(
                label: "",
                hint: "gift.preferredGiftType".tr,
                controller: controller.giftTypeController,
                isFiiled: true
            ),

            const SizedBox(height: 20),

            // Anonymity Switch
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                  color: colors.surface,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: colors.outlineVariant.withOpacity(0.6))
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText("gift.anonymity".tr, fontSize: 15, fontWeight: AppFonts.bold),
                        AppText("gift.anonymitySub".tr, fontSize: 12, color: colors.onSurfaceVariant),
                      ],
                    ),
                  ),
                  Obx(() => Switch(
                      value: controller.isAnonymous.value,
                      activeTrackColor: colors.primary.withOpacity(0.2),
                      activeColor: AppColors.orangeColor,
                      onChanged: (val) => controller.isAnonymous.value = val
                  )),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // Set Restrictions
            Container(
              decoration: BoxDecoration(
                  color: colors.surfaceContainerHighest.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: colors.outlineVariant.withOpacity(0.5))
              ),
              child: ListTile(
                leading: CircleAvatar(
                    backgroundColor: AppColors.orangeColor.withOpacity(0.1),
                    child: const Icon(Icons.rule_folder_outlined, color: AppColors.orangeColor)
                ),
                title: AppText('giftSwap.setRestrictions'.tr, fontSize: 14, fontWeight: AppFonts.semiBold, color: colors.onSurface),
                subtitle: AppText('giftSwap.setRestrictionsSub'.tr, fontSize: 12, color: colors.onSurfaceVariant),
                trailing: Icon(Icons.arrow_forward_ios, size: 16, color: colors.onSurfaceVariant),
                onTap: () {
                  Get.snackbar('giftSwap.restrictionsTitle'.tr, 'giftSwap.restrictionsMsg'.tr);
                },
              ),
            ),

            const SizedBox(height: 40),

            // ==========================================
            // 3. FINALIZE BUTTON
            // ==========================================
            CustomButton(
              text: 'createEvent.createEventBtn'.tr,
              backgroundColor: AppColors.orangeColor,
              onPressed: () {
                // Navigate to Dashboard
                Get.to(() => const AdminGiftDashboardScreen());
                Get.snackbar('giftSwap.successTitle'.tr, 'giftSwap.createdMsg'.tr);
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String text, Color titleColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: AppText(
        text,
        fontSize: 17,
        fontWeight: AppFonts.bold,
        color: titleColor,
      ),
    );
  }
}