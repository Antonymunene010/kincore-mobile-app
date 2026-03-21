import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_network_image.dart';

class YourStoryScreen extends StatelessWidget {
  const YourStoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    // Dummy gallery images
    final List<String> galleryImages = [
      "https://images.unsplash.com/photo-1511895426328-dc8714191300",
      "https://images.unsplash.com/photo-1544005313-94ddf0286df2",
      "https://images.unsplash.com/photo-1529333166437-7750a6dd5a70",
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
      "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d",
      "https://images.unsplash.com/photo-1517841905240-472988babdf9",
    ];

    return Scaffold(
      // Camera screen hamesha dark background par achi lagti hai
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            /// 1. CAMERA PREVIEW PLACEHOLDER
            // Yahan par actual Camera plugin ka preview aayega future mein
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt_outlined, size: 60, color: Colors.white.withOpacity(0.5)),
                      const SizedBox(height: 10),
                      AppText("Camera View", color: Colors.white.withOpacity(0.5)),
                    ],
                  ),
                ),
              ),
            ),

            /// 2. TOP CONTROLS (Close, Flash, Settings)
            Positioned(
              top: 15,
              left: 15,
              right: 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white, size: 30),
                    onPressed: () => Get.back(),
                  ),
                  IconButton(
                    icon: const Icon(Icons.flash_off, color: Colors.white, size: 28),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings, color: Colors.white, size: 28),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            /// 3. BOTTOM SHEET STYLE GALLERY & SHUTTER
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.only(top: 20, bottom: 30),
                decoration: BoxDecoration(
                  // Theme ke hisaab se bottom sheet ka color
                  color: isDark ? colors.surface : Colors.white,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, -5))
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Sheet Drag Indicator
                    Container(
                      width: 40,
                      height: 5,
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: colors.outlineVariant.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                    // Gallery Horizontal List
                    SizedBox(
                      height: 80,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        scrollDirection: Axis.horizontal,
                        itemCount: galleryImages.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: GestureDetector(
                              onTap: () {
                                // Image select karne ka logic
                                Get.snackbar("Image Selected", "You selected an image from gallery.", snackPosition: SnackPosition.TOP);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: CustomNetworkImage(
                                  imageUrl: galleryImages[index],
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Camera Controls (Gallery Icon, Shutter Button, Flip Camera)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Open Full Gallery Button
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: colors.surfaceVariant.withOpacity(0.3),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.photo_library, color: colors.onSurface, size: 26),
                          ),

                          // Main Shutter Button
                          GestureDetector(
                            onTap: () {
                              // Photo click karne ka logic
                            },
                            child: Container(
                              height: 75,
                              width: 75,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.orangeColor, width: 4),
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: AppColors.orangeColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),

                          // Flip Camera Button
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: colors.surfaceVariant.withOpacity(0.3),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.flip_camera_ios, color: colors.onSurface, size: 26),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}