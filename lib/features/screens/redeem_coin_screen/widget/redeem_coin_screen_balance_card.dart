import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
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
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: screenH * 0.04),
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
            'redeem.totalBalance'.tr,
            color: Colors.white,
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
                color: Colors.white,
                fontSize: 25,
                fontWeight: AppFonts.semiBold,
              )),
              const SizedBox(width: 8),
              AppText(
                'KCC',
                color: Colors.white,
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
