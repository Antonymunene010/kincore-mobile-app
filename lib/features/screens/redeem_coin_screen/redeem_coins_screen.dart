import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_text.dart';
import '../../../core/widgets/custom_icon_button.dart';
import 'controller/redeem_kcc_coin_controller.dart';
import 'widget/redeem_coin_screen_balance_card.dart';
import 'widget/way_to_earn_tile.dart';
import 'widget/way_to_redeem_card.dart';

class RedeemKCCScreen extends StatelessWidget {
  const RedeemKCCScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RedeemController());
    final double screenW = Get.width;
    final double screenH = Get.height;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText("Redeem KCC Coins", fontSize: 18, fontWeight: AppFonts.semiBold),
        actions: [
          CustomIconButton(iconName: 'bell.svg', onTap: () {}),
          SizedBox(width: screenW * 0.02),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenW * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RedeemCoinBalanceCard(screenW: screenW, screenH: screenH),
            SizedBox(height: screenH * 0.03),

            AppText("Ways to Redeem", fontSize: 18, fontWeight: AppFonts.semiBold),
            const SizedBox(height: 15),
            Obx(() => Column(
              children: controller.redeemOptions.map((data) {
                return WayToRedeemCard(
                  title: data['title'],
                  description: data['description'],
                  buttonText: data['buttonText'],
                  imageUrl: data['imageUrl'],
                  buttonIcon: data['icon'],
                  isSolidButton: data['isSolid'] ?? false,
                  onTap: () {},
                );
              }).toList(),
            )),

            SizedBox(height: screenH * 0.03),

            AppText("Ways to Earn", fontSize: 18, fontWeight: AppFonts.semiBold),
            const SizedBox(height: 15),
            Obx(() => Column(
              children: controller.earnOptions.map((data) {
                return WayToEarnTile(
                  title: data['title'],
                  subTitle: data['subTitle'],
                  icon: data['icon'],
                  onTap: () {},
                );
              }).toList(),
            )),

            SizedBox(height: screenH * 0.03),
            AppText("Recent Activity", fontSize: 18, fontWeight: AppFonts.semiBold),
            const SizedBox(height: 15),
            _buildActivityTile(),
            SizedBox(height: screenH * 0.05),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityTile() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.orangeColor.withOpacity(0.15),
            child: const Icon(Icons.shopping_bag_outlined, color: AppColors.orangeColor),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText("Vintage Case", fontSize: 14, fontWeight: AppFonts.semiBold),
                AppText("K-mall Purchase", fontSize: 12, color: Colors.grey),
              ],
            ),
          ),
          const AppText("-455KCC", fontSize: 14, fontWeight: AppFonts.bold, color: AppColors.orangeColor),
        ],
      ),
    );
  }
}