// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'package:kincore_app/core/utils/app_images_const.dart';
// import 'package:kincore_app/core/utils/fetch_pixels.dart';
// import 'package:kincore_app/features/screens/language_selection_screen/language_selection_screen.dart';
//
// import '../../../core/utils/app_colors.dart';
// import '../../../core/utils/app_fonts.dart';
// import '../../../core/widgets/app_text.dart';
// import '../../../core/widgets/custom_button.dart';
// import '../../../core/widgets/custom_widgets.dart';
// import '../../../core/widgets/soft_gradient_bg.dart';
//
// class OnboardingScreen extends StatelessWidget {
//   const OnboardingScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     FetchPixels(); // ✅ VERY IMPORTANT
//
//     return Scaffold(
//       body: SoftGradientBackground(
//         enableBlur: true,
//         child: SafeArea(
//           child: SingleChildScrollView( // ✅ overflow fix
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
//               child: Column(
//                 children: [
//                   SizedBox(height: FetchPixels.h(40)),
//
//                   CustomAssetImage(
//                     imageName: AppImagesConst.kincoreLogo,
//                     height: FetchPixels.h(150),
//                     width: FetchPixels.w(150),
//                   ),
//
//                   const SizedBox(height: 10),
//
//                   AppText(
//                     "Kincore",
//                     fontSize: 36,
//                     fontWeight: AppFonts.bold,
//                     gradient: LinearGradient(
//                       colors: [
//                         AppColors.primaryColor,
//                         AppColors.yellowColor
//                       ],
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                     ),
//                   ),
//
//                   SizedBox(height: FetchPixels.h(40)),
//
//                   CustomAssetImage(
//                     imageName: AppImagesConst.familyImage,
//                     width: double.infinity,
//                     fit: BoxFit.contain,
//                     height: FetchPixels.h(300),
//                   ),
//
//                   SizedBox(height: FetchPixels.h(40)),
//
//                   RichText(
//                     textAlign: TextAlign.center,
//                     text: TextSpan(
//                       style: const TextStyle(
//                         fontSize: 20,
//                         fontWeight: AppFonts.semiBold,
//                         color: Colors.black,
//                         fontFamily: AppFonts.poppins,
//                       ),
//                       children: [
//                         const TextSpan(text: "Connect to your \n"),
//                         TextSpan(
//                           text: "Roots!",
//                           style: TextStyle(
//                             color: AppColors.orangeColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   const SizedBox(height: 15),
//
//                   const AppText(
//                     "Build a detailed family tree and keep your heritage alive for future generations.",
//                     fontSize: 13,
//                     textAlign: TextAlign.center,
//                     color: Colors.black,
//                     fontWeight: FontWeight.w500,
//                   ),
//
//                   SizedBox(height: FetchPixels.h(40)),
//
//                   CustomButton(
//                     text: 'Get Started',
//                     onPressed: () {
//                       Get.to(() => const LanguageSelectionScreen());
//                     },
//                   ),
//
//                   const SizedBox(height: 30),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kincore_app/core/utils/app_images_const.dart';
// import 'package:kincore_app/core/utils/fetch_pixels.dart';
//
// import '../../../core/utils/app_colors.dart';
// import '../../../core/utils/app_fonts.dart';
// import '../../../core/widgets/app_text.dart';
// import '../../../core/widgets/custom_button.dart';
// import '../../../core/widgets/custom_widgets.dart';
// import '../../../core/widgets/soft_gradient_bg.dart';
// import '../language_selection_screen/contoller/language_selection_controller.dart';
// import '../language_selection_screen/widget/language_tile.dart';
// import 'controller/onbording_controller.dart';
//
// class OnboardingScreen extends StatelessWidget {
//   const OnboardingScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     FetchPixels();
//     final controller = Get.put(OnboardingController());
//     Get.put(LanguageSelectionController());
//
//     return Scaffold(
//       body: SoftGradientBackground(
//         enableBlur: true,
//         child: SafeArea(
//           child: Column(
//             children: [
//               const SizedBox(height: 20), // Top Spacing
//
//               // --- TOP INDICATOR (FIXED VISIBILITY) ---
//               Obx(() => Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: List.generate(2, (index) {
//                   bool isActive = controller.currentPage.value == index;
//                   return AnimatedContainer(
//                     duration: const Duration(milliseconds: 300),
//                     margin: const EdgeInsets.symmetric(horizontal: 4),
//                     height: 5, // Thoda thick kiya taaki visible ho
//                     width: isActive ? 30 : 15,
//                     decoration: BoxDecoration(
//                       // Active: Orange, Inactive: Solid Light Grey
//                       color: isActive
//                           ? AppColors.orangeColor
//                           : const Color(0xFFD0D0D0),
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                   );
//                 }),
//               )),
//
//               // --- PAGE VIEW ---
//               Expanded(
//                 child: PageView(
//                   controller: controller.pageController,
//                   onPageChanged: controller.onPageChanged,
//                   physics: const BouncingScrollPhysics(),
//                   children: [
//                     // PAGE 1: Intro / Get Started
//                     _buildIntroPage(controller),
//
//                     // PAGE 2: Language Selection
//                     _buildLanguagePage(controller),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // --- PAGE 1: INTRO DESIGN ---
//   // Widget _buildIntroPage(OnboardingController controller) {
//   //   return SingleChildScrollView(
//   //     child: Padding(
//   //       padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
//   //       child: Column(
//   //         children: [
//   //           SizedBox(height: FetchPixels.h(20)),
//   //
//   //           CustomAssetImage(
//   //             imageName: AppImagesConst.onboardingLogo,
//   //             height: FetchPixels.h(150),
//   //             width: FetchPixels.w(150),
//   //           ),
//   //
//   //           AppText(
//   //             "Kincore",
//   //             fontSize: 36,
//   //             fontWeight: AppFonts.bold,
//   //             gradient: LinearGradient(
//   //               colors: [AppColors.primaryColor, AppColors.yellowColor],
//   //               begin: Alignment.topCenter,
//   //               end: Alignment.bottomCenter,
//   //             ),
//   //           ),
//   //
//   //           SizedBox(height: FetchPixels.h(40)),
//   //
//   //           CustomAssetImage(
//   //             imageName: AppImagesConst.familyImage,
//   //             width: double.infinity,
//   //             fit: BoxFit.contain,
//   //             height: FetchPixels.h(200),
//   //           ),
//   //
//   //           SizedBox(height: FetchPixels.h(40)),
//   //
//   //           RichText(
//   //             textAlign: TextAlign.center,
//   //             text: TextSpan(
//   //               style: const TextStyle(
//   //                 fontSize: 20,
//   //                 fontWeight: AppFonts.semiBold,
//   //                 color: Colors.black, // Ye 'Connect to your' ke liye default apply hoga
//   //                 fontFamily: AppFonts.poppins,
//   //               ),
//   //               children: [
//   //                 const TextSpan(text: "Connect to your \n"),
//   //                 TextSpan(
//   //                   text: "Roots!",
//   //                   style: TextStyle(
//   //                     foreground: Paint()
//   //                       ..shader = LinearGradient(
//   //                         colors: [AppColors.primaryColor, AppColors.yellowColor],
//   //                         begin: Alignment.centerLeft,
//   //                         end: Alignment.centerRight,
//   //                       ).createShader(
//   //                         const Rect.fromLTWH(0.0, 0.0, 200.0, 50.0),
//   //                       ),
//   //                   ),
//   //                 ),
//   //               ],
//   //             ),
//   //           ),
//   //
//   //           const SizedBox(height: 15),
//   //
//   //           const AppText(
//   //             "Build a detailed family tree and keep your heritage alive for future generations.",
//   //             fontSize: 13,
//   //             textAlign: TextAlign.center,
//   //             color: Colors.black,
//   //             fontWeight: FontWeight.w500,
//   //           ),
//   //
//   //           SizedBox(height: FetchPixels.h(40)),
//   //
//   //           CustomButton(
//   //             text: 'Get Started',
//   //             onPressed: () {
//   //               controller.goToLanguagePage();
//   //             },
//   //           ),
//   //
//   //           const SizedBox(height: 30),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }
//
//   // Widget _buildIntroPage(OnboardingController controller) {
//   //   return SingleChildScrollView(
//   //     // Bottom padding di hai taaki scroll karne par buttons na chhupe
//   //     padding: EdgeInsets.only(
//   //       left: Get.width * 0.05,
//   //       right: Get.width * 0.05,
//   //       bottom: 40,
//   //     ),
//   //     child: Column(
//   //       children: [
//   //         SizedBox(height: FetchPixels.h(20)),
//   //
//   //         // --- 1. MAIN IMAGE CARD WITH BADGES ---
//   //         Stack(
//   //           clipBehavior: Clip.none,
//   //           alignment: Alignment.bottomCenter,
//   //           children: [
//   //             // Main Family Image
//   //             Container(
//   //               height: FetchPixels.h(345),
//   //               width: double.infinity,
//   //               decoration: BoxDecoration(
//   //                 borderRadius: BorderRadius.circular(30),
//   //                 color: Colors.grey.shade200, // Placeholder background if image is transparent
//   //               ),
//   //               child: ClipRRect(
//   //                 borderRadius: BorderRadius.circular(30),
//   //                 child: CustomAssetImage(
//   //                   imageName: AppImagesConst.familyImage,
//   //                   fit: BoxFit.cover, // Image ko cover karne ke liye
//   //                 ),
//   //               ),
//   //             ),
//   //
//   //             // Top Right Floating Icon (Family/People Icon)
//   //             Positioned(
//   //               top: 15,
//   //               right: 15,
//   //               child: Container(
//   //                 padding: const EdgeInsets.all(12),
//   //                 decoration: BoxDecoration(
//   //                   color: Colors.white,
//   //                   shape: BoxShape.circle,
//   //                   boxShadow: [
//   //                     BoxShadow(
//   //                       color: Colors.black.withOpacity(0.05),
//   //                       blurRadius: 10,
//   //                       spreadRadius: 2,
//   //                     ),
//   //                   ],
//   //                 ),
//   //                 child: const Icon(
//   //                   Icons.people_alt_outlined,
//   //                   color: AppColors.orangeColor,
//   //                   size: 24,
//   //                 ),
//   //               ),
//   //             ),
//   //
//   //             // Bottom Floating Card (Heritage Found)
//   //             Positioned(
//   //               bottom: -29,
//   //               child: Container(
//   //                 width: Get.width * 0.75,
//   //                 padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
//   //                 decoration: BoxDecoration(
//   //                   color: Colors.white,
//   //                   borderRadius: BorderRadius.circular(20),
//   //                   boxShadow: [
//   //                     BoxShadow(
//   //                       color: Colors.black.withOpacity(0.05),
//   //                       blurRadius: 15,
//   //                       spreadRadius: 2,
//   //                       offset: const Offset(0, 5),
//   //                     ),
//   //                   ],
//   //                 ),
//   //                 child: Row(
//   //                   children: [
//   //                     // Avatars (Placeholder icons/images)
//   //                     SizedBox(
//   //                       width: 60,
//   //                       child: Stack(
//   //                         children: [
//   //                           const CircleAvatar(radius: 14, backgroundColor: Colors.blueGrey),
//   //                           Positioned(left: 15, child: CircleAvatar(radius: 14, backgroundColor: Colors.grey.shade400)),
//   //                           const Positioned(left: 30, child: CircleAvatar(radius: 14, backgroundColor: Colors.teal)),
//   //                         ],
//   //                       ),
//   //                     ),
//   //                     const SizedBox(width: 10),
//   //                     // Text
//   //                     Expanded(
//   //                       child: Column(
//   //                         crossAxisAlignment: CrossAxisAlignment.start,
//   //                         children: [
//   //                           const AppText("Heritage Found", fontSize: 13, fontWeight: AppFonts.bold, color: Colors.black),
//   //                           AppText("42 new relatives", fontSize: 10, color: Colors.grey.shade600),
//   //                         ],
//   //                       ),
//   //                     ),
//   //                     // Green Checkmark
//   //                     Container(
//   //                       padding: const EdgeInsets.all(4),
//   //                       decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
//   //                       child: const Icon(Icons.check, color: Colors.white, size: 10),
//   //                     ),
//   //                   ],
//   //                 ),
//   //               ),
//   //             ),
//   //           ],
//   //         ),
//   //
//   //         // Spacing to accommodate the floating card
//   //         SizedBox(height: FetchPixels.h(50)),
//   //
//   //         // --- 2. FAMILY FIRST TAG ---
//   //         Row(
//   //           mainAxisAlignment: MainAxisAlignment.center,
//   //           children: [
//   //             Container(
//   //               width: 6,
//   //               height: 6,
//   //               decoration: const BoxDecoration(
//   //                 color: AppColors.orangeColor,
//   //                 shape: BoxShape.circle,
//   //               ),
//   //             ),
//   //             const SizedBox(width: 8),
//   //             const AppText(
//   //               "FAMILY FIRST",
//   //               fontSize: 12,
//   //               fontWeight: AppFonts.bold,
//   //               color: AppColors.orangeColor,
//   //               letterSpacing: 1.2,
//   //             ),
//   //           ],
//   //         ),
//   //
//   //         SizedBox(height: FetchPixels.h(15)),
//   //
//   //         // --- 3. HEADING TEXT ---
//   //         const AppText(
//   //           "Discover Your",
//   //           fontSize: 32,
//   //           fontWeight: FontWeight.w800,
//   //           color: Colors.black,
//   //         ),
//   //         ShaderMask(
//   //           blendMode: BlendMode.srcIn,
//   //           shaderCallback: (Rect bounds) {
//   //             return const LinearGradient(
//   //               colors: [AppColors.primaryColor, AppColors.yellowColor],
//   //               begin: Alignment.centerLeft,
//   //               end: Alignment.centerRight,
//   //             ).createShader(bounds);
//   //           },
//   //           child: const AppText(
//   //             "Roots",
//   //             fontSize: 34,
//   //             fontWeight: FontWeight.w900,
//   //             color: Colors.white,
//   //           ),
//   //         ),
//   //
//   //         SizedBox(height: FetchPixels.h(15)),
//   //
//   //         // --- 4. SUBTITLE ---
//   //         AppText(
//   //           "Build your tree, uncover stories, and\nconnect with generations past and\npresent. Your history starts here.",
//   //           fontSize: 14,
//   //           textAlign: TextAlign.center,
//   //           color: Colors.grey.shade600,
//   //           fontWeight: AppFonts.medium,
//   //           height: 1.5,
//   //         ),
//   //
//   //         SizedBox(height: FetchPixels.h(40)),
//   //
//   //         // --- 5. BUTTONS ---
//   //         // Get Started Button
//   //         CustomButton(
//   //           text: 'Get Started',
//   //           icon: Icons.arrow_forward,
//   //           iconColor: Colors.white,
//   //           isIconRight: true,
//   //           onPressed: () {
//   //             controller.goToLanguagePage();
//   //           },
//   //         ),
//   //
//   //         const SizedBox(height: 15),
//   //
//   //         // // Login Button
//   //         // InkWell(
//   //         //   onTap: () {
//   //         //     // Login navigation logic here
//   //         //   },
//   //         //   borderRadius: BorderRadius.circular(30),
//   //         //   child: Container(
//   //         //     width: double.infinity,
//   //         //     height: FetchPixels.h(55),
//   //         //     decoration: BoxDecoration(
//   //         //       color: Colors.white,
//   //         //       borderRadius: BorderRadius.circular(30),
//   //         //       border: Border.all(color: Colors.grey.shade200),
//   //         //       boxShadow: [
//   //         //         BoxShadow(
//   //         //           color: Colors.black.withOpacity(0.02),
//   //         //           blurRadius: 10,
//   //         //           offset: const Offset(0, 4),
//   //         //         ),
//   //         //       ],
//   //         //     ),
//   //         //     alignment: Alignment.center,
//   //         //     child: RichText(
//   //         //       text: const TextSpan(
//   //         //         style: TextStyle(
//   //         //           fontSize: 14,
//   //         //           fontFamily: AppFonts.poppins,
//   //         //           fontWeight: AppFonts.medium,
//   //         //         ),
//   //         //         children: [
//   //         //           TextSpan(
//   //         //             text: "Already have an account? ",
//   //         //             style: TextStyle(color: Colors.black87),
//   //         //           ),
//   //         //           TextSpan(
//   //         //             text: "Log In",
//   //         //             style: TextStyle(
//   //         //               color: AppColors.orangeColor,
//   //         //               fontWeight: AppFonts.bold,
//   //         //             ),
//   //         //           ),
//   //         //         ],
//   //         //       ),
//   //         //     ),
//   //         //   ),
//   //         // ),
//   //       ],
//   //     ),
//   //   );
//   // }
//
//   Widget _buildIntroPage(OnboardingController controller) {
//     return Center(
//       // [FIX]: Web ke liye Max Width set ki taaki image aur UI stretch na ho
//       child: ConstrainedBox(
//         constraints: const BoxConstraints(maxWidth: 500),
//         child: SingleChildScrollView(
//           // Padding ko thoda adjust kiya web and mobile ke liye
//           padding: const EdgeInsets.only(
//             left: 20,
//             right: 20,
//             bottom: 40,
//           ),
//           child: Column(
//             children: [
//               SizedBox(height: FetchPixels.h(20)),
//
//               // --- 1. MAIN IMAGE CARD WITH BADGES ---
//               Stack(
//                 clipBehavior: Clip.none,
//                 alignment: Alignment.bottomCenter,
//                 children: [
//                   // Main Family Image
//                   Container(
//                     height: FetchPixels.h(345),
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30),
//                       color: Colors.grey.shade200,
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(30),
//                       child: CustomAssetImage(
//                         imageName: AppImagesConst.familyImage,
//                         fit: BoxFit.cover, // Ab ConstrainedBox ki wajah se image properly fit hogi
//                       ),
//                     ),
//                   ),
//
//                   // Top Right Floating Icon (Family/People Icon)
//                   Positioned(
//                     top: 15,
//                     right: 15,
//                     child: Container(
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         shape: BoxShape.circle,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.05),
//                             blurRadius: 10,
//                             spreadRadius: 2,
//                           ),
//                         ],
//                       ),
//                       child: const Icon(
//                         Icons.people_alt_outlined,
//                         color: AppColors.orangeColor,
//                         size: 24,
//                       ),
//                     ),
//                   ),
//
//                   // Bottom Floating Card (Heritage Found)
//                   Positioned(
//                     bottom: -29,
//                     child: Container(
//                       // [FIX]: Width ko responsive banaya taaki web pe card box se bahar na nikle
//                       width: Get.width > 500 ? 350 : Get.width * 0.75,
//                       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(20),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.05),
//                             blurRadius: 15,
//                             spreadRadius: 2,
//                             offset: const Offset(0, 5),
//                           ),
//                         ],
//                       ),
//                       child: Row(
//                         children: [
//                           // Avatars (Placeholder icons/images)
//                           SizedBox(
//                             width: 60,
//                             child: Stack(
//                               children: [
//                                 const CircleAvatar(radius: 14, backgroundColor: Colors.blueGrey),
//                                 Positioned(left: 15, child: CircleAvatar(radius: 14, backgroundColor: Colors.grey.shade400)),
//                                 const Positioned(left: 30, child: CircleAvatar(radius: 14, backgroundColor: Colors.teal)),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//                           // Text
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const AppText("Heritage Found", fontSize: 13, fontWeight: AppFonts.bold, color: Colors.black),
//                                 AppText("42 new relatives", fontSize: 10, color: Colors.grey.shade600),
//                               ],
//                             ),
//                           ),
//                           // Green Checkmark
//                           Container(
//                             padding: const EdgeInsets.all(4),
//                             decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
//                             child: const Icon(Icons.check, color: Colors.white, size: 10),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//
//               // Spacing to accommodate the floating card
//               SizedBox(height: FetchPixels.h(50)),
//
//               // --- 2. FAMILY FIRST TAG ---
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: 6,
//                     height: 6,
//                     decoration: const BoxDecoration(
//                       color: AppColors.orangeColor,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   const AppText(
//                     "FAMILY FIRST",
//                     fontSize: 12,
//                     fontWeight: AppFonts.bold,
//                     color: AppColors.orangeColor,
//                     letterSpacing: 1.2,
//                   ),
//                 ],
//               ),
//
//               SizedBox(height: FetchPixels.h(15)),
//
//               // --- 3. HEADING TEXT ---
//               const AppText(
//                 "Discover Your",
//                 fontSize: 32,
//                 fontWeight: FontWeight.w800,
//                 color: Colors.black,
//               ),
//               ShaderMask(
//                 blendMode: BlendMode.srcIn,
//                 shaderCallback: (Rect bounds) {
//                   return const LinearGradient(
//                     colors: [AppColors.primaryColor, AppColors.yellowColor],
//                     begin: Alignment.centerLeft,
//                     end: Alignment.centerRight,
//                   ).createShader(bounds);
//                 },
//                 child: const AppText(
//                   "Roots",
//                   fontSize: 34,
//                   fontWeight: FontWeight.w900,
//                   color: Colors.white,
//                 ),
//               ),
//
//               SizedBox(height: FetchPixels.h(15)),
//
//               // --- 4. SUBTITLE ---
//               AppText(
//                 "Build your tree, uncover stories, and\nconnect with generations past and\npresent. Your history starts here.",
//                 fontSize: 14,
//                 textAlign: TextAlign.center,
//                 color: Colors.grey.shade600,
//                 fontWeight: AppFonts.medium,
//                 height: 1.5,
//               ),
//
//               SizedBox(height: FetchPixels.h(40)),
//
//               // --- 5. BUTTONS ---
//               CustomButton(
//                 text: 'Get Started',
//                 icon: Icons.arrow_forward,
//                 iconColor: Colors.white,
//                 isIconRight: true,
//                 onPressed: () {
//                   controller.goToLanguagePage();
//                 },
//               ),
//
//               const SizedBox(height: 15),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // --- PAGE 2: LANGUAGE SELECTION DESIGN ---
//   Widget _buildLanguagePage(OnboardingController mainController) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
//         child: Column(
//           children: [
//             SizedBox(height: FetchPixels.h(10)),
//
//             CustomAssetImage(
//               imageName: AppImagesConst.onboardingLogo,
//               height: FetchPixels.h(100),
//               width: FetchPixels.w(100),
//             ),
//
//             AppText(
//               "Kincore",
//               fontSize: 24,
//               fontWeight: AppFonts.bold,
//               gradient: LinearGradient(
//                 colors: [AppColors.primaryColor, AppColors.yellowColor],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//             ),
//
//             const SizedBox(height: 20),
//
//             AppText(
//               "Select Your Language!",
//               fontSize: 20,
//               fontWeight: AppFonts.semiBold,
//               color: AppColors.blackColor,
//             ),
//
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: AppText(
//                 "Choose Your Preferred Language for the app to enhance your experience.",
//                 fontSize: 14,
//                 textAlign: TextAlign.center,
//                 fontWeight: AppFonts.medium,
//                 color: AppColors.greyColor,
//               ),
//             ),
//
//             const SizedBox(height: 24),
//
//             // Use GetBuilder for Language Selection
//             GetBuilder<LanguageSelectionController>(
//               id: 'Lang',
//               builder: (controller) {
//                 return ListView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: controller.languages.length,
//                   itemBuilder: (context, index) {
//                     final lang = controller.languages[index];
//
//                     return LanguageTile(
//                       title: lang['title']!,
//                       subtitle: lang['subtitle']!,
//                       selected: controller.selectedLang.value == lang['code'],
//                       onTap: () => controller.selectLanguage(lang['code']!),
//                     );
//                   },
//                 );
//               },
//             ),
//
//             const SizedBox(height: 16),
//
//             CustomButton(
//               text: "Confirm Language",
//               onPressed: () {
//                 mainController.completeOnboarding();
//               },
//             ),
//
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:ui'; // [FIX]: Ye import add kiya hai PointerDeviceKind ke liye
import 'package:get/get.dart';
import 'package:kincore_app/core/utils/app_images_const.dart';
import 'package:kincore_app/core/utils/fetch_pixels.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_widgets.dart';
import '../../../core/widgets/soft_gradient_bg.dart';
import '../language_selection_screen/contoller/language_selection_controller.dart';
import '../language_selection_screen/widget/language_tile.dart';
import 'controller/onbording_controller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FetchPixels();
    final controller = Get.put(OnboardingController());
    Get.put(LanguageSelectionController());

    return Scaffold(
      body: SoftGradientBackground(
        enableBlur: true,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20), // Top Spacing

              // --- TOP INDICATOR (FIXED VISIBILITY) ---
              Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(2, (index) {
                  bool isActive = controller.currentPage.value == index;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 5,
                    width: isActive ? 30 : 15,
                    decoration: BoxDecoration(
                      color: isActive
                          ? AppColors.orangeColor
                          : const Color(0xFFD0D0D0),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  );
                }),
              )),

              // --- PAGE VIEW ---
              Expanded(
                child: ScrollConfiguration(
                  // [FIX]: Yahan par mouse aur trackpad scroll allow kiya hai web ke liye
                  behavior: ScrollConfiguration.of(context).copyWith(
                    dragDevices: {
                      PointerDeviceKind.touch,
                      PointerDeviceKind.mouse,
                      PointerDeviceKind.trackpad,
                    },
                  ),
                  child: PageView(
                    controller: controller.pageController,
                    onPageChanged: controller.onPageChanged,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      // PAGE 1: Intro / Get Started
                      _buildIntroPage(controller),

                      // PAGE 2: Language Selection
                      _buildLanguagePage(controller),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- PAGE 1: INTRO DESIGN ---
  Widget _buildIntroPage(OnboardingController controller) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 40,
          ),
          child: Column(
            children: [
              SizedBox(height: FetchPixels.h(20)),

              // --- 1. MAIN IMAGE CARD WITH BADGES ---
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  // Main Family Image
                  Container(
                    height: FetchPixels.h(345),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey.shade200,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: CustomAssetImage(
                        imageName: AppImagesConst.familyImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Top Right Floating Icon
                  Positioned(
                    top: 15,
                    right: 15,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.people_alt_outlined,
                        color: AppColors.orangeColor,
                        size: 24,
                      ),
                    ),
                  ),

                  // Bottom Floating Card (Heritage Found)
                  Positioned(
                    bottom: -29,
                    child: Container(
                      width: Get.width > 500 ? 350 : Get.width * 0.75,
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 15,
                            spreadRadius: 2,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 60,
                            child: Stack(
                              children: [
                                const CircleAvatar(radius: 14, backgroundColor: Colors.blueGrey),
                                Positioned(left: 15, child: CircleAvatar(radius: 14, backgroundColor: Colors.grey.shade400)),
                                const Positioned(left: 30, child: CircleAvatar(radius: 14, backgroundColor: Colors.teal)),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const AppText("Heritage Found", fontSize: 13, fontWeight: AppFonts.bold, color: Colors.black),
                                AppText("42 new relatives", fontSize: 10, color: Colors.grey.shade600),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                            child: const Icon(Icons.check, color: Colors.white, size: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: FetchPixels.h(50)),

              // --- 2. FAMILY FIRST TAG ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: AppColors.orangeColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const AppText(
                    "FAMILY FIRST",
                    fontSize: 12,
                    fontWeight: AppFonts.bold,
                    color: AppColors.orangeColor,
                    letterSpacing: 1.2,
                  ),
                ],
              ),

              SizedBox(height: FetchPixels.h(15)),

              // --- 3. HEADING TEXT ---
              const AppText(
                "Discover Your",
                fontSize: 32,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [AppColors.primaryColor, AppColors.yellowColor],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ).createShader(bounds);
                },
                child: const AppText(
                  "Roots",
                  fontSize: 34,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: FetchPixels.h(15)),

              // --- 4. SUBTITLE ---
              AppText(
                "Build your tree, uncover stories, and\nconnect with generations past and\npresent. Your history starts here.",
                fontSize: 14,
                textAlign: TextAlign.center,
                color: Colors.grey.shade600,
                fontWeight: AppFonts.medium,
                height: 1.5,
              ),

              SizedBox(height: FetchPixels.h(40)),

              // --- 5. BUTTONS ---
              CustomButton(
                text: 'Get Started',
                icon: Icons.arrow_forward,
                iconColor: Colors.white,
                isIconRight: true,
                onPressed: () {
                  controller.goToLanguagePage();
                },
              ),

              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  // --- PAGE 2: LANGUAGE SELECTION DESIGN ---
  Widget _buildLanguagePage(OnboardingController mainController) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
            child: Column(
              children: [
                SizedBox(height: FetchPixels.h(10)),

                CustomAssetImage(
                  imageName: AppImagesConst.onboardingLogo,
                  height: FetchPixels.h(100),
                  width: FetchPixels.w(100),
                ),

                AppText(
                  "Kincore",
                  fontSize: 24,
                  fontWeight: AppFonts.bold,
                  gradient: const LinearGradient(
                    colors: [AppColors.primaryColor, AppColors.yellowColor],
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
                          selected: controller.selectedLang.value == lang['code'],
                          onTap: () => controller.selectLanguage(lang['code']!),
                        );
                      },
                    );
                  },
                ),

                const SizedBox(height: 16),

                CustomButton(
                  text: "Confirm Language",
                  onPressed: () {
                    mainController.completeOnboarding();
                  },
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}