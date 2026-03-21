import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_icon_button.dart';
import 'controller/create_post_controller.dart';
import 'widget/setting_selection_tile.dart';

class PostSettingScreen extends StatelessWidget {
  const PostSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.find ka use kiya hai kyunki controller pehle se bana hoga
    final controller = Get.find<CreatePostController>();

    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final double screenW = Get.width;
    final double screenH = Get.height;

    return Scaffold(
      backgroundColor: colors.surface, // Theme based background
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: colors.surface,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: colors.onSurface, size: 18),
          onPressed: () => Get.back(),
        ),
        title: AppText(
          'postSettings.title'.tr,
          fontSize: 20,
          fontWeight: AppFonts.semiBold,
          color: colors.onSurface,
        ),
        // actions: [
        //   CustomIconButton(
        //     iconName: 'bell.svg',
        //     onTap: () {},
        //   ),
        //   const SizedBox(width: 10),
        // ],
      ),
      body: SingleChildScrollView(
        // Responsive padding using screen width
        padding: EdgeInsets.symmetric(horizontal: screenW * 0.05, vertical: 15),
        child: Column(
          children: [
            // --- MAIN CONTENT BOX ---
            Container(
              padding: EdgeInsets.all(screenW * 0.05),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: colors.surface, // Adapt to theme
                border: Border.all(
                    color: colors.outlineVariant.withOpacity(0.5),
                    width: 1.5
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    'postSettings.postSettings'.tr,
                    fontSize: 24,
                    fontWeight: AppFonts.medium,
                    color: colors.onSurface,
                  ),
                  SizedBox(height: screenH * 0.03),

                  // Section 1: Who can see
                  _buildSectionHeader(context, 'postSettings.whoCanSee'.tr),
                  SizedBox(height: screenH * 0.02),
                  Obx(
                        () => Column(
                      children: [
                        SettingSelectionTile(
                          title: 'postSettings.visibility.public'.tr,
                          isSelected: controller.visibility.value == "Public",
                          onTap: () => controller.visibility.value = "Public",
                        ),
                        SettingSelectionTile(
                          title: 'postSettings.visibility.friends'.tr,
                          isSelected: controller.visibility.value == "Friends",
                          onTap: () => controller.visibility.value = "Friends",
                        ),
                        SettingSelectionTile(
                          title: 'postSettings.visibility.friendsExcept'.tr,
                          isSelected: controller.visibility.value == "me",
                          onTap: () => controller.visibility.value = "me",
                        ),
                        SettingSelectionTile(
                          title: 'postSettings.visibility.specificFriends'.tr,
                          isSelected: controller.visibility.value == "sf",
                          onTap: () => controller.visibility.value = "sf",
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: screenH * 0.03),

                  // Section 2: Who can comment
                  _buildSectionHeader(context, 'postSettings.whoCanComment'.tr),
                  SizedBox(height: screenH * 0.02),
                  Obx(
                        () => Column(
                      children: [
                        SettingSelectionTile(
                          title: 'postSettings.comments.followersOnly'.tr,
                          icon: CupertinoIcons.globe,
                          isSelected: controller.commentPrivacy.value == "followers",
                          onTap: () => controller.commentPrivacy.value = "followers",
                        ),
                        SettingSelectionTile(
                          title: 'postSettings.comments.friends'.tr,
                          icon: CupertinoIcons.person_2,
                          isSelected: controller.commentPrivacy.value == "Friends",
                          onTap: () => controller.commentPrivacy.value = "Friends",
                        ),
                        SettingSelectionTile(
                          title: 'postSettings.comments.chosenFriends'.tr,
                          icon:  CupertinoIcons.person,
                          isSelected: controller.commentPrivacy.value == "Chosen Friends",
                          onTap: () => controller.commentPrivacy.value = "Chosen Friends",
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
              text: 'postSettings.saveChanges'.tr,
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    final colors = Theme.of(context).colorScheme;
    return AppText(
      title,
      fontWeight: AppFonts.medium,
      fontSize: 14,
      color: colors.onSurface.withOpacity(0.8), // Softer color for headers
    );
  }
}
