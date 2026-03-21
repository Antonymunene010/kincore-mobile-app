import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/features/screens/change_relationship_screen/change_relationship_screen.dart';
import 'package:kincore_app/features/screens/feed_screen/save_feed_screen.dart';
import 'package:kincore_app/features/screens/find_family_member/find_your_self.dart';
import 'package:kincore_app/features/screens/gift_and_draw_screens/gift_swap_screen.dart';
import 'package:kincore_app/features/screens/k_mall/order_history_screen.dart';
import 'package:kincore_app/features/screens/notification/notification_screen.dart';
import 'package:kincore_app/features/screens/profle_security_locking/profile_security_screen.dart';
import 'package:kincore_app/features/screens/request_history_screen/requeast_history_screen.dart';
import 'package:kincore_app/features/screens/role_access_screen/role_access_screen.dart';
import 'package:kincore_app/features/screens/seller_dashboard/my_listing_screen.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_theme_controller.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_network_image.dart';
import '../change_relationship_screen/change_relationship_screen.dart';
import '../mode_theme_screens/mode_theme_screen.dart';
import '../profile_screens/controller/profile_controller.dart';
import '../profile_screens/edit_profile_screen.dart';
import '../profile_screens/widget/profile_action_button.dart';
import '../profle_security_locking/profile_security_screen.dart';
import '../redeem_coin_screen/widget/wallet_balance_card.dart';
import 'contoller/setting_controller.dart';
import '../profile_screens/widget/profile_menu_tile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dataController = Get.find<ProfileController>();
    final settingController = Get.put(SettingController());
    final themeController = Get.find<ThemeController>();

    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final screenW = Get.width;
    final screenH = Get.height;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: colors.onSurface),
          onPressed: () => Get.back(),
        ),
        // [FIXED]: Hardcoded "Settings" ko localize kiya
        title: AppText('profile.settings'.tr, fontSize: 20, fontWeight: AppFonts.bold, color: colors.onSurface),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: AppText("profile.account".tr, fontSize: 18, fontWeight: AppFonts.bold),
            ),
            const SizedBox(height: 15),

            /// ---------------- Account Tiles ----------------
            ProfileMenuTile(
              icon: Icons.person_outline_rounded,
              title: "profile.personalInfo".tr,
              subtitle: "profile.personalInfoSub".tr,
              onTap: () {},
            ),
            ProfileMenuTile(
              icon: Icons.verified_user_outlined,
              title: "profile.privacy".tr,
              subtitle: "profile.privacySub".tr,
              onTap: () => Get.to(() => const ProfileSecurityScreen()),
            ),
            ProfileMenuTile(
              icon: Icons.notifications_none_rounded,
              title: "profile.notifications".tr,
              subtitle: "profile.notificationsSub".tr,
              onTap: () => Get.to(() => const NotificationScreen()),
            ),
            ProfileMenuTile(
              icon: Icons.history_toggle_off,
              title: 'profile.requestHistory'.tr,
              subtitle: 'profile.requestHistorySub'.tr,
              onTap: () => Get.to(() => const RequestHistoryScreen()),
            ),
            ProfileMenuTile(
              icon: Icons.dynamic_feed,
              title: 'profile.saveFeed'.tr,
              subtitle: 'profile.saveFeedSub'.tr,
              onTap: () => Get.to(() => const SavedFeedScreen()),
            ),
            ProfileMenuTile(
              icon: Icons.card_giftcard,
              title: 'profile.giftSwap'.tr,
              subtitle: 'profile.giftSwapSub'.tr,
              onTap: () => Get.to(() => const GiftSwapScreen()),
            ),
            ProfileMenuTile(
              icon: Icons.brightness_6_outlined,
              title: 'profile.displayMode'.tr,
              subtitle: 'profile.displayModeSub'.tr,
              onTap: () => Get.to(() => const ModeThemeScreen()),
            ),
            ProfileMenuTile(
              icon: Icons.shopping_bag_outlined,
              title: 'profile.myOrders'.tr,
              subtitle: 'profile.myOrdersSub'.tr,
              onTap: () => Get.to(OrderHistoryScreen()),
            ),

            ProfileMenuTile(
              icon: Icons.list_alt_rounded,
              title: "profile.myListings".tr,
              subtitle: "profile.myListingsSub".tr,
              onTap: () => Get.to( MyListingsScreen()),
            ),

            const SizedBox(height: 30),

            // Logout with project's style
            TextButton.icon(
              onPressed: () => settingController.logout(),
              icon: const Icon(Icons.logout_rounded, color: AppColors.orangeColor),
              label:  AppText("profile.logout".tr, fontSize: 18, color: AppColors.orangeColor, fontWeight: AppFonts.semiBold),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}