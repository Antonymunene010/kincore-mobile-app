import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/features/screens/scanner_screen/open_scanner_screen.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
import '../find_family_member/find_your_self.dart';
import '../scanner_screen/scanner_screen.dart';
import 'url_join_screen.dart'; // Find Yourself ka route

class JoinOptionsScreen extends StatelessWidget {
  const JoinOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final double screenW = Get.width;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        backgroundColor: colors.surface,
        elevation: 0,
        title: AppText(
          'joinOptions.title'.tr,
          fontSize: 20,
          fontWeight: AppFonts.bold,
          color: colors.onSurface,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: colors.onSurface, size: 20),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenW * 0.05, vertical: 20),
          child: Column(
            children: [
              // Option 1: QR Code
              _buildOptionCard(
                colors: colors,
                icon: Icons.qr_code_scanner_rounded,
                title: 'joinOptions.scanTitle'.tr,
                subtitle: 'joinOptions.scanSub'.tr,
                onTap: () {
                  Get.to(() => const OpenScannerScreen());
                },
              ),
              const SizedBox(height: 15),

              // Option 2: Join via URL
              _buildOptionCard(
                colors: colors,
                icon: Icons.link_rounded,
                title: 'joinOptions.urlTitle'.tr,
                subtitle: 'joinOptions.urlSub'.tr,
                onTap: () {
                  Get.to(() => const UrlJoinScreen());
                },
              ),
              const SizedBox(height: 15),

              // Option 3: Find Yourself
              _buildOptionCard(
                colors: colors,
                icon: Icons.person_search_rounded,
                title: 'joinOptions.findTitle'.tr,
                subtitle: 'joinOptions.findSub'.tr,
                onTap: () {
                  Get.to(() => const FindYourselfScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Widget for List Items
  Widget _buildOptionCard({
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
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: colors.outlineVariant.withOpacity(0.3)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 8,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.orangeColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppColors.orangeColor, size: 24),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(title, fontSize: 16, fontWeight: AppFonts.semiBold, color: colors.onSurface),
                  const SizedBox(height: 4),
                  AppText(subtitle, fontSize: 13, color: colors.onSurfaceVariant),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios_rounded, size: 16, color: colors.outlineVariant),
          ],
        ),
      ),
    );
  }
}