import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/app_text.dart';
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
    // RESPONSIVE VARIABLES
    final double screenW = Get.width;
    final double screenH = Get.height;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 95, // Card ki overall height fixed rakhi hai taaki design na bigde
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: screenH * 0.015), // Responsive
              padding: EdgeInsets.all(screenW * 0.03), // Responsive
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15), // FIXED
                border: Border.all(
                  color: isActive ? AppColors.orangeColor : Colors.grey.shade300,
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
                  /// Family Image logic with Caching & Local Support
                  imageUrl.startsWith('http')
                      ? CustomNetworkImage(
                    imageUrl: imageUrl,
                    height: 60, // radius 30 ke barabar
                    width: 60,
                    borderRadius: 30, // Circle look
                  )
                      : Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  SizedBox(width: screenW * 0.04), // Responsive

                  // Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                            name,
                            fontSize: 16, // FIXED
                            fontWeight: AppFonts.semiBold
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            if (isOnline) ...[
                              const Icon(
                                Icons.circle,
                                color: Colors.green,
                                size: 10,
                              ),
                              const SizedBox(width: 5),
                              AppText(
                                "Online",
                                fontSize: 14, // FIXED
                                fontWeight: AppFonts.regular,
                                color: Colors.grey.shade600,
                              ),
                              SizedBox(width: screenW * 0.02),
                              const Icon(
                                Icons.circle,
                                color: Colors.black,
                                size: 4,
                              ),
                              SizedBox(width: screenW * 0.02),
                            ],
                            AppText(
                              "$members Member",
                              fontSize: 12, // FIXED
                              fontWeight: AppFonts.regular,
                              color: Colors.grey.shade600,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  /// Checkbox / Radio Icon
                  Icon(
                    isActive ? Icons.check_circle : Icons.radio_button_off,
                    color: isActive
                        ? AppColors.orangeColor
                        : Colors.grey.shade400,
                    size: 28, // FIXED
                  ),
                ],
              ),
            ),

            /// Active Badge (Fixed position but responsive horizontal)
            if (isActive)
              Positioned(
                top: -8,
                right: screenW * 0.04,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.orangeColor,
                    borderRadius: BorderRadius.circular(5), // FIXED
                  ),
                  child: const AppText(
                    "Active",
                    color: Colors.white,
                    fontSize: 10, // FIXED
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}