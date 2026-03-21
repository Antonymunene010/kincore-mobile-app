import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
import 'create_family_space.dart';
import 'join_options_screen.dart'; // [NEW]: Nayi screen import karni padegi

class ChooseSpaceScreen extends StatelessWidget {
  const ChooseSpaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final double screenW = Get.width;
    final double screenH = Get.height;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        backgroundColor: colors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: colors.onSurface, size: 20),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenW * 0.05, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                'chooseSpace.welcome'.tr,
                fontSize: 26,
                fontWeight: AppFonts.bold,
                color: colors.onSurface,
              ),
              const SizedBox(height: 10),
              AppText(
                'chooseSpace.subtitle'.tr,
                fontSize: 15,
                color: colors.onSurfaceVariant,
                height: 1.4,
              ),

              SizedBox(height: screenH * 0.06),

              // --- OPTION 1: CREATE NEW SPACE ---
              _buildChoiceCard(
                context: context,
                colors: colors,
                icon: Icons.add_business_rounded,
                title: 'chooseSpace.createTitle'.tr,
                subtitle: 'chooseSpace.createSubtitle'.tr,
                onTap: () {
                  Get.to(() => const CreateFamilySpaceScreen());
                },
              ),

              const SizedBox(height: 20),

              // --- OPTION 2: JOIN EXISTING SPACE ---
              _buildChoiceCard(
                context: context,
                colors: colors,
                icon: Icons.group_add_rounded,
                title: 'chooseSpace.joinTitle'.tr,
                subtitle: 'chooseSpace.joinSubtitle'.tr,
                onTap: () {
                  // [FIX]: Ab seedha Scanner pe nahi jayega, nayi Join Options screen pe jayega
                  Get.to(() => const JoinOptionsScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChoiceCard({
    required BuildContext context,
    required ColorScheme colors,
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: colors.outlineVariant.withOpacity(0.4)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.orangeColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppColors.orangeColor, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(title, fontSize: 16, fontWeight: AppFonts.bold, color: colors.onSurface),
                  const SizedBox(height: 6),
                  AppText(subtitle, fontSize: 13, color: colors.onSurfaceVariant, height: 1.3),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Icon(Icons.arrow_forward_ios, color: colors.outlineVariant, size: 16),
          ],
        ),
      ),
    );
  }

  // Widget _buildChoiceCard({
  //   required BuildContext context,
  //   required ColorScheme colors,
  //   required IconData icon,
  //   required String title,
  //   required String subtitle,
  //   required VoidCallback onTap,
  // }) {
  //   return GestureDetector(
  //     onTap: onTap,
  //     child: Container(
  //       height: 120, // [FIXED]: Dono cards ki height strictly 120 fix kar di
  //       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
  //       decoration: BoxDecoration(
  //         color: colors.surface,
  //         borderRadius: BorderRadius.circular(20),
  //         border: Border.all(color: colors.outlineVariant.withOpacity(0.4)),
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.black.withOpacity(0.03),
  //             blurRadius: 10,
  //             offset: const Offset(0, 4),
  //           )
  //         ],
  //       ),
  //       child: Row(
  //         crossAxisAlignment: CrossAxisAlignment.center, // [FIXED]: Icon aur text ko vertically center rakhega
  //         children: [
  //           Container(
  //             padding: const EdgeInsets.all(12),
  //             decoration: BoxDecoration(
  //               color: AppColors.orangeColor.withOpacity(0.1),
  //               shape: BoxShape.circle,
  //             ),
  //             child: Icon(icon, color: AppColors.orangeColor, size: 28),
  //           ),
  //           const SizedBox(width: 16),
  //           Expanded(
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center, // [FIXED]: Text ko box ke center mein rakhega
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 AppText(
  //                   title,
  //                   fontSize: 16,
  //                   fontWeight: AppFonts.bold,
  //                   color: colors.onSurface,
  //                   maxLines: 1, // [FIXED]: Title 1 line se zyada nahi lega
  //                   overflow: TextOverflow.ellipsis, // Text lamba hua to '...' aa jayega
  //                 ),
  //                 const SizedBox(height: 6),
  //                 AppText(
  //                   subtitle,
  //                   fontSize: 13,
  //                   color: colors.onSurfaceVariant,
  //                   height: 1.3,
  //                   maxLines: 2, // [FIXED]: Subtitle 2 line se zyada nahi lega
  //                   overflow: TextOverflow.ellipsis,
  //                 ),
  //               ],
  //             ),
  //           ),
  //           const SizedBox(width: 10),
  //           Icon(Icons.arrow_forward_ios, color: colors.outlineVariant, size: 16),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}