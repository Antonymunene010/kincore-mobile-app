// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kincore_app/features/screens/event_screen/family_event_screen.dart';
// import 'package:kincore_app/features/screens/family_bio/family_bio_screen.dart';
// import 'package:kincore_app/features/screens/gift_and_draw_screens/gift_exchange_details_screen.dart';
// import 'package:kincore_app/features/screens/identity_approval/identity_approval_screen.dart';
// import 'package:kincore_app/features/screens/kinship_screens/kinship_result_screen.dart';
// import 'package:kincore_app/features/screens/migration_map_screen/migration_map_screen.dart';
// import 'package:kincore_app/features/screens/notification/notification_screen.dart';
// import 'package:kincore_app/features/screens/profile_screens/setting_screen.dart';
// import 'package:kincore_app/features/screens/request_history_screen/requeast_history_screen.dart';
// import '../../../core/utils/app_colors.dart';
// import '../../../core/utils/app_fonts.dart';
// import '../../../core/utils/app_theme_controller.dart';
// import '../../../core/widgets/app_text.dart';
// import '../../../core/widgets/custom_icon_button.dart';
// import '../../../core/widgets/custom_network_image.dart';
// import '../profile_screens/controller/profile_controller.dart';
// import '../redeem_coin_screen/widget/wallet_balance_card.dart';
// import '../switch_space/switch_space_screen.dart';
// import 'widget/home_grid_button.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(ProfileController());
//     final theme = Theme.of(context);
//
//     return Scaffold(
//       backgroundColor: theme.scaffoldBackgroundColor,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         centerTitle: false,
//         titleSpacing: 20,
//         title: AppText(
//             "home.title".tr,
//             fontSize: 20,
//             fontWeight: AppFonts.semiBold
//         ),
//         actions: [
//           /// THEME SWITCHER (Sun/Moon with Colors)
//           // Obx(() {
//           //   final themeController = Get.find<ThemeController>();
//           //   return IconButton(
//           //     onPressed: () => themeController.toggleTheme(),
//           //     icon: Icon(
//           //       // Dark mode mein Sun, Light mode mein Moon
//           //       themeController.isDark ? Icons.wb_sunny_rounded : Icons.nightlight_round,
//           //       size: 22,
//           //       // Dark mode mein Sun ko Yellow color diya hai
//           //       color: themeController.isDark
//           //           ? Colors.amber
//           //           : Colors.grey.shade700,
//           //     ),
//           //   );
//           // }),
//
//           /// BELL ICON
//           CustomIconButton(
//             iconName: 'bell.svg',
//             size: 22,
//             onTap: () =>Get.to(NotificationScreen()),
//           ),
//
//           const SizedBox(width: 15),
//         ],
//         // actions: [
//         //   CustomIconButton(iconName: 'search.svg', size: 22, onTap: () {}),
//         //   CustomIconButton(iconName: 'bell.svg', size: 22, onTap: () {}),
//         //   const SizedBox(width: 15),
//         // ],
//       ),
//       body: Center(
//         child: ConstrainedBox(
//           constraints: const BoxConstraints(maxWidth: 800),
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               children: [
//                 /// --- Profile Header (Capsule Shape) ---
//                 Container(
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: AppColors.orangeColor.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(60),
//                   ),
//                   child: Row(
//                     children: [
//                       Obx(() => CustomNetworkImage(
//                         imageUrl: controller.profileImageUrl.value,
//                         height: 65,
//                         width: 65,
//                         borderRadius: 35,
//                       )),
//                       const SizedBox(width: 15),
//                       Expanded(
//                         child: Obx(() => AppText(
//                           controller.userName.value,
//                           fontSize: 18,
//                           fontWeight: AppFonts.semiBold,
//                         )),
//                       ),
//                       IconButton(
//                         onPressed: () => Get.to(() => const PersonalProfileScreen()),
//                         icon: const Icon(Icons.sync, color: AppColors.orangeColor, size: 28),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 const SizedBox(height: 25),
//
//                 /// --- Wallet Balance Card ---
//                 WalletBalanceCard(screenW: Get.width, screenH: Get.height),
//
//                 const SizedBox(height: 30),
//
//                 /// --- Grid Navigation ---
//                 LayoutBuilder(builder: (context, constraints) {
//                   int crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;
//
//                   return GridView.count(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     crossAxisCount: crossAxisCount,
//                     crossAxisSpacing: 16,
//                     mainAxisSpacing: 16,
//                     // Ratio 1.5 karne se boxes bade dikhenge jaisa aapne manga hai
//                     childAspectRatio: 1.5,
//                     children: [
//                       HomeGridButton(iconName: 'home_icon1', label: "home.familyEvents".tr, onTap: () {
//                         Get.to(const FamilyEventScreen());
//                       }),
//                       HomeGridButton(iconName: 'home_icon2', label: "home.familyBio".tr, onTap: () {
//                         Get.to(const FamilyBioScreen());
//                       }),
//                       HomeGridButton(iconName: 'home_icon3', label: "home.secretSanta".tr, onTap: () {
//                         // Get.to(GiftDetailsScreen());
//                       }),
//                       HomeGridButton(iconName: 'home_icon4', label: "home.kinshipCalculator".tr, onTap: () {
//                         Get.to(()=> KinshipResultScreen());
//
//                       }),
//                       HomeGridButton(iconName: 'home_icon5', label: "home.identityApproval".tr, onTap: () {
//                         Get.to(const IdentityApprovalsScreen());
//                       }),
//                       HomeGridButton(iconName: 'home_icon6', label: "home.migrationMap".tr, onTap: () {
//                         Get.to(()=> MigrationMapScreen());
//
//                       }),
//                     ],
//                   );
//                 }),
//                 const SizedBox(height: 30),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/features/screens/event_screen/family_event_screen.dart';
import 'package:kincore_app/features/screens/family_bio/family_bio_screen.dart';
import 'package:kincore_app/features/screens/feed_screen/save_feed_screen.dart'; // Added Save Feed
import 'package:kincore_app/features/screens/gift_and_draw_screens/gift_swap_screen.dart'; // Added Gift Swap
import 'package:kincore_app/features/screens/identity_approval/identity_approval_screen.dart';
import 'package:kincore_app/features/screens/kinship_screens/kinship_result_screen.dart';
import 'package:kincore_app/features/screens/market_place/market_place_screen.dart';
import 'package:kincore_app/features/screens/migration_map_screen/migration_map_screen.dart';
import 'package:kincore_app/features/screens/notification/notification_screen.dart';
import 'package:kincore_app/features/screens/reels/reels_screen.dart';
import 'package:kincore_app/features/screens/setting_screen/setting_screen.dart';
import 'package:kincore_app/features/screens/switch_space/switch_space_screen.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../../../core/widgets/custom_network_image.dart';
import '../profile_screens/controller/profile_controller.dart';
import '../redeem_coin_screen/widget/wallet_balance_card.dart';
import 'widget/home_grid_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 20,
        title: AppText(
            "home.title".tr,
            fontSize: 20,
            fontWeight: AppFonts.semiBold
        ),
        actions: [
          /// BELL ICON / SETTING ICON
          CustomIconButton(
            iconName: 'bell.svg',
            size: 22,
            onTap: () => Get.to(() => const NotificationScreen()),
          ),
          CustomIconButton(
            iconData: CupertinoIcons.settings,
            iconColor: AppColors.orangeColor,
            size: 22,
            onTap: () => Get.to(() => const SettingScreen()),
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// --- Profile Header (Capsule Shape) ---
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.orangeColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Row(
                    children: [
                      Obx(() => CustomNetworkImage(
                        imageUrl: controller.profileImageUrl.value,
                        height: 65,
                        width: 65,
                        borderRadius: 35,
                      )),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Obx(() => AppText(
                          controller.userName.value,
                          fontSize: 18,
                          fontWeight: AppFonts.semiBold,
                        )),
                      ),
                      IconButton(
                        onPressed: () => Get.to(() => SwitchSpaceScreen()),
                        icon: const Icon(Icons.sync, color: AppColors.orangeColor, size: 28),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                /// ISSUE 3 FIX: Ghibli Style / Animated Banner Image
                // Container(
                //   width: double.infinity,
                //   height: 150,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(20),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.black.withOpacity(0.05),
                //         blurRadius: 10,
                //         offset: const Offset(0, 4),
                //       )
                //     ],
                //   ),
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(20),
                //     child: const CustomNetworkImage(
                //       // Yahan aap backend se dynamic image URL bind kar sakte hain
                //       imageUrl: "https://media.giphy.com/media/11KzOet1ElBDz2/giphy.gif",
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),

                const SizedBox(height: 25),

                /// --- Wallet Balance Card ---
                WalletBalanceCard(screenW: Get.width, screenH: Get.height),

                const SizedBox(height: 30),

                // /// ISSUE 4 FIX: Quick Modules Horizontal List
                // AppText('home.quickModules'.tr, fontSize: 18, fontWeight: AppFonts.bold),
                // const SizedBox(height: 15),
                //
                // SizedBox(
                //   height: 100,
                //   child: ListView(
                //     scrollDirection: Axis.horizontal,
                //     physics: const BouncingScrollPhysics(),
                //     children: [
                //       // _buildQuickModuleCard(
                //       //   context: context,
                //       //   icon: Icons.account_tree_outlined,
                //       //   title: "Family Tree",
                //       //   color: Colors.green,
                //       //   onTap: () {}, // Add Tree route here
                //       // ),
                //       _buildQuickModuleCard(
                //         context: context,
                //         icon: Icons.calculate_outlined,
                //         title: 'home.calculator'.tr,
                //         color: AppColors.orangeColor,
                //         onTap: () => Get.to(() => const KinshipResultScreen()),
                //       ),
                //       _buildQuickModuleCard(
                //         context: context,
                //         icon: Icons.card_giftcard,
                //         title: 'home.giftSwap'.tr,
                //         color: AppColors.orangeColor,
                //         onTap: () => Get.to(() => const GiftSwapScreen()),
                //       ),
                //       _buildQuickModuleCard(
                //         context: context,
                //         icon: Icons.bookmark_outline,
                //         title: 'home.savedFeed'.tr,
                //         color: AppColors.orangeColor,
                //         onTap: () => Get.to(() => const SavedFeedScreen()),
                //       ),
                //     ],
                //   ),
                // ),


                /// ISSUE 4 FIX: Quick Modules Horizontal List
                /// ISSUE 2 FIX: Quick Modules inside a unified frame for perfect margin alignment
                AppText('home.quickModules'.tr, fontSize: 18, fontWeight: AppFonts.bold),
                const SizedBox(height: 15),

                Container(
                  width: double.infinity, // Ye margin ko upar-neeche ke sections se perfectly align karega
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: colors.surface,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: colors.outlineVariant.withOpacity(0.4)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.02),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded( // Expanded teeno widgets ko barabar (same size) space dega
                        child: _buildQuickModuleCard(
                          context: context,
                          icon: Icons.calculate_outlined,
                          title: 'home.calculator'.tr,
                          color: AppColors.orangeColor,
                          onTap: () => Get.to(() => const KinshipResultScreen()),
                        ),
                      ),

                      // Halka sa divider separating ke liye (Optional but looks premium)
                      Container(height: 40, width: 1, color: colors.outlineVariant.withOpacity(0.3)),

                      Expanded(
                        child: _buildQuickModuleCard(
                          context: context,
                          icon: Icons.card_giftcard,
                          title: 'home.giftSwap'.tr,
                          color: AppColors.orangeColor,
                          onTap: () => Get.to(() => const GiftSwapScreen()),
                        ),
                      ),

                      Container(height: 40, width: 1, color: colors.outlineVariant.withOpacity(0.3)),

                      Expanded(
                        child: _buildQuickModuleCard(
                          context: context,
                          icon: Icons.bookmark_outline,
                          title: 'home.savedFeed'.tr,
                          color: AppColors.orangeColor,
                          onTap: () => Get.to(() => const SavedFeedScreen()),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
                AppText('home.exploreMore'.tr, fontSize: 18, fontWeight: AppFonts.bold),
                const SizedBox(height: 15),

                /// --- Grid Navigation (Updated with Issue 2) ---
                LayoutBuilder(builder: (context, constraints) {
                  int crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;

                  return GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.5,
                    children: [
                      HomeGridButton(iconName: 'home_icon1', label: "home.familyEvents".tr, onTap: () {
                        Get.to(() => const FamilyEventScreen());
                      }),
                      HomeGridButton(iconName: 'home_icon2', label: "home.familyBio".tr, onTap: () {
                        Get.to(() => const FamilyBioScreen());
                      }),
                      HomeGridButton(iconName: 'home_icon5', label: "home.identityApproval".tr, onTap: () {
                        Get.to(() => const IdentityApprovalsScreen());
                      }),
                      HomeGridButton(iconName: 'home_icon6', label: "home.migrationMap".tr, onTap: () {
                        Get.to(() => const MigrationMapScreen());
                      }),

                      // NEW MODULES FROM ISSUE 2
                      // HomeGridButton(
                      //     iconName: 'friends_icon', // Apne assets mein friends_icon.svg add kar lijiye
                      //     label: "Friends",
                      //     onTap: () {} // Add route
                      // ),
                      HomeGridButton(
                          iconName: 'marketplace_icon',
                          label: 'home.marketplace'.tr,
                          onTap: () => Get.to(MarketplaceScreen())
                      ),
                      HomeGridButton(
                          iconName: 'reels_icon',
                          label: 'home.reels'.tr,
                          onTap: () => Get.to(ReelsScreen())
                      ),
                    ],
                  );
                }),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper Widget for Quick Modules (Fixed margin issue)
  // Helper Widget for Quick Modules
  Widget _buildQuickModuleCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap
  }) {
    final colors = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque, // Ye ensure karega ki poora hissa clickable ho
      child: Column(
        mainAxisSize: MainAxisSize.min, // Column ko infinitely bada hone se rokega
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: AppText(
              title,
              fontSize: 12,
              fontWeight: AppFonts.semiBold,
              color: colors.onSurface,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}