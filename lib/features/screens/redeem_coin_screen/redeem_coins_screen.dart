// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kincore_app/core/widgets/custom_text_button.dart';import '../../../core/utils/app_colors.dart';
// import '../../../core/utils/app_fonts.dart';
// import '../../../core/widgets/app_text.dart';
// import '../../../core/widgets/custom_icon_button.dart';
// import '../../../core/widgets/custom_network_image.dart';
// import 'controller/redeem_kcc_coin_controller.dart';
// import 'featured_rewards_screen.dart';
// import 'widget/redeem_coin_screen_balance_card.dart';
// import 'widget/wallet_balance_card.dart';
// import 'widget/way_to_earn_tile.dart';
// import 'widget/way_to_redeem_card.dart';
//
// class RedeemKCCScreen extends StatelessWidget {
//   const RedeemKCCScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(RedeemController());
//
//     final theme = Theme.of(context);
//     final colors = theme.colorScheme;
//     final isDark = theme.brightness == Brightness.dark;
//
//     final double screenW = Get.width;
//     final double screenH = Get.height;
//
//     return Scaffold(
//       backgroundColor: theme.scaffoldBackgroundColor,
//       appBar: AppBar(
//         elevation: 0,
//         surfaceTintColor: Colors.transparent,
//         scrolledUnderElevation: 0,
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back_ios_new,
//             size: 20,
//             color: colors.onSurface,
//           ),
//           onPressed: Get.back,
//         ),
//         title: AppText(
//           "redeem.title".tr,
//           fontSize: 18,
//           fontWeight: AppFonts.semiBold,
//         ),
//         // actions: [
//         //   CustomTextButton(text: 'History', onPressed: (){}),
//         //   SizedBox(width: screenW * 0.02),
//         // ],
//       ),
//
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: screenW * 0.05),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//
//             /// BALANCE CARD
//             // RedeemCoinBalanceCard(
//             //   screenW: screenW,
//             //   screenH: screenH,
//             // ),
//
//             WalletBalanceCard(screenW: screenW, screenH: screenH),
//
//             SizedBox(height: screenH * 0.035),
//
//             // /// WAYS TO REDEEM
//             // AppText(
//             //   "redeem.waysToRedeem".tr,
//             //   fontSize: 18,
//             //   fontWeight: AppFonts.semiBold,
//             // ),
//             // const SizedBox(height: 16),
//             //
//             // Obx(
//             //       () =>
//             //       Column(
//             //         children: controller.redeemOptions.map((data) {
//             //           return WayToRedeemCard(
//             //             title: data['title']
//             //                 .toString()
//             //                 .tr,
//             //             description: data['description']
//             //                 .toString()
//             //                 .tr,
//             //             buttonText: data['buttonText']
//             //                 .toString()
//             //                 .tr,
//             //             imageUrl: data['imageUrl'],
//             //             buttonIcon: data['icon'],
//             //             isSolidButton: data['isSolid'] ?? false,
//             //             onTap: () {},
//             //           );
//             //         }).toList(),
//             //       ),
//             // ),
//
//             // SizedBox(height: screenH * 0.04),
//
//             /// WAYS TO EARN
//             AppText(
//               "redeem.waysToEarn".tr,
//               fontSize: 18,
//               fontWeight: AppFonts.semiBold,
//             ),
//             const SizedBox(height: 16),
//
//             _buildProfileProgressCard(theme, colors),
//
//             Obx(
//                   () =>
//                   Column(
//                     children: controller.earnOptions.map((data) {
//                       return WayToEarnTile(
//                         title: data['title']
//                             .toString()
//                             .tr,
//                         subTitle: data['subTitle']
//                             .toString()
//                             .tr,
//                         icon: data['icon'],
//                         onTap: () {},
//                       );
//                     }).toList(),
//                   ),
//             ),
//
//             SizedBox(height: screenH * 0.04),
//
//             // /// RECENT ACTIVITY
//             // AppText(
//             //   "redeem.recentActivity".tr,
//             //   fontSize: 18,
//             //   fontWeight: AppFonts.semiBold,
//             // ),
//             // const SizedBox(height: 16),
//             //
//             // // Yahan aap API model ka data pass kar sakte hain
//             // _buildActivityTile(
//             //   theme: theme,
//             //   colors: colors,
//             //   imageUrl: "https://i.pravatar.cc/150?u=product",
//             //   // Placeholder URL, isko API data se replace karein
//             //   title: "redeem.vintageCase".tr,
//             //   // API se aane wala Product Name
//             //   subtitle: "redeem.kmallPurchase".tr,
//             //   amount: "redeem.redeemedKcc".tr,
//             // ),
//
//             /// FEATURED REWARDS (New Section)
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 AppText(
//                   'redeem.featuredRewards'.tr,
//                   fontSize: 18,
//                   fontWeight: AppFonts.semiBold,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     // Nayi screen par navigate karein
//                     Get.to(() => const FeaturedRewardsScreen());
//                   },
//                   child: AppText(
//                     'common.viewAll'.tr,
//                     fontSize: 13,
//                     fontWeight: AppFonts.semiBold,
//                     color: AppColors.orangeColor,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//
//             // Horizontal Scrolling List for Products
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               physics: const BouncingScrollPhysics(),
//               // Default padding ko adjust kiya hai taaki shadow cut na ho
//               clipBehavior: Clip.none,
//               child: Row(
//                 children: [
//                   _buildFeaturedRewardCard(
//                     theme: theme,
//                     colors: colors,
//                     imageUrl: "https://images.unsplash.com/photo-1514228742587-6b1558fcca3d", // API se aayegi
//                     title: "Family Crest Mug",
//                     price: "450 KCC",
//                   ),
//                   const SizedBox(width: 15),
//                   _buildFeaturedRewardCard(
//                     theme: theme,
//                     colors: colors,
//                     imageUrl: "https://images.unsplash.com/photo-1589802778601-574f03a6a9b4", // API se aayegi
//                     title: "Premium Tree Print",
//                     price: "800 KCC",
//                   ),
//                   const SizedBox(width: 15),
//                   _buildFeaturedRewardCard(
//                     theme: theme,
//                     colors: colors,
//                     imageUrl: "https://images.unsplash.com/photo-1544413660-299165566b1d", // API se aayegi
//                     title: "Custom Photo Book",
//                     price: "1200 KCC",
//                   ),
//                 ],
//               ),
//             ),
//
//             SizedBox(height: screenH * 0.04),
//
//             SizedBox(height: screenH * 0.06),
//           ],
//         ),
//       ),
//     );
//   }
//
// // Widget ko dynamic banaya gaya hai taaki API se easily list map ho sake
//   Widget _buildActivityTile({
//     required ThemeData theme,
//     required ColorScheme colors,
//     required String imageUrl,
//     required String title,
//     required String subtitle,
//     required String amount,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: theme.cardColor,
//         borderRadius: BorderRadius.circular(14),
//         border: Border.all(
//           color: theme.dividerColor.withOpacity(0.6),
//         ),
//       ),
//       child: Row(
//         children: [
//           // --- API IMAGE WIDGET ---
//           CustomNetworkImage(
//             imageUrl: imageUrl,
//             height: 45,
//             width: 45,
//             borderRadius: 8, // Product image thodi square/rounded aachi lagti hai
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 AppText(
//                   title,
//                   fontSize: 14,
//                   fontWeight: AppFonts.semiBold,
//                 ),
//                 AppText(
//                   subtitle,
//                   fontSize: 12,
//                   color: Colors.grey,
//                 ),
//               ],
//             ),
//           ),
//           AppText(
//             amount,
//             fontSize: 14,
//             fontWeight: AppFonts.bold,
//             color: AppColors.orangeColor,
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Featured Reward Card Builder (Product layout match)
//   Widget _buildFeaturedRewardCard({
//     required ThemeData theme,
//     required ColorScheme colors,
//     required String imageUrl,
//     required String title,
//     required String price,
//   }) {
//     return Container(
//       width: 145, // Fixed width for horizontal card
//       decoration: BoxDecoration(
//         color: theme.cardColor,
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(
//           color: theme.dividerColor.withOpacity(0.4),
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Upper half: Product Image area
//           Container(
//             height: 110,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               // Screenshot jaisa light greyish background image ke piche
//               color: colors.surfaceContainerHighest.withOpacity(0.5),
//               borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
//             ),
//             child: ClipRRect(
//               borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
//               child: CustomNetworkImage(
//                 imageUrl: imageUrl,
//                 height: 110,
//                 width: double.infinity,
//                 fit: BoxFit.cover, // Image fit style
//               ),
//             ),
//           ),
//
//           // Lower half: Product Info
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 AppText(
//                   title,
//                   fontSize: 13,
//                   fontWeight: AppFonts.bold,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 6),
//                 AppText(
//                   price,
//                   fontSize: 12,
//                   fontWeight: AppFonts.bold,
//                   color: AppColors.orangeColor,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Profile Completion Progress Card
//   Widget _buildProfileProgressCard(ThemeData theme, ColorScheme colors) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: theme.cardColor,
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(color: theme.dividerColor.withOpacity(0.4)),
//       ),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               // Left Icon
//               Container(
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: AppColors.orangeColor.withOpacity(0.1),
//                   shape: BoxShape.circle,
//                 ),
//                 child: const Icon(Icons.person, color: AppColors.orangeColor),
//               ),
//               const SizedBox(width: 15),
//               // Title & Subtitle
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     AppText('redeem.completeProfile'.tr, fontSize: 14, fontWeight: AppFonts.bold, color: colors.onSurface),
//                     const SizedBox(height: 2),
//                     // Points ko dynamic pass kiya hai
//                     AppText('redeem.earnKcc'.trParams({'points': '50'}), fontSize: 12, color: colors.onSurfaceVariant),
//                   ],
//                 ),
//               ),
//               // +50 Points
//               AppText("+50", fontSize: 15, fontWeight: AppFonts.bold, color: AppColors.orangeColor),
//             ],
//           ),
//           const SizedBox(height: 15),
//           // Progress Bar Area
//           Row(
//             children: [
//               Expanded(
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: LinearProgressIndicator(
//                     value: 0.7, // 70% Progress
//                     backgroundColor: colors.outlineVariant.withOpacity(0.4),
//                     valueColor: const AlwaysStoppedAnimation<Color>(AppColors.orangeColor),
//                     minHeight: 6,
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 12),
//               AppText("70%", fontSize: 12, fontWeight: AppFonts.semiBold, color: colors.onSurfaceVariant),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_network_image.dart';
import 'controller/redeem_kcc_coin_controller.dart';
import 'featured_rewards_screen.dart';
import 'widget/wallet_balance_card.dart';
import 'widget/way_to_earn_tile.dart';

class RedeemKCCScreen extends StatelessWidget {
  const RedeemKCCScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RedeemController());

    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    final double screenW = Get.width;
    final double screenH = Get.height;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: colors.onSurface,
          ),
          onPressed: Get.back,
        ),
        title: AppText(
          "redeem.title".tr,
          fontSize: 18,
          fontWeight: AppFonts.semiBold,
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenW * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// BALANCE CARD
            WalletBalanceCard(screenW: screenW, screenH: screenH),

            SizedBox(height: screenH * 0.035),

            /// WAYS TO EARN
            AppText(
              "redeem.waysToEarn".tr,
              fontSize: 18,
              fontWeight: AppFonts.semiBold,
            ),
            const SizedBox(height: 16),

            _buildProfileProgressCard(theme, colors),

            Obx(
                  () =>
                  Column(
                    children: controller.earnOptions.map((data) {
                      return WayToEarnTile(
                        title: data['title']
                            .toString()
                            .tr,
                        subTitle: data['subTitle']
                            .toString()
                            .tr,
                        icon: data['icon'],
                        onTap: () {},
                      );
                    }).toList(),
                  ),
            ),

            SizedBox(height: screenH * 0.04),

            /// FEATURED REWARDS (New Section)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  'redeem.featuredRewards'.tr,
                  fontSize: 18,
                  fontWeight: AppFonts.semiBold,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const FeaturedRewardsScreen());
                  },
                  child: AppText(
                    'common.viewAll'.tr,
                    fontSize: 13,
                    fontWeight: AppFonts.semiBold,
                    color: AppColors.orangeColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Horizontal Scrolling List for Products
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              clipBehavior: Clip.none,
              child: Row(
                children: [
                  _buildFeaturedRewardCard(
                    theme: theme,
                    colors: colors,
                    imageUrl: "https://images.unsplash.com/photo-1514228742587-6b1558fcca3d", // API se aayegi
                    title: "Family Crest Mug",
                    price: "450 KCC",
                  ),
                  const SizedBox(width: 15),
                  _buildFeaturedRewardCard(
                    theme: theme,
                    colors: colors,
                    imageUrl: "https://images.unsplash.com/photo-1589802778601-574f03a6a9b4", // API se aayegi
                    title: "Premium Tree Print",
                    price: "800 KCC",
                  ),
                  const SizedBox(width: 15),
                  _buildFeaturedRewardCard(
                    theme: theme,
                    colors: colors,
                    imageUrl: "https://images.unsplash.com/photo-1544413660-299165566b1d", // API se aayegi
                    title: "Custom Photo Book",
                    price: "1200 KCC",
                  ),
                ],
              ),
            ),

            // [FIXED]: Removed the double SizedBoxes here. Just one consistent bottom padding.
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Widget ko dynamic banaya gaya hai taaki API se easily list map ho sake
  Widget _buildActivityTile({
    required ThemeData theme,
    required ColorScheme colors,
    required String imageUrl,
    required String title,
    required String subtitle,
    required String amount,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: theme.dividerColor.withOpacity(0.6),
        ),
      ),
      child: Row(
        children: [
          CustomNetworkImage(
            imageUrl: imageUrl,
            height: 45,
            width: 45,
            borderRadius: 8,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title,
                  fontSize: 14,
                  fontWeight: AppFonts.semiBold,
                ),
                AppText(
                  subtitle,
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          AppText(
            amount,
            fontSize: 14,
            fontWeight: AppFonts.bold,
            color: AppColors.orangeColor,
          ),
        ],
      ),
    );
  }

  // Featured Reward Card Builder (Product layout match)
  Widget _buildFeaturedRewardCard({
    required ThemeData theme,
    required ColorScheme colors,
    required String imageUrl,
    required String title,
    required String price,
  }) {
    return Container(
      width: 145, // Fixed width for horizontal card
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: theme.dividerColor.withOpacity(0.4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Upper half: Product Image area
          Container(
            height: 110,
            width: double.infinity,
            decoration: BoxDecoration(
              color: colors.surfaceContainerHighest.withOpacity(0.5),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              child: CustomNetworkImage(
                imageUrl: imageUrl,
                height: 110,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Lower half: Product Info
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title,
                  fontSize: 13,
                  fontWeight: AppFonts.bold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                AppText(
                  price,
                  fontSize: 12,
                  fontWeight: AppFonts.bold,
                  color: AppColors.orangeColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Profile Completion Progress Card
  Widget _buildProfileProgressCard(ThemeData theme, ColorScheme colors) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.dividerColor.withOpacity(0.4)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.orangeColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.person, color: AppColors.orangeColor),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText('redeem.completeProfile'.tr, fontSize: 14, fontWeight: AppFonts.bold, color: colors.onSurface),
                    const SizedBox(height: 2),
                    AppText('redeem.earnKcc'.trParams({'points': '50'}), fontSize: 12, color: colors.onSurfaceVariant),
                  ],
                ),
              ),
              AppText("+50", fontSize: 15, fontWeight: AppFonts.bold, color: AppColors.orangeColor),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: 0.7,
                    backgroundColor: colors.outlineVariant.withOpacity(0.4),
                    valueColor: const AlwaysStoppedAnimation<Color>(AppColors.orangeColor),
                    minHeight: 6,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              AppText("70%", fontSize: 12, fontWeight: AppFonts.semiBold, color: colors.onSurfaceVariant),
            ],
          ),
        ],
      ),
    );
  }
}