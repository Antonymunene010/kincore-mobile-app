import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kincore_app/features/screens/redeem_coin_screen/redeem_coins_screen.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/app_text.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../profile_screen/controller/profile_controller.dart';

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
          padding: EdgeInsets.all(screenW * 0.04),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFFF6130),
                Color(0xFFFF8C48), // Smooth transition ke liye extra color
                Color(0xFFFFCF71),
              ],
            ),
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: AppText(
                  'TOTAL BALANCE',
                  fontWeight: AppFonts.semiBold,
                  color: AppColors.whiteColor,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Dollar/Coin Icon
                  SvgPicture.asset(
                    'assets/icons/wallet_coin.svg', // Aapka SVG path yahan aayega
                  ),
                  const SizedBox(width: 5),
                  // Coin Count from API/Controller
                  Obx(
                    () => AppText(
                      "${controller.coinBalance.value}", // Controller mein coinBalance variable hona chahiye
                      fontSize: 24,
                      fontWeight: AppFonts.semiBold,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenH * 0.02),

              /// View Wallet / Transaction Button
              CustomButton(
                text: "Redeem Coins",
                width: 250,
                height: 40,
                foregroundColor: AppColors.orangeColor,
                onPressed: () {
                  Get.to(RedeemKCCScreen());
                },
                backgroundColor: AppColors.whiteColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
