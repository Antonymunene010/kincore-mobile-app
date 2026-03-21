import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_button.dart';

class OpenScannerScreen extends StatelessWidget {
  const OpenScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final double screenW = Get.width;
    final double screenH = Get.height;

    return Scaffold(
      backgroundColor: Colors.black, // Scanner screen usually looks best with a dark background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText(
          'scanner.title'.tr,
          fontSize: 20,
          fontWeight: AppFonts.bold,
          color: Colors.white,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),

            // Subtitle
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenW * 0.1),
              child: AppText(
                'scanner.subtitle'.tr,
                fontSize: 14,
                color: Colors.white70,
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: screenH * 0.1),

            // Scanner Frame UI (Mockup for actual Camera View)
            Center(
              child: Container(
                width: screenW * 0.7,
                height: screenW * 0.7,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.orangeColor, width: 3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Yahan actual mobile_scanner ya qr_code_scanner ka widget aayega future mein
                    Container(color: Colors.white.withOpacity(0.1)),

                    // Animated scanning line (Optional for UI effect)
                    // Animated scanning line (Optional for UI effect)
                    Positioned(
                      top: screenW * 0.35,
                      child: Container(
                        width: screenW * 0.65,
                        height: 2,
                        // [FIX]: color aur boxShadow ko BoxDecoration ke andar daal diya
                        decoration: BoxDecoration(
                          color: AppColors.orangeColor,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.orangeColor,
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            // [FIX FOR CLIENT]: Upload from Gallery Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenW * 0.1, vertical: 30),
              child: CustomButton(
                text: 'scanner.galleryBtn'.tr,
                icon: Icons.photo_library_rounded,
                isIconRight: false,
                iconColor: AppColors.orangeColor,
                onPressed: () {
                  // Logic to pick image from gallery and decode QR
                  Get.snackbar("Gallery", "Opening device gallery to pick QR code...");
                },
                backgroundColor: Colors.white.withOpacity(0.15), // Semi-transparent button
                borderColor: Colors.white30,
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}