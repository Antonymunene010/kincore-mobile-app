import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/app_text.dart';
import '../controller/redeem_kcc_coin_controller.dart';

class RedeemCoinBalanceCard extends StatelessWidget {
  final double screenW;
  final double screenH;

  const RedeemCoinBalanceCard({
    super.key,
    required this.screenW,
    required this.screenH,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RedeemController>();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: screenH * 0.04), // Thoda bada padding image jaisa
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFF6130),
            Color(0xFFFF8C48),
            Color(0xFFFFCF71),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            "TOTAL BALANCE",
            color: AppColors.whiteColor,
            fontSize: 16,
            fontWeight: AppFonts.semiBold,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Obx(() => AppText(
                controller.coinBalance.value,
                color: AppColors.whiteColor,
                fontSize: 25, // Bada font size
                fontWeight: AppFonts.semiBold,
              )),
              const SizedBox(width: 8),
              AppText(
                "KCC",
                color: AppColors.whiteColor,
                fontSize: 20,
                fontWeight: AppFonts.semiBold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}