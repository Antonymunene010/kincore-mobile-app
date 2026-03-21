import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_icon_button.dart';
import 'controller/add_memory_controller.dart';
import 'widget/dotted_container.dart';
import 'widget/memory_tab.dart';

class AddMemoryScreen extends StatelessWidget {
  const AddMemoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddMemoryController());
    final double screenW = Get.width;
    final double screenH = Get.height;
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        backgroundColor: colors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: colors.onSurface, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText(
          'memory.addTitle'.tr,
          fontSize: 20,
          fontWeight: AppFonts.semiBold,
          color: colors.onSurface,
        ),
        actions: [
          CustomIconButton(iconName: 'bell.svg', onTap: () {}),
          SizedBox(width: screenW * 0.05),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenW * 0.05, vertical: screenH * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
                  () => MemoryTabSwitcher(
                tabs: ['memory.tabPhotos'.tr, 'memory.tabVideos'.tr],
                selectedTab: controller.selectedTab.value,
                onTabChanged: controller.changeTab,
              ),
            ),
            SizedBox(height: screenH * 0.03),
            AppText(
              'memory.addTitle'.tr,
              fontSize: 16,
              fontWeight: AppFonts.semiBold,
              color: colors.onSurface,
            ),
            SizedBox(height: screenH * 0.015),
            DottedContainer(
              color: colors.primary.withOpacity(0.5),
              borderRadius: 15,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: screenH * 0.04),
                decoration: BoxDecoration(
                  color: colors.primary.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    SvgPicture.asset('assets/icons/add_memory.svg'),
                    SizedBox(height: screenH * 0.015),
                    Obx(() => AppText(
                      controller.selectedTab.value == 'memory.tabPhotos'.tr
                          ? 'memory.addMemoryPhotos'.tr
                          : 'memory.addMemoryVideos'.tr,
                      fontSize: 20,
                      fontWeight: AppFonts.medium,
                      color: colors.onSurface,
                    )),
                    AppText(
                      'memory.uploadSupport'.tr,
                      fontSize: 14,
                      fontWeight: AppFonts.regular,
                      color: colors.onSurfaceVariant,
                    ),
                    SizedBox(height: screenH * 0.02),
                    SizedBox(
                      width: 150,
                      height: 46,
                      child: CustomButton(
                        text: 'common.upload'.tr,
                        onPressed: controller.pickFiles,
                        backgroundColor: colors.primary.withOpacity(0.15),
                        foregroundColor: colors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenH * 0.03),
            Obx(() => AppText(
              controller.selectedTab.value,
              fontSize: 16,
              fontWeight: AppFonts.semiBold,
              color: colors.onSurface,
            )),
            SizedBox(height: screenH * 0.015),
            Obx(
                  () => GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: controller.selectedFiles.length,
                itemBuilder: (context, index) {
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          controller.selectedFiles[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      Positioned(
                        top: -8,
                        right: -8,
                        child: GestureDetector(
                          onTap: () => controller.removeFile(index),
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: colors.onSurface.withOpacity(0.9),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.close, size: 14, color: colors.surface),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: screenH * 0.1),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.only(
          left: screenW * 0.05,
          right: screenW * 0.05,
          bottom: screenH * 0.03,
          top: 10,
        ),
        color: colors.background,
        child: Obx(
              () => CustomButton(
            text: controller.selectedTab.value == 'memory.tabPhotos'.tr ? 'common.savePhotos'.tr : 'common.saveMemory'.tr,
            onPressed: controller.saveMemory,
            backgroundColor: colors.primary,
            foregroundColor: colors.onPrimary,
          ),
        ),
      ),
    );
  }
}
