// import 'package:flutter/material.dart';
//
// import '../../../../core/utils/app_colors.dart';
// import '../../../../core/utils/app_fonts.dart';
// import '../../../../core/widgets/app_text.dart';
// import '../../../../core/widgets/custom_button.dart';
// import '../../../../core/widgets/custom_network_image.dart';
//
// class WayToRedeemCard extends StatelessWidget {
//   final String? title;
//   final String? description;
//   final String? buttonText;
//   final IconData? buttonIcon;
//   final String? imageUrl;
//   final VoidCallback onTap;
//   final bool isSolidButton;
//
//   const WayToRedeemCard({
//     super.key,
//     this.title,
//     this.description,
//     this.buttonText,
//     this.buttonIcon,
//     this.imageUrl,
//     required this.onTap,
//     this.isSolidButton = false,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final colors = theme.colorScheme;
//     final isDark = theme.brightness == Brightness.dark;
//
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: theme.cardColor,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(
//           color: theme.dividerColor.withOpacity(0.6),
//         ),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//
//           /// TEXT SECTION
//           Expanded(
//             flex: 3,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 AppText(
//                   title ?? "",
//                   fontSize: 16,
//                   fontWeight: AppFonts.semiBold,
//                 ),
//                 const SizedBox(height: 6),
//                 AppText(
//                   description ?? "",
//                   fontSize: 12,
//                   color: isDark
//                       ? colors.onSurface.withOpacity(0.7)
//                       : Colors.grey.shade600,
//                 ),
//                 const SizedBox(height: 14),
//
//                 /// ACTION BUTTON
//                 ConstrainedBox(
//                   constraints: const BoxConstraints(maxWidth: 160),
//                   child: CustomButton(
//                     text: buttonText ?? "",
//                     onPressed: onTap,
//                     icon: buttonIcon,
//                     height: 38,
//                     fontSize: 12,
//                     isDotted: false,
//                     backgroundColor: isSolidButton
//                         ? AppColors.orangeColor
//                         : Colors.transparent,
//                     foregroundColor: isSolidButton
//                         ? Colors.white
//                         : AppColors.orangeColor,
//                     borderColor: AppColors.orangeColor,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           const SizedBox(width: 14),
//
//           /// IMAGE SECTION
//           CustomNetworkImage(
//             imageUrl: imageUrl ?? "",
//             height: 82,
//             width: 82,
//             borderRadius: 14,
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
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
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    // --- Button Colors Logic ---
    final Color btnBgColor = isSolidButton ? AppColors.orangeColor : Colors.transparent;
    final Color btnTextColor = isSolidButton ? Colors.white : AppColors.orangeColor;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.dividerColor.withOpacity(0.6),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// TEXT SECTION
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title ?? "",
                  fontSize: 16,
                  fontWeight: AppFonts.semiBold,
                ),
                const SizedBox(height: 6),
                AppText(
                  description ?? "",
                  fontSize: 12,
                  color: isDark
                      ? colors.onSurface.withOpacity(0.7)
                      : Colors.grey.shade600,
                ),
                const SizedBox(height: 14),

                /// ACTION BUTTON (Manual fix for Light Theme Visibility)
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: btnBgColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.orangeColor),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (buttonIcon != null) ...[
                          Icon(
                            buttonIcon,
                            size: 16,
                            color: btnTextColor,
                          ),
                          const SizedBox(width: 8),
                        ],
                        AppText(
                          buttonText ?? "",
                          fontSize: 12,
                          fontWeight: AppFonts.semiBold,
                          color: btnTextColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 14),

          /// IMAGE SECTION
          CustomNetworkImage(
            imageUrl: imageUrl ?? "",
            height: 82,
            width: 82,
            borderRadius: 14,
          ),
        ],
      ),
    );
  }
}