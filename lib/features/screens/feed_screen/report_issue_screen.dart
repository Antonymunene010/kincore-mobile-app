// // // import 'package:flutter/material.dart';
// // // import 'package:get/get.dart';
// // // import '../../../../core/utils/app_colors.dart';
// // // import '../../../../core/utils/app_fonts.dart';
// // // import '../../../../core/utils/app_text.dart';
// // // import '../../../../core/widgets/custom_button.dart';
// // // import 'widget/setting_selection_tile.dart';
// // //
// // //
// // // class ReportIssueScreen extends StatelessWidget {
// // //   const ReportIssueScreen({super.key});
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     // Agar report ke liye alag logic chahiye toh naya controller put karna
// // //     final double screenW = Get.width;
// // //     final double screenH = Get.height;
// // //
// // //     // Local state for UI testing (Ideally move this to a Controller)
// // //     RxString selectedReason = "It’s Spam".obs;
// // //
// // //     return Scaffold(
// // //       backgroundColor: AppColors.whiteColor,
// // //       appBar: AppBar(
// // //         backgroundColor: AppColors.whiteColor,
// // //         elevation: 0,
// // //         surfaceTintColor: Colors.transparent,
// // //         leading: IconButton(
// // //           icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
// // //           onPressed: () => Get.back(),
// // //         ),
// // //         title: AppText("Report Issue", fontSize: 20, fontWeight: AppFonts.semiBold),
// // //       ),
// // //       body: SingleChildScrollView(
// // //         padding: EdgeInsets.all(screenW * 0.05),
// // //         child: Column(
// // //           children: [
// // //             // --- MAIN OUTER BOX ---
// // //             Container(
// // //               width: double.infinity,
// // //               padding: EdgeInsets.all(screenW * 0.05),
// // //               decoration: BoxDecoration(
// // //                 borderRadius: BorderRadius.circular(20),
// // //                 border: Border.all(color: Colors.grey.shade200, width: 1.5),
// // //               ),
// // //               child: Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 children: [
// // //                   AppText("Report Issue", fontSize: 24, fontWeight: AppFonts.medium),
// // //                   SizedBox(height: screenH * 0.01),
// // //                   AppText(
// // //                     "You Report Is Anonymous. Help Us Keep The Family Tree Community Safe By Telling Us What’s Happening.",
// // //                     fontSize: 12,
// // //                     fontWeight: AppFonts.medium,
// // //                     color: AppColors.blackColor,
// // //                   ),
// // //                   SizedBox(height: screenH * 0.03),
// // //
// // //                   // --- OPTIONS USING SAME TILE ---
// // //                   Obx(() => Column(
// // //                     children: [
// // //                       _buildSimpleTile("It’s Spam", selectedReason),
// // //                       _buildSimpleTile("Nudity Or Sexual Activity", selectedReason),
// // //                       _buildSimpleTile("Hate Speech Or Symbols", selectedReason),
// // //                       _buildSimpleTile("False Information", selectedReason),
// // //                       _buildSimpleTile("Harassment Or Bullying", selectedReason),
// // //                       _buildSimpleTile("Something Else", selectedReason),
// // //                     ],
// // //                   )),
// // //
// // //                   SizedBox(height: screenH * 0.02),
// // //                   AppText("Additional Detail(Optional)", fontWeight: AppFonts.medium, fontSize: 15),
// // //                   SizedBox(height: screenH * 0.01),
// // //
// // //                   // --- CUSTOM TEXTFIELD (INNER FIELD STYLE) ---
// // //                   Container(
// // //                     padding: const EdgeInsets.symmetric(horizontal: 12),
// // //                     decoration: BoxDecoration(
// // //                       borderRadius: BorderRadius.circular(12),
// // //                       border: Border.all(color: Colors.grey.shade300),
// // //                     ),
// // //                     child: const TextField(
// // //                       maxLines: 5,
// // //                       decoration: InputDecoration(
// // //                         hintText: "Please Describe The Issue to Help Our Review",
// // //                         hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
// // //                         border: InputBorder.none,
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //
// // //             SizedBox(height: screenH * 0.04),
// // //
// // //             // --- BUTTONS ---
// // //             CustomButton(text: "Submit Report", onPressed: () => Get.back()),
// // //             SizedBox(height: screenH * 0.015),
// // //             CustomButton(text: "Cancel", onPressed: (){},
// // //             backgroundColor: Colors.transparent,
// // //             borderColor: AppColors.orangeColor,
// // //             foregroundColor: AppColors.orangeColor,),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // //
// // //   // Helper to build tile without icon (as per Report Image)
// // //   Widget _buildSimpleTile(String title, RxString selected) {
// // //     return SettingSelectionTile(
// // //       title: title,
// // //       isSelected: selected.value == title,
// // //       onTap: () => selected.value = title,
// // //     );
// // //   }
// // // }
// //
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import '../../../../core/utils/app_colors.dart';
// // import '../../../../core/utils/app_fonts.dart';
// // import '../../../core/widgets/app_text.dart';
// // import '../../../../core/widgets/custom_button.dart';
// // import 'widget/setting_selection_tile.dart';
// //
// // class ReportIssueScreen extends StatelessWidget {
// //   const ReportIssueScreen({super.key});
// //
// //   // Latest Confirmation Dialog (Fixed Overflow)
// //   void _showCancelDialog() {
// //     Get.defaultDialog(
// //       title: "",
// //       titlePadding: EdgeInsets.zero,
// //       contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
// //       radius: 20,
// //       backgroundColor: AppColors.whiteColor,
// //       content: Column(
// //         mainAxisSize: MainAxisSize.min,
// //         children: [
// //           // Top Circle Icon
// //           Container(
// //             padding: const EdgeInsets.all(12),
// //             decoration: BoxDecoration(
// //               color: AppColors.orangeColor.withOpacity(0.1),
// //               shape: BoxShape.circle,
// //             ),
// //             child: Icon(Icons.info_rounded, color: AppColors.orangeColor, size: 35),
// //           ),
// //           const SizedBox(height: 15),
// //           // Heading
// //           AppText("Discard Report?", fontSize: 18, fontWeight: AppFonts.semiBold),
// //           const SizedBox(height: 10),
// //           // Message
// //           AppText(
// //             "Are you sure you want to cancel this report? Your progress will be lost.",
// //             fontSize: 13,
// //             textAlign: TextAlign.center,
// //             color: Colors.grey.shade600,
// //           ),
// //           const SizedBox(height: 20),
// //           // Buttons Row with Expanded to prevent overflow
// //           Row(
// //             children: [
// //               Expanded(
// //                 child: CustomButton(
// //                   text: "No, Stay",
// //                   height: 40,
// //                   fontSize: 12, // Reduced font to prevent overflow
// //                   backgroundColor: Colors.grey.shade200,
// //                   foregroundColor: AppColors.blackColor,
// //                   onPressed: () => Get.back(),
// //                 ),
// //               ),
// //               const SizedBox(width: 10),
// //               Expanded(
// //                 child: CustomButton(
// //                   text: "Yes, Discard",
// //                   height: 40,
// //                   fontSize: 12,
// //                   onPressed: () {
// //                     Get.back(); // Dialog close
// //                     Get.back(); // Screen close
// //                   },
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final double screenW = Get.width;
// //     final double screenH = Get.height;
// //
// //     // Reactive state for selection
// //     RxString selectedReason = "It’s Spam".obs;
// //
// //     return Scaffold(
// //       backgroundColor: AppColors.whiteColor,
// //       appBar: AppBar(
// //         backgroundColor: AppColors.whiteColor,
// //         elevation: 0,
// //         surfaceTintColor: Colors.transparent,
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
// //           onPressed: () => Get.back(),
// //         ),
// //         title: AppText("Report Issue", fontSize: 20, fontWeight: AppFonts.semiBold),
// //       ),
// //       body: SingleChildScrollView(
// //         padding: EdgeInsets.all(screenW * 0.05),
// //         child: Column(
// //           children: [
// //             // --- MAIN OUTER BOX ---
// //             Container(
// //               width: double.infinity,
// //               padding: EdgeInsets.all(screenW * 0.05),
// //               decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.circular(20),
// //                 border: Border.all(color: Colors.grey.shade200, width: 1.5),
// //               ),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   AppText("Report Issue", fontSize: 24, fontWeight: AppFonts.medium),
// //                   SizedBox(height: screenH * 0.01),
// //                   AppText(
// //                     "You Report Is Anonymous. Help Us Keep The Family Tree Community Safe By Telling Us What’s Happening.",
// //                     fontSize: 12,
// //                     fontWeight: AppFonts.medium,
// //                     color: AppColors.blackColor,
// //                   ),
// //                   SizedBox(height: screenH * 0.03),
// //
// //                   // --- OPTIONS USING REUSABLE TILE ---
// //                   Obx(() => Column(
// //                     children: [
// //                       _buildSimpleTile("It’s Spam", selectedReason),
// //                       _buildSimpleTile("Nudity Or Sexual Activity", selectedReason),
// //                       _buildSimpleTile("Hate Speech Or Symbols", selectedReason),
// //                       _buildSimpleTile("False Information", selectedReason),
// //                       _buildSimpleTile("Harassment Or Bullying", selectedReason),
// //                       _buildSimpleTile("Something Else", selectedReason),
// //                     ],
// //                   )),
// //
// //                   SizedBox(height: screenH * 0.02),
// //                   AppText("Additional Detail(Optional)", fontWeight: AppFonts.medium, fontSize: 15),
// //                   SizedBox(height: screenH * 0.01),
// //
// //                   // --- TEXTFIELD FOR DETAILS ---
// //                   Container(
// //                     padding: const EdgeInsets.symmetric(horizontal: 12),
// //                     decoration: BoxDecoration(
// //                       borderRadius: BorderRadius.circular(12),
// //                       border: Border.all(color: Colors.grey.shade300),
// //                     ),
// //                     child: const TextField(
// //                       maxLines: 4,
// //                       decoration: InputDecoration(
// //                         hintText: "Please Describe The Issue to Help Our Review",
// //                         hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
// //                         border: InputBorder.none,
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //
// //             SizedBox(height: screenH * 0.04),
// //
// //             // --- ACTION BUTTONS ---
// //             CustomButton(
// //                 text: "Submit Report",
// //                 onPressed: () {
// //                   Get.back();
// //                   Get.snackbar("Success", "Thank you for reporting.");
// //                 }
// //             ),
// //             SizedBox(height: screenH * 0.015),
// //
// //             // Cancel Button with Dialog
// //             CustomButton(
// //               text: "Cancel",
// //               onPressed: _showCancelDialog,
// //               backgroundColor: Colors.transparent,
// //               borderColor: AppColors.orangeColor,
// //               foregroundColor: AppColors.orangeColor,
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   // Build tile logic (passing null for icon as requested)
// //   Widget _buildSimpleTile(String title, RxString selected) {
// //     return SettingSelectionTile(
// //       title: title,
// //       isSelected: selected.value == title,
// //       onTap: () => selected.value = title,
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../core/utils/app_fonts.dart';
// import '../../../core/utils/app_colors.dart';
// import '../../../core/widgets/app_text.dart';
// import '../../../../core/widgets/custom_button.dart';
// import 'widget/setting_selection_tile.dart';
//
// class ReportIssueScreen extends StatelessWidget {
//   const ReportIssueScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final double screenW = Get.width;
//     final double screenH = Get.height;
//
//     // Reactive state for selection
//     RxString selectedReason = "report.spam".obs;
//
//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       appBar: AppBar(
//         backgroundColor: AppColors.whiteColor,
//         elevation: 0,
//         surfaceTintColor: Colors.transparent,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
//           onPressed: () => Get.back(),
//         ),
//         title: AppText("report.title".tr, fontSize: 20, fontWeight: AppFonts.semiBold),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(screenW * 0.05),
//         child: Column(
//           children: [
//             // --- MAIN OUTER BOX ---
//             Container(
//               width: double.infinity,
//               padding: EdgeInsets.all(screenW * 0.05),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(color: Colors.grey.shade200, width: 1.5),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   AppText("report.title".tr, fontSize: 24, fontWeight: AppFonts.medium),
//                   SizedBox(height: screenH * 0.01),
//                   AppText(
//                     "report.anonymousHelp".tr,
//                     fontSize: 12,
//                     fontWeight: AppFonts.medium,
//                     color: AppColors.blackColor,
//                   ),
//                   SizedBox(height: screenH * 0.03),
//
//                   // --- OPTIONS USING REUSABLE TILE ---
//                   Obx(() => Column(
//                     children: [
//                       _buildSimpleTile("report.spam".tr, selectedReason),
//                       _buildSimpleTile("report.nudity".tr, selectedReason),
//                       _buildSimpleTile("report.hateSpeech".tr, selectedReason),
//                       _buildSimpleTile("report.falseInfo".tr, selectedReason),
//                       _buildSimpleTile("report.harassment".tr, selectedReason),
//                       _buildSimpleTile("report.other".tr, selectedReason),
//                     ],
//                   )),
//
//                   SizedBox(height: screenH * 0.02),
//                   AppText("report.additionalDetails".tr, fontWeight: AppFonts.medium, fontSize: 15),
//                   SizedBox(height: screenH * 0.01),
//
//                   // --- TEXTFIELD FOR DETAILS ---
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 12),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(color: Colors.grey.shade300),
//                     ),
//                     child: TextField(
//                       maxLines: 4,
//                       decoration: InputDecoration(
//                         hintText: "report.describeIssue".tr,
//                         hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             SizedBox(height: screenH * 0.04),
//
//             // --- ACTION BUTTONS ---
//             CustomButton(
//                 text: "report.submitReport".tr,
//                 onPressed: () {
//                   Get.back();
//                 }),
//             SizedBox(height: screenH * 0.015),
//             CustomButton(
//               text: "common.cancel".tr,
//               onPressed: ()=>_showCancelDialog(context),
//               backgroundColor: Colors.transparent,
//               borderColor: AppColors.orangeColor,
//               foregroundColor: AppColors.orangeColor,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Helper to build tile without icon
//   Widget _buildSimpleTile(String title, RxString selected) {
//     return SettingSelectionTile(
//       title: title,
//       isSelected: selected.value == title,
//       onTap: () => selected.value = title,
//     );
//   }
//   // Dialog placeholder
//   void _showCancelDialog(BuildContext context) {
//     final colors = Theme.of(context).colorScheme;
//     Get.defaultDialog(
//         backgroundColor: colors.surface,
//         title: "Discard?",
//         middleText: "Are you sure?",
//         textConfirm: "Yes",
//         textCancel: "No",
//         confirmTextColor: Colors.white,
//         onConfirm: () {
//           Get.back();
//           Get.back();
//         }
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_button.dart';
import 'widget/setting_selection_tile.dart';

class ReportIssueScreen extends StatelessWidget {
  const ReportIssueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenW = Get.width;
    final double screenH = Get.height;

    // Theme setup
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    // Reactive state for selection
    RxString selectedReason = "report.spam".tr.obs;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : colors.surface,
      appBar: AppBar(
        backgroundColor: isDark ? Colors.black : colors.surface,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: colors.onSurface, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText("report.title".tr, fontSize: 20, fontWeight: AppFonts.semiBold, color: colors.onSurface),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenW * 0.05),
        child: Column(
          children: [
            // --- MAIN OUTER BOX ---
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(screenW * 0.05),
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: colors.outlineVariant.withOpacity(0.5), width: 1.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText("report.title".tr, fontSize: 24, fontWeight: AppFonts.medium, color: colors.onSurface),
                  SizedBox(height: screenH * 0.01),
                  AppText(
                    "report.anonymousHelp".tr,
                    fontSize: 12,
                    fontWeight: AppFonts.medium,
                    color: colors.onSurfaceVariant,
                  ),
                  SizedBox(height: screenH * 0.03),

                  // --- OPTIONS USING REUSABLE TILE ---
                  Obx(() => Column(
                    children: [
                      _buildSimpleTile("report.spam".tr, selectedReason),
                      _buildSimpleTile("report.nudity".tr, selectedReason),
                      _buildSimpleTile("report.hateSpeech".tr, selectedReason),
                      _buildSimpleTile("report.falseInfo".tr, selectedReason),
                      _buildSimpleTile("report.harassment".tr, selectedReason),
                      _buildSimpleTile("report.other".tr, selectedReason),
                    ],
                  )),

                  SizedBox(height: screenH * 0.02),
                  AppText("report.additionalDetails".tr, fontWeight: AppFonts.medium, fontSize: 15, color: colors.onSurface),
                  SizedBox(height: screenH * 0.01),

                  // --- TEXTFIELD FOR DETAILS ---
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: isDark ? colors.surfaceContainerHighest.withOpacity(0.3) : colors.surface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: colors.outlineVariant.withOpacity(0.5)),
                    ),
                    child: TextField(
                      maxLines: 4,
                      style: TextStyle(color: colors.onSurface, fontSize: 14),
                      decoration: InputDecoration(
                        hintText: "report.describeIssue".tr,
                        hintStyle: TextStyle(color: colors.onSurfaceVariant, fontSize: 13),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: screenH * 0.04),

            // --- ACTION BUTTONS ---
            CustomButton(
              text: "report.submitReport".tr,
              onPressed: () {
                // 1. Pehle screen/dialog ko close karein
                Get.back();

                // 2. Fir success ka snackbar dikhayein
                Get.snackbar(
                  "Success",
                  "Your report has been submitted successfully.",
                  backgroundColor: Colors.green.withOpacity(0.1),
                  colorText: Colors.green, // Green text
                  margin: const EdgeInsets.all(15),
                  duration: const Duration(seconds: 2),
                );
              },
            ),
            SizedBox(height: screenH * 0.015),

            // --- FIXED CANCEL BUTTON ---
            CustomButton(
              text: "common.cancel".tr,
              onPressed: () => Get.back(),
              backgroundColor: colors.surface,
              textColor: isDark ? Colors.white : Colors.black, // dark = white, light = black
              borderColor: AppColors.orangeColor,
            ),
          ],
        ),
      ),
    );
  }

  // Helper to build tile without icon
  Widget _buildSimpleTile(String title, RxString selected) {
    return SettingSelectionTile(
      title: title,
      isSelected: selected.value == title,
      onTap: () => selected.value = title,
    );
  }
}