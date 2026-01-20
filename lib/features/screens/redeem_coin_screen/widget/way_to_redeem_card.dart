import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/app_text.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_network_image.dart';

class WayToRedeemCard extends StatelessWidget {
  final String? title;
  final String? description;
  final String? buttonText;
  final IconData? buttonIcon;
  final String? imageUrl;
  final VoidCallback onTap;
  final bool isSolidButton;

  const WayToRedeemCard({
    super.key,
    this.title,
    this.description,
    this.buttonText,
    this.buttonIcon,
    this.imageUrl,
    required this.onTap,
    this.isSolidButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // Vertically center karne ke liye
        children: [
          Expanded(
            flex: 3, // Flex thoda badha diya taaki text ko zyada jagah mile
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title ?? "",
                  fontSize: 16,
                  fontWeight: AppFonts.semiBold,
                ),
                const SizedBox(height: 4),
                AppText(
                  description ?? "",
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(height: 12),

                // Fixed: Width 140 hata kar responsive kiya hai
                SizedBox(
                  width: double.infinity, // Max available width lega
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 150), // Maximum limit set kar di
                      child: CustomButton(
                        text: buttonText ?? "",
                        onPressed: onTap,
                        icon: buttonIcon,
                        height: 38,
                        fontSize: 12,
                        isDotted: false,
                        backgroundColor: isSolidButton ? AppColors.orangeColor : Colors.transparent,
                        foregroundColor: isSolidButton ? Colors.white : AppColors.orangeColor,
                        borderColor: AppColors.orangeColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Image Section
          CustomNetworkImage(
            imageUrl: imageUrl ?? "",
            height: 80,
            width: 80,
            borderRadius: 12,
          ),
        ],
      ),
    );
  }
}