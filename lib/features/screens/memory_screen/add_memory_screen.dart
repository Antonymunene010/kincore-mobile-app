import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_text.dart';
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

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText(
          "Add Memory",
          fontSize: 20,
          fontWeight: AppFonts.semiBold,
        ),
        actions: [
          CustomIconButton(iconName: 'bell.svg', onTap: () {}),
          SizedBox(width: screenW * 0.05),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenW * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // 1. Tab Switcher (Class reused)
            Obx(
              () => MemoryTabSwitcher(
                tabs: const ["Photos", "Videos"],
                selectedTab: controller.selectedTab.value,
                onTabChanged: (tab) => controller.changeTab(tab),
              ),
            ),

            const SizedBox(height: 30),
            AppText("Add Memory", fontSize: 16, fontWeight: AppFonts.semiBold),
            const SizedBox(height: 15),

            // 2. Dotted Upload Box
            DottedContainer(
              color: AppColors.orangeColor.withOpacity(0.5),
              borderRadius: 15,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: screenH * 0.04),
                decoration: BoxDecoration(
                  color: AppColors.orangeColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    SvgPicture.asset('assets/icons/add_memory.svg'),
                    const SizedBox(height: 15),
                    Obx(
                      () => AppText(
                        "Add Memory ${controller.selectedTab.value}",
                        fontSize: 20,
                        fontWeight: AppFonts.medium,
                      ),
                    ),
                    AppText(
                      "Upload PNG, JPG File Support",
                      fontSize: 14,
                      fontWeight: AppFonts.regular,
                    ),
                    const SizedBox(height: 20),

                    // Upload Button
                    SizedBox(
                      width: 150,
                      height: 46,
                      child: CustomButton(
                        text: "Upload",
                        onPressed: () => controller.pickFiles(),
                        backgroundColor: AppColors.orangeColor.withOpacity(0.15),
                        foregroundColor: AppColors.orangeColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
            Obx(
              () => AppText(
                controller.selectedTab.value,
                fontSize: 16,
                fontWeight: AppFonts.semiBold,
              ),
            ),
            const SizedBox(height: 15),

            // 3. Selected Files Preview Grid
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
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.close,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),

      // 4. Main Save Button (Using your CustomButton)
      bottomSheet: Container(
        padding: EdgeInsets.only(
          left: screenW * 0.05,
          right: screenW * 0.05,
          bottom: screenH * 0.03, // Thoda niche se space
          top: 10,
        ),
        color: Colors.white,
        child: Obx(
          () => CustomButton(
            text: controller.selectedTab.value == "Photos"
                ? "Save Photos"
                : "Save Memory",
            onPressed: () => controller.saveMemory(),
          ),
        ),
      ),
    );
  }
}
