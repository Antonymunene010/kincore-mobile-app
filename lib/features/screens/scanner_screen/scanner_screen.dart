import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_image.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_input_field.dart';
import '../switch_space/switch_space_screen.dart';
import 'controller/scanner_controller.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  final inviteLinkController = TextEditingController();
  // Dummy link for user, aap isse controller se replace kar sakte ho
  final String myUniqueLink = "https://kincore.app/join/xyz-1234";

  @override
  void dispose() {
    inviteLinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ScannerController());
    final double screenWidth = Get.width;

    // Theme Management setup
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        backgroundColor: colors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: colors.onSurface, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText(
          'scanner.title'.tr,
          fontSize: 20,
          fontWeight: AppFonts.semiBold,
          color: colors.onSurface,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            children: [
              const SizedBox(height: 20),

              /// Scanner Placeholder
              _buildScannerPlaceholder(screenWidth, colors),

              const SizedBox(height: 20),

              AppText(
                'scanner.connect'.tr,
                fontSize: 20,
                fontWeight: AppFonts.bold,
                color: colors.onSurface,
              ),

              const SizedBox(height: 6),

              AppText(
                'scanner.instruction'.tr,
                fontSize: 14,
                textAlign: TextAlign.center,
                color: colors.onSurfaceVariant,
                fontWeight: AppFonts.regular,
              ),

              const SizedBox(height: 25),

              /// Custom Input Field for joining
              // CustomInputField(
              //   label: 'scanner.inviteLinkLabel'.tr,
              //   hint: 'scanner.inviteLinkHint'.tr,
              //   controller: inviteLinkController,
              //   prefixIcon: Icon(Icons.link, color: colors.onSurfaceVariant, size: 22),
              // ),
              //
              // const SizedBox(height: 15),
              //
              // CustomButton(
              //   text: 'scanner.joinBtn'.tr,
              //   onPressed: () {
              //     Get.to(() => const SwitchSpaceScreen());
              //   },
              //   backgroundColor: AppColors.orangeColor,
              // ),
              //
              // const SizedBox(height: 25),

              /// --- MY LINK SECTION ---
              Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                  'scanner.myLink'.tr,
                  fontSize: 14,
                  fontWeight: AppFonts.semiBold,
                  color: colors.onSurface,
                ),
              ),
              const SizedBox(height: 8),

              // Copyable Link Container
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: colors.onInverseSurface.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: colors.outlineVariant.withOpacity(0.5)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: AppText(
                        myUniqueLink, // Ye link API se aayega isliye ispe .tr nahi lagaya
                        color: colors.onSurfaceVariant,
                        fontSize: 14,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        // Clipboard me link copy karne ka logic
                        Clipboard.setData(ClipboardData(text: myUniqueLink));
                        Get.snackbar(
                          'scanner.copiedTitle'.tr,
                          'scanner.copiedMsg'.tr,
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: AppColors.orangeColor.withOpacity(0.1),
                          colorText: AppColors.orangeColor,
                          duration: const Duration(seconds: 2),
                        );
                      },
                      child: const Icon(Icons.copy, color: AppColors.orangeColor, size: 22),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 25),

              /// OR Divider
              Row(
                children: [
                  Expanded(child: Divider(thickness: 1, color: colors.outlineVariant.withOpacity(0.5))),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: AppText('scanner.or'.tr, fontWeight: AppFonts.bold, fontSize: 14, color: colors.onSurfaceVariant),
                  ),
                  Expanded(child: Divider(thickness: 1, color: colors.outlineVariant.withOpacity(0.5))),
                ],
              ),

              const SizedBox(height: 25),

              /// Outline Button (Share QR)
              CustomButton(
                text: 'scanner.shareBtn'.tr,
                icon: Icons.share,
                onPressed: () {
                  // Share Plus package will open native bottom sheet for WhatsApp, Messages, etc.
                  Share.share(
                    'scanner.shareText'.trParams({'link': myUniqueLink}),
                    subject: 'scanner.shareSubject'.tr,
                  );
                },
                backgroundColor: Colors.transparent,
                textColor: AppColors.orangeColor,
                foregroundColor: AppColors.orangeColor,
                borderColor: AppColors.orangeColor,
              ),

              const SizedBox(height: 25),

              AppText(
                'scanner.askAdmin'.tr,
                fontSize: 13,
                fontWeight: AppFonts.regular,
                textAlign: TextAlign.center,
                color: colors.onSurfaceVariant,
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildScannerPlaceholder(double screenWidth, ColorScheme colors) {
  //   return Center(
  //     child: Container(
  //       padding: const EdgeInsets.all(25),
  //       decoration: BoxDecoration(
  //         color: colors.onInverseSurface.withOpacity(0.05), // Theme based background
  //         borderRadius: BorderRadius.circular(25),
  //         border: Border.all(color: colors.outlineVariant.withOpacity(0.5)),
  //       ),
  //       child: const AppImage(
  //         imageName: "scanner.png",
  //         fit: BoxFit.contain,
  //       ),
  //     ),
  //   );
  // }

  Widget _buildScannerPlaceholder(double screenWidth, ColorScheme colors) {
    return Center(
      child: Container(
        width: screenWidth * 0.7,
        height: screenWidth * 0.7,
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: colors.onInverseSurface.withOpacity(0.05),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: AppColors.orangeColor.withOpacity(0.5), width: 2),
        ),
        child: const AppImage(
          imageName: "scanner.png",
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}