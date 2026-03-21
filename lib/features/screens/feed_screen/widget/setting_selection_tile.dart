// import 'package:flutter/material.dart';
// import '../../../../core/utils/app_colors.dart';
// import '../../../../core/widgets/app_text.dart';
//
// class SettingSelectionTile extends StatelessWidget {
//   final String title;
//   final IconData? icon; // Only change: added '?' to make it optional
//   final bool isSelected;
//   final VoidCallback onTap;
//
//   const SettingSelectionTile({
//     super.key,
//     required this.title,
//     this.icon, // Only change: removed 'required'
//     required this.isSelected,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         margin: const EdgeInsets.only(bottom: 10),
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: Colors.grey.shade300),
//         ),
//         child: Row(
//           children: [
//             // Only change: wrapped Icon and SizedBox in a null check
//             if (icon != null) ...[
//               Icon(icon!, color: AppColors.blackColor, size: 22),
//               const SizedBox(width: 12),
//             ],
//             Expanded(
//               child: AppText(title, fontSize: 14, fontWeight: FontWeight.w500),
//             ),
//             // Custom Checkbox
//             Container(
//               height: 20,
//               width: 20,
//               decoration: BoxDecoration(
//                 // color: isSelected ? AppColors.orangeColor : Colors.transparent,
//                 // borderRadius: BorderRadius.circular(6),
//                 shape: BoxShape.circle,
//                 border: Border.all(
//                   color:  AppColors.orangeColor,
//                   width: 1.5,
//                 ),
//               ),
//               child: isSelected
//                   ? const Icon(Icons.circle, color: AppColors.orangeColor, size: 10)
//                   : null,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../../../../core/widgets/app_text.dart';


class SettingSelectionTile extends StatelessWidget {
  final String title;
  final IconData? icon;
  final bool isSelected;
  final VoidCallback onTap;
  final Color? iconColor; // Naya parameter dynamic color ke liye

  const SettingSelectionTile({
    super.key,
    required this.title,
    this.icon,
    required this.isSelected,
    required this.onTap,
    this.iconColor, // Constructor mein add kiya
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // Theme based border color
          border: Border.all(
            color: isSelected ? colors.primary : colors.outlineVariant.withOpacity(0.5),
            width: isSelected ? 1.5 : 1,
          ),
          // Halka background color selection par
          color: isSelected ? colors.primary.withOpacity(0.05) : Colors.transparent,
        ),
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(
                  icon!,
                  // Agar iconColor pass kiya hai toh wo, varna theme ka onSurface
                  color: iconColor ?? colors.onSurface,
                  size: 22
              ),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: AppText(
                title,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: colors.onSurface, // Theme aware text
              ),
            ),

            /// --- Custom Radio/Checkbox ---
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? colors.primary : colors.outline,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colors.primary, // Orange color primary se aayega
                  ),
                ),
              )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}