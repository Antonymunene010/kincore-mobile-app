import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';

class CustomProfileActionButton extends StatelessWidget {
  final String iconName;
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

    return GestureDetector(
      onTap: onTap,
      child: Container(
        // Height fix kar di hai taaki 1-line aur 2-line wale buttons same dikhein
        height: Get.height * 0.11,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors.bottomNavColor,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(color: AppColors.orangeColor.withOpacity(0.3)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Vertically Center
          crossAxisAlignment: CrossAxisAlignment.center, // Horizontally Center
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
              textAlign: TextAlign.center, // Text hamesha center rahega
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}