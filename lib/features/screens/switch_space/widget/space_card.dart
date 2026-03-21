// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../core/utils/app_colors.dart';
// import '../../../../core/utils/app_fonts.dart';
// import '../../../../core/widgets/app_text.dart';
// import '../../../../core/widgets/custom_network_image.dart';
//
// class SpaceCard extends StatelessWidget {
//   final String name;
//   final String members;
//   final String imageUrl;
//   final bool isActive;
//   final bool isOnline;
//   final VoidCallback onTap;
//
//   const SpaceCard({
//     super.key,
//     required this.name,
//     required this.members,
//     required this.imageUrl,
//     required this.onTap,
//     this.isActive = false,
//     this.isOnline = false,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           Container(
//             margin: const EdgeInsets.only(bottom: 16, top: 5),
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               // Yahan radius badha kar 50 kiya hai taaki corners poore round (circle) dikhen
//               borderRadius: BorderRadius.circular(30),
//               border: Border.all(
//                 color: isActive ? AppColors.orangeColor : Colors.grey.shade300,
//                 width: isActive ? 2 : 1,
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.05),
//                   blurRadius: 10,
//                   offset: const Offset(0, 4),
//                 ),
//               ],
//             ),
//             child: Row(
//               children: [
//                 // Image Section
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(30),
//                   child: imageUrl.startsWith('http')
//                       ? CustomNetworkImage(
//                     imageUrl: imageUrl,
//                     height: 55,
//                     width: 55,
//                     fit: BoxFit.cover,
//                   )
//                       : Image.asset(
//                     imageUrl,
//                     height: 55,
//                     width: 55,
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) =>
//                     const Icon(Icons.group, size: 30),
//                   ),
//                 ),
//                 const SizedBox(width: 15),
//                 // Details Section
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       AppText(
//                         name,
//                         fontSize: 16,
//                         fontWeight: AppFonts.semiBold,
//                         maxLines: 1,
//                         color: AppColors.blackColor,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       const SizedBox(height: 4),
//                       SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           children: [
//                             if (isOnline) ...[
//                               const Icon(Icons.circle, color: Colors.green, size: 8),
//                               const SizedBox(width: 5),
//                               AppText("space.online".tr, fontSize: 13, color: Colors.grey.shade600),
//                               const Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 8),
//                                 child: Icon(Icons.circle, color: Colors.grey, size: 4),
//                               ),
//                             ],
//                             AppText(
//                               "space.members".trParams({'count': members}),
//                               fontSize: 13,
//                               color: Colors.grey.shade600,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Icon(
//                   isActive ? Icons.check_circle : Icons.radio_button_off,
//                   color: isActive ? AppColors.orangeColor : Colors.grey.shade400,
//                   size: 26,
//                 ),
//               ],
//             ),
//           ),
//           // Active Badge
//           if (isActive)
//             Positioned(
//               top: -2,
//               right: 35, // Right se margin thoda badhaya round corners ki wajah se
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                 decoration: BoxDecoration(
//                   color: AppColors.orangeColor,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: AppText("space.active".tr, color: Colors.white, fontSize: 10),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_network_image.dart';

class SpaceCard extends StatelessWidget {
  final String name;
  final String members;
  final String imageUrl;
  final bool isActive;
  final bool isOnline;
  final VoidCallback onTap;

  const SpaceCard({
    super.key,
    required this.name,
    required this.members,
    required this.imageUrl,
    required this.onTap,
    this.isActive = false,
    this.isOnline = false,
  });

  @override
  Widget build(BuildContext context) {
    // Theme Data fetch kar rahe hain
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 16, top: 5),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              // [FIX] Hardcoded White hata kar dynamic surface color use kiya
              color: colors.surface,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: isActive
                    ? AppColors.orangeColor
                    : colors.outlineVariant.withOpacity(0.4), // [FIX] Border color for Dark mode
                width: isActive ? 2 : 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                // Image Section
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: imageUrl.startsWith('http')
                      ? CustomNetworkImage(
                    imageUrl: imageUrl,
                    height: 55,
                    width: 55,
                    fit: BoxFit.cover,
                  )
                      : Image.asset(
                    imageUrl,
                    height: 55,
                    width: 55,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.group, size: 30, color: colors.onSurface),
                  ),
                ),
                const SizedBox(width: 15),

                // Details Section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppText(
                        name,
                        fontSize: 16,
                        fontWeight: AppFonts.semiBold,
                        maxLines: 1,
                        // [FIX] Text color dynamic (Black in Light, White in Dark)
                        color: colors.onSurface,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            if (isOnline) ...[
                              const Icon(Icons.circle, color: Colors.green, size: 8),
                              const SizedBox(width: 5),
                              AppText(
                                  "space.online".tr,
                                  fontSize: 13,
                                  // [FIX] Subtext color
                                  color: colors.onSurfaceVariant
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Icon(Icons.circle, color: colors.outline, size: 4),
                              ),
                            ],
                            AppText(
                              "space.members".trParams({'count': members}),
                              fontSize: 13,
                              // [FIX] Subtext color
                              color: colors.onSurfaceVariant,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Icon(
                  isActive ? Icons.check_circle : Icons.radio_button_off,
                  color: isActive ? AppColors.orangeColor : colors.onSurfaceVariant,
                  size: 26,
                ),
              ],
            ),
          ),

          // Active Badge
          if (isActive)
            Positioned(
              top: -2,
              right: 35,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.orangeColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: AppText("space.active".tr, color: Colors.white, fontSize: 10),
              ),
            ),
        ],
      ),
    );
  }
}