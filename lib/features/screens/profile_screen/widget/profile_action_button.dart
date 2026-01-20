import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/app_text.dart';

class CustomProfileActionButton extends StatelessWidget {
  final String iconName; // Ab sirf file ka naam pass karein (e.g., 'edit')
  final String label;
  final VoidCallback onTap;

  const CustomProfileActionButton({
    super.key,
    required this.iconName,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final String fullSvgPath = "assets/icons/$iconName";

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: Get.height * 0.015),
          decoration: BoxDecoration(
            color: AppColors.bottomNavColor,
            borderRadius: BorderRadius.circular(13),
            border: Border.all(color: AppColors.orangeColor.withOpacity(0.3)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                fullSvgPath,
                width: 24,
                height: 24,
              ),
              const SizedBox(height: 8),
              AppText(
                label,
                fontSize: 12,
                fontWeight: AppFonts.medium,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}