import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import 'package:kincore_app/core/widgets/custom_text_button.dart';
import 'package:kincore_app/features/screens/family_bio/add_familybio_screen.dart';
import 'package:kincore_app/features/screens/memory_screen/add_memory_screen.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_network_image.dart';
import '../memory_screen/memory_screen.dart';

class FamilyBioScreen extends StatelessWidget {
  const FamilyBioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final double screenW = Get.width;
    final double screenH = Get.height;

    // Dummy Data for Gallery
    final List<String> galleryImages = [
      "https://images.unsplash.com/photo-1506744038136-46273834b3fb",
      "https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05",
      "https://images.unsplash.com/photo-1441974231531-c6227db76b6e",
    ];

    return Scaffold(
      backgroundColor: colors.surface, // Theme based background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: colors.onSurface, size: 20),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.add_circle_outline, color: AppColors.orangeColor),
              onPressed: () {
                Get.to(AddFamilyBioScreen());
              }
          ),
          const SizedBox(width: 10),
        ],
        title: AppText(
            'familyBio.title'.tr,
            fontSize: 20,
            fontWeight: AppFonts.semiBold,
            color: colors.onSurface
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: screenW * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Cover Image ---
            CustomNetworkImage(
              imageUrl: "https://images.unsplash.com/photo-1493246507139-91e8fad9978e",
              height: screenH * 0.25,
              width: double.infinity,
              borderRadius: 20,
            ),

            const SizedBox(height: 20),

            // Date & Location
            AppText(
                'familyBio.migrationStoryDate'.tr,
                fontSize: 20,
                fontWeight: AppFonts.bold,
                color: AppColors.orangeColor
            ),

            const SizedBox(height: 15),

            // --- Member Info Card (Fixed Theme) ---
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                // Light orange tint works on both Dark/Light modes properly
                color: AppColors.orangeColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: AppColors.orangeColor.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage("https://i.pravatar.cc/150?u=arthur"),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        "Arthur Harrison", // API Name, no .tr needed
                        fontSize: 16,
                        fontWeight: AppFonts.semiBold,
                        color: colors.onSurface, // Adaptive Text Color
                      ),
                      AppText(
                        'familyBio.existingMember'.tr,
                        fontSize: 13,
                        // Adaptive Subtitle Color
                        color: colors.onSurface.withOpacity(0.6),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.chat_bubble_outline_rounded, color: AppColors.orangeColor),
                    onPressed: () {},
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            // --- Biography Content ---
            AppText(
              'familyBio.migrationStoryContent'.tr,
              fontSize: 14,
              height: 1.5,
              color: colors.onSurface.withOpacity(0.8), // Adaptive Body Text
            ),
            const SizedBox(height: 15),
            AppText(
              'familyBio.migrationStoryQuote'.tr,
              fontSize: 14,
              fontWeight: AppFonts.medium,
              color: colors.onSurface, // Adaptive Text
            ),

            const SizedBox(height: 25),

            // --- Gallery Section ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText('familyBio.gallery'.tr, fontSize: 18, fontWeight: AppFonts.bold, color: colors.onSurface),
                TextButton(
                  onPressed: () => Get.to(MemoriesGridScreen()),
                  child: AppText('common.viewAll'.tr, fontSize: 12, color: AppColors.orangeColor),
                ),
              ],
            ),

            // Grid for Gallery
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.0,
              ),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    CustomNetworkImage(
                      imageUrl: galleryImages[index],
                      height: double.infinity,
                      width: double.infinity,
                      borderRadius: 15,
                    ),
                    if (index == 2) // Last item showing count
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: AppText("12 +", color: Colors.white, fontSize: 18, fontWeight: AppFonts.bold),
                        ),
                      ),
                  ],
                );
              },
            ),

            const SizedBox(height: 25),

            // --- Next in History Section ---
            AppText('familyBio.nextInHistory'.tr, fontSize: 18, fontWeight: AppFonts.bold, color: colors.onSurface),
            const SizedBox(height: 10),

            // Next in History Card Theme
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                // Consistent with top card
                color: AppColors.orangeColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.orangeColor.withOpacity(0.2)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                            'familyBio.theRoaringTwenties'.tr,
                            fontSize: 16,
                            fontWeight: AppFonts.bold,
                            color: AppColors.orangeColor
                        ),
                        const SizedBox(height: 5),
                        AppText(
                          'familyBio.roaringTwentiesDate'.tr,
                          fontSize: 13,
                          color: colors.onSurface.withOpacity(0.7), // Adaptive Text
                        ),
                      ],
                    ),
                  ),
                  CustomNetworkImage(
                    imageUrl: "https://images.unsplash.com/photo-1514525253344-f81bad3b7c2a",
                    height: 60,
                    width: 100,
                    borderRadius: 12,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100), // Bottom padding
          ],
        ),
      ),
    );
  }
}