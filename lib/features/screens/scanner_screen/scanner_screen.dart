import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_input_field.dart';
import '../../../core/widgets/app_image.dart';
import 'controller/scanner_controller.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  /// 1. UI Level Controller define kiya
  final inviteLinkController = TextEditingController();

  @override
  void dispose() {
    /// 2. Manual Dispose
    inviteLinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ScannerController());

    final double screenWidth = Get.width;
    // final double screenHeight = Get.height;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        // Status bar ke niche se start karne ke liye
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            children: [
              const SizedBox(height: 30),

              Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                  "Kincore",
                  fontSize: 25,
                  fontWeight: AppFonts.bold,
                  gradient: LinearGradient(
                    colors: [AppColors.primaryColor, AppColors.orangeColor],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// Scanner Placeholder
              _buildScannerPlaceholder(screenWidth),

              const SizedBox(height: 30),

              AppText(
                "Connect With Loved Ones",
                fontSize: 20,
                fontWeight: AppFonts.bold,
              ),

              const SizedBox(height: 10),

              AppText(
                "Enter An Invite Link OR code To Join\nYour Family's Space.",
                fontSize: 14,
                textAlign: TextAlign.center,
                color: AppColors.blackColor.withOpacity(0.7),
                fontWeight: AppFonts.regular,
              ),

              const SizedBox(height: 30),

              /// Custom Input Field with UI Controller
              CustomInputField(
                label: "Invite Link",
                hint: "https://family.app/join/....",
                controller: inviteLinkController, // UI Controller
                prefixIcon: const Icon(Icons.link, color: Colors.black, size: 22),
              ),

              const SizedBox(height: 20),

              CustomButton(
                text: "Join Space",
                onPressed: () => controller.joinSpace(
                  inviteLink: inviteLinkController.text,
                ),
              ),

              const SizedBox(height: 20),

              /// OR Divider
              Row(
                children: [
                  const Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: AppText("OR", fontWeight: AppFonts.bold, fontSize: 14, color: Colors.grey),
                  ),
                  const Expanded(child: Divider(thickness: 1)),
                ],
              ),

              const SizedBox(height: 20),

              /// Outline Button (Share QR)
              CustomButton(
                text: "Share QR Code",
                icon: Icons.share,
                onPressed: () => controller.shareQRCode(),
                backgroundColor: Colors.white,
                foregroundColor: AppColors.orangeColor,
                borderColor: AppColors.orangeColor,
              ),

              const SizedBox(height: 25),

              AppText(
                "Ask a family Admin to Show you their QR\nCode From Their Profile Settings.",
                fontSize: 13,
                fontWeight: AppFonts.regular,
                textAlign: TextAlign.center,
                color: Colors.grey.shade600,
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScannerPlaceholder(double screenWidth) {
    return Center(
      child: Container(
        width: screenWidth * 0.65,
        height: screenWidth * 0.65,
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.05),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.grey.withOpacity(0.1)),
        ),
        child: const AppImage(
          imageName: "scanner.png",
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}