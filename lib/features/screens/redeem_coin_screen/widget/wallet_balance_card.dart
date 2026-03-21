// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:kincore_app/features/screens/redeem_coin_screen/redeem_coins_screen.dart';
// import '../../../../core/utils/app_colors.dart';
// import '../../../../core/utils/app_fonts.dart';
// import '../../../../core/widgets/app_text.dart';
// import '../../../../core/widgets/custom_button.dart';
// import '../../profile_screens/controller/profile_controller.dart';
//
// class WalletBalanceCard extends StatelessWidget {
//   final double screenW;
//   final double screenH;
//
//   const WalletBalanceCard({
//     super.key,
//     required this.screenW,
//     required this.screenH,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<ProfileController>();
//
//     return Column(
//       children: [
//         /// Wallet Box Border
//         Container(
//           padding: EdgeInsets.all(screenW * 0.05), // Thoda padding badhaya roundness ke liye
//           decoration: BoxDecoration(
//             gradient: const LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [
//                 Color(0xFFFF6130),
//                 Color(0xFFFF8C48),
//                 Color(0xFFFFCF71),
//               ],
//             ),
//             border: Border.all(color: Colors.grey.shade200),
//             // BorderRadius 48 set kar diya hai jesa aapne bola
//             borderRadius: BorderRadius.circular(48),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Center(
//                 child: AppText(
//                   'redeem.totalBalance'.tr,
//                   fontWeight: AppFonts.semiBold,
//                   color: AppColors.whiteColor,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SvgPicture.asset(
//                     'assets/icons/wallet_coin.svg',
//                   ),
//                   const SizedBox(width: 5),
//                   Obx(
//                         () => AppText(
//                       "${controller.coinBalance.value}",
//                       fontSize: 24,
//                       fontWeight: AppFonts.semiBold,
//                       color: AppColors.whiteColor,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: screenH * 0.02),
//
//               /// View Wallet / Transaction Button
//               CustomButton(
//                 text: "profile.redeemCoins".tr,
//                 width: 250,
//                 height: 40,
//                 // Text color orange set kar diya hai
//                 textColor: AppColors.orangeColor,
//                 onPressed: () {
//                   Get.to(() => const RedeemKCCScreen());
//                 },
//                 backgroundColor: AppColors.whiteColor,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kincore_app/features/screens/redeem_coin_screen/redeem_coins_screen.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../profile_screens/controller/profile_controller.dart';

class WalletBalanceCard extends StatelessWidget {
  final double screenW;
  final double screenH;

  const WalletBalanceCard({
    super.key,
    required this.screenW,
    required this.screenH,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();

    return Column(
      children: [
        /// Wallet Box Border
        Container(
          padding: EdgeInsets.all(screenW * 0.05), // Thoda padding badhaya roundness ke liye
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFFF6130),
                Color(0xFFFF8C48),
                Color(0xFFFFCF71),
              ],
            ),
            border: Border.all(color: Colors.grey.shade200),
            // BorderRadius 48 set kar diya hai jesa aapne bola
            borderRadius: BorderRadius.circular(48),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: AppText(
                  'redeem.totalBalance'.tr,
                  fontWeight: AppFonts.semiBold,
                  color: AppColors.whiteColor,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/wallet_coin.svg',
                  ),
                  const SizedBox(width: 5),
                  Obx(
                        () => AppText(
                      "${controller.coinBalance.value}",
                      fontSize: 40, // Increased font size to match the image balance
                      fontWeight: AppFonts.bold,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              /// NEW: Level Badge (Dynamic & Localized via API)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Obx(() => AppText(
                  // .trParams use kiya taaki Level number aur title dynamic rahe
                  'profile.levelBadge'.trParams({
                    'level': controller.userLevel.value.toString(),
                    'title': controller.levelTitle.value,
                  }),
                  fontSize: 12,
                  color: AppColors.whiteColor,
                  fontWeight: AppFonts.medium,
                )),
              ),

              SizedBox(height: screenH * 0.02),

              /// View Wallet / Transaction Button with Gift Icon
              InkWell(
                onTap: () {
                  Get.to(() => const RedeemKCCScreen());
                },
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  width: 250,
                  height: 45, // Slightly increased height for better look
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.card_giftcard_rounded, // Gift Icon
                        color: AppColors.orangeColor,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      AppText(
                        "profile.redeemCoins".tr,
                        color: AppColors.orangeColor,
                        fontWeight: AppFonts.bold,
                        fontSize: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
