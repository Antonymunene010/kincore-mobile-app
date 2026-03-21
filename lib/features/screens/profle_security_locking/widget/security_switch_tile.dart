// import 'package:flutter/material.dart';
// import '../../../../core/utils/app_fonts.dart';
// import '../../../../core/widgets/app_text.dart';
// import '../../../../core/utils/app_colors.dart';
//
// class SecuritySwitchTile extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final bool value;
//   final ValueChanged<bool> onChanged;
//
//   const SecuritySwitchTile({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     required this.value,
//     required this.onChanged,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final colors = Theme.of(context).colorScheme;
//
//     return Container(
//       margin: const EdgeInsets.only(bottom: 14),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: AppColors.orangeColor.withOpacity(0.08),
//         borderRadius: BorderRadius.circular(22),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 AppText(title,
//                     fontSize: 15,
//                     fontWeight: AppFonts.bold,
//                     color: AppColors.orangeColor),
//                 const SizedBox(height: 4),
//                 AppText(subtitle,
//                     fontSize: 12,
//                     color: colors.onSurfaceVariant),
//               ],
//             ),
//           ),
//           Switch(
//             value: value,
//             onChanged: onChanged,
//             activeColor: Colors.white,
//             activeTrackColor: AppColors.orangeColor,
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/utils/app_colors.dart';

class SecuritySwitchTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SecuritySwitchTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.orangeColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.orangeColor.withOpacity(0.1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Image jaisa top align
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(title, fontSize: 16, fontWeight: AppFonts.bold, color: AppColors.orangeColor),
                const SizedBox(height: 6),
                AppText(subtitle, fontSize: 12, color: colors.onSurfaceVariant.withOpacity(0.8)),
              ],
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            height: 24, // Compact switch
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeColor: Colors.white,
              activeTrackColor: AppColors.orangeColor,
            ),
          ),
        ],
      ),
    );
  }
}