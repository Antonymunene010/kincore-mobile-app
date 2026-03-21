import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/features/screens/feed_screen/post_setting_screen.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../../../core/widgets/custom_network_image.dart';
import 'controller/create_post_controller.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreatePostController());
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    final double screenW = Get.width;
    final double screenH = Get.height;

    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, size: 18, color: colors.onBackground),
            onPressed: Get.back,
          ),
          title: AppText(
            'createPost.title'.tr,
            fontSize: 20,
            fontWeight: AppFonts.semiBold,
          ),
          actions: [
            CustomIconButton(
              iconData: CupertinoIcons.settings,
              onTap: () => Get.to(() => const PostSettingScreen()),
            ),
            SizedBox(width: screenW * 0.03),
          ],
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 900),
            child: SingleChildScrollView(
                padding: EdgeInsets.all(screenW * 0.05),
                child: Column(
                    children: [
                Container(
                padding: EdgeInsets.all(screenW * 0.045),
                decoration: BoxDecoration(
                    color: colors.surface,
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(color: colors.outline.withOpacity(0.4)),
                    boxShadow: [
                    if (!isDark)
                BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(0.04),
                  offset: const Offset(0, 8),
                ),
                    ],
                ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Obx(
                                () => Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: colors.primary, width: 2),
                              ),
                              child: CustomNetworkImage(
                                imageUrl: controller.userProfilePic.value,
                                height: screenW * 0.13,
                                width: screenW * 0.13,
                                borderRadius: 100,
                              ),
                            ),
                          ),
                          SizedBox(width: screenW * 0.035),
                          Obx(
                                () => AppText(
                              controller.userName.value,
                              fontSize: 18,
                              fontWeight: AppFonts.semiBold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenH * 0.025),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: screenW * 0.035, vertical: screenH * 0.005),
                        decoration: BoxDecoration(
                          color: isDark ? colors.surface : const Color(0xFFF9FAFB),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: colors.outline.withOpacity(0.4)),
                        ),
                        child: TextField(
                          controller: controller.postController,
                          maxLines: 6,
                          style: theme.textTheme.bodyMedium,
                          decoration: InputDecoration(
                            hintText: 'createPost.hint'.tr,
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintStyle: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
                          ),
                        ),
                      ),
                      SizedBox(height: screenH * 0.025),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: controller.addMedia,
                          icon: const Icon(CupertinoIcons.photo, size: 20, color: AppColors.orangeColor),
                          label: AppText('createPost.addMedia'.tr, fontSize: 14, fontWeight: AppFonts.medium),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: AppColors.orangeColor.withOpacity(0.12),
                            foregroundColor: AppColors.orangeColor,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ),
                      SizedBox(height: screenH * 0.02),
                      Obx(
                            () => Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: controller.selectedMedia.asMap().entries.map(
                                (entry) {
                              return Stack(
                                children: [
                                  CustomNetworkImage(imageUrl: entry.value, width: screenW * 0.22, height: screenW * 0.22, borderRadius: 14),
                                  Positioned(
                                    right: -6,
                                    top: -6,
                                    child: GestureDetector(
                                      onTap: () => controller.removeMedia(entry.key),
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                                        child: const Icon(Icons.close, size: 14, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ).toList(),
                        ),
                      ),
                      SizedBox(height: screenH * 0.03),
                      Divider(color: colors.outline.withOpacity(0.3)),
                      SizedBox(height: screenH * 0.02),
                      AppText('createPost.tagPeople'.tr, fontSize: 16, fontWeight: AppFonts.semiBold),
                      SizedBox(height: screenH * 0.012),
                      GestureDetector(
                        onTap: controller.isMemberSelectorVisible.toggle,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: screenW * 0.04, vertical: screenH * 0.018),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: colors.outline.withOpacity(0.4)),
                          ),
                          child: Row(
                            children: [
                              AppText('common.select'.tr, color: Colors.grey),
                              const Spacer(),
                              const Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                        ),
                      ),
                      Obx(
                            () => controller.isMemberSelectorVisible.value
                            ? Container(
                          height: 110,
                          margin: const EdgeInsets.only(top: 16),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.members.length,
                            itemBuilder: (context, index) {
                              final member = controller.members[index];
                              final isSelected = controller.taggedPersons.any((e) => e['id'] == member['id']);
                              return GestureDetector(
                                onTap: () => controller.toggleTag(member),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 18),
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          CustomNetworkImage(imageUrl: member['img']!, height: 58, width: 58, borderRadius: 100),
                                          if (isSelected)
                                            Positioned(
                                              right: 0,
                                              bottom: 0,
                                              child: CircleAvatar(
                                                radius: 9,
                                                backgroundColor: AppColors.orangeColor,
                                                child: const Icon(Icons.check, size: 12, color: Colors.white),
                                              ),
                                            ),
                                        ],
                                      ),
                                      const SizedBox(height: 6),
                                      AppText(member['name']!, fontSize: 11),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                            : const SizedBox(),
                      ),
                    ],
                  ),
                ),
                      SizedBox(height: screenH * 0.05),
                      CustomButton(
                        text: 'createPost.postButton'.tr,
                        onPressed: () {
                          // [FIX] Pehle keyboard close hoga taaki lag na aaye
                          FocusScope.of(context).unfocus();
                          controller.submitPost();
                        },
                        backgroundColor: AppColors.orangeColor,
                        foregroundColor: Colors.white,
                      ),
                    ],
                ),
            ),
          ),
        ),
    );
  }
}
