import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_text.dart';
import '../../../core/widgets/custom_button.dart';
import 'controller/create_post_controller.dart';
import 'widget/setting_selection_tile.dart'; // Same controller use kar sakte ho

class PostSettingScreen extends StatelessWidget {
  const PostSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreatePostController>();
    final double screenW = Get.width;
    final double screenH = Get.height;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: AppText(
          "Post Setting",
          fontSize: 20,
          fontWeight: AppFonts.semiBold,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenW * 0.05),
        child: Column(
          children: [
            // --- MAIN CONTENT BOX ---
            Container(
              padding: EdgeInsets.all(screenW * 0.05),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade200, width: 1.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    "Post Settings",
                    fontSize: 24,
                    fontWeight: AppFonts.medium,
                  ),
                  SizedBox(height: screenH * 0.03),

                  // Section 1: Who can see
                  AppText(
                    "Who can see your posts?",
                    fontWeight: AppFonts.medium,
                    fontSize: 16,
                  ),
                  SizedBox(height: screenH * 0.02),
                  Obx(
                    () => Column(
                      children: [
                        SettingSelectionTile(
                          title: "Any Scholarr",
                          icon: CupertinoIcons.globe,
                          isSelected: controller.visibility.value == "any",
                          onTap: () => controller.visibility.value = "any",
                        ),
                        SettingSelectionTile(
                          title: "Your Followers only",
                          icon: CupertinoIcons.person_2,
                          isSelected:
                              controller.visibility.value == "followers",
                          onTap: () =>
                              controller.visibility.value = "followers",
                        ),
                        SettingSelectionTile(
                          title: "Only me",
                          icon: CupertinoIcons.person,
                          isSelected: controller.visibility.value == "me",
                          onTap: () => controller.visibility.value = "me",
                        ),
                      ],
                    ),
                  ),

                  /// Who can comment Dropdown style tile
                  // Container(
                  //   padding: const EdgeInsets.symmetric(
                  //     horizontal: 16,
                  //     vertical: 14,
                  //   ),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(12),
                  //     border: Border.all(color: Colors.grey.shade300),
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       Icon(
                  //         CupertinoIcons.chat_bubble_2,
                  //         color: AppColors.blackColor,
                  //       ),
                  //       const SizedBox(width: 12),
                  //       Expanded(
                  //         child: AppText("Who can comment?", fontSize: 16),
                  //       ),
                  //       const Icon(
                  //         Icons.keyboard_arrow_down,
                  //         color: Colors.grey,
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  SizedBox(height: screenH * 0.03),

                  // Section 2: Who can comment
                  AppText(
                    "Who can comment on this post?",
                    fontWeight: AppFonts.medium,
                    fontSize: 16,
                  ),
                  SizedBox(height: screenH * 0.02),
                  Obx(
                    () => Column(
                      children: [
                        SettingSelectionTile(
                          title: "Any Scholarr",
                          icon: CupertinoIcons.globe,
                          isSelected: controller.commentPrivacy.value == "any",
                          onTap: () => controller.commentPrivacy.value = "any",
                        ),
                        SettingSelectionTile(
                          title: "Your Followers only",
                          icon: CupertinoIcons.person_2,
                          isSelected:
                              controller.commentPrivacy.value == "followers",
                          onTap: () =>
                              controller.commentPrivacy.value = "followers",
                        ),
                        SettingSelectionTile(
                          title: "Nobody",
                          icon: CupertinoIcons.person_crop_circle_badge_xmark,
                          isSelected:
                              controller.commentPrivacy.value == "nobody",
                          onTap: () =>
                              controller.commentPrivacy.value = "nobody",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: screenH * 0.05),

            // Save Button
            CustomButton(
              text: "Save Changes",
              onPressed: () {
                // Logic to save settings
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
