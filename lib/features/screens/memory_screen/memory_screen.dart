import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/features/screens/memory_screen/add_memory_screen.dart';

import '../../../core/models/memory_model.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../../../core/widgets/custom_network_image.dart';
import 'controller/memory_controller.dart';
import 'widget/memory_tab.dart';

class MemoriesGridScreen extends StatelessWidget {
  const MemoriesGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller initialize
    final controller = Get.put(MemoryController());

    // Theme references
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    // Responsive constants
    final double screenW = MediaQuery.of(context).size.width;
    final double paddingH = screenW * 0.05;

    return Scaffold(
      // Theme based background color
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: colors.onSurface, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText('memory.title'.tr, fontSize: 20, fontWeight: AppFonts.semiBold, color: colors.onSurface),
        // actions: [
        //   CustomIconButton(iconName: 'bell.svg', onTap: () {}),
        //   SizedBox(width: paddingH),
        // ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              // Tab Switcher with dynamic padding
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: paddingH,
                  vertical: 10,
                ),
                child: Obx(
                      () =>
                      MemoryTabSwitcher(
                        tabs: [
                          'memory.tabAll'.tr,
                          'memory.tabPhotos'.tr,
                          'memory.tabVideos'.tr
                        ],
                        selectedTab: controller.selectedTab.value,
                        onTabChanged: (tab) => controller.changeTab(tab),
                      ),
                ),
              ),

              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: colors.primary, // Theme primary color
                      ),
                    );
                  }

                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: paddingH),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // --- Photos Section ---
                        if (controller.selectedTab.value != 'memory.tabVideos'
                            .tr) ...[
                          _buildSectionTitle(
                              'memory.tabPhotos'.tr, colors.onSurface),
                          _buildMediaGrid(controller.photos, screenW),
                        ],

                        // --- Videos Section ---
                        if (controller.selectedTab.value != 'memory.tabPhotos'
                            .tr) ...[
                          _buildSectionTitle(
                              'memory.tabVideos'.tr, colors.onSurface),
                          _buildMediaGrid(
                            controller.videos,
                            screenW,
                            isVideo: true,
                          ),
                        ],

                        // Dynamic space for bottom button to prevent overlap
                        SizedBox(height: 100),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      // Theme based bottom sheet
      // bottomSheet: Container(
      //   padding: EdgeInsets.all(paddingH),
      //   decoration: BoxDecoration(
      //     color: Colors.transparent,
      //     border: Border(top: BorderSide(color: theme.dividerColor.withOpacity(0.1))),
      //   ),
      //   child: CustomButton(
      //     text: 'memory.addTitle'.tr,
      //     onPressed: () => Get.to(const AddMemoryScreen()),
      //   ),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: colors.primary,
        isExtended: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {

      }, 
         label:  AppText('memory.addTitle'.tr, fontSize: 16, fontWeight: AppFonts.semiBold, color: Colors.white),
      //'),
      //   child: CustomButton(
      //   text: 'memory.addTitle'.tr,
      //   onPressed: () => Get.to(const AddMemoryScreen()),
      // ),
      ),
    );
  }

  // --- Theme Aware Section Title ---
  Widget _buildSectionTitle(String title, Color textColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: AppText(title.tr, fontSize: 18, fontWeight: AppFonts.bold, color: textColor),
    );
  }

  // --- Responsive Media Grid ---
  Widget _buildMediaGrid(
      List<MemoryModel> items,
      double screenW, {
        bool isVideo = false,
      }) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      // 3 items in a row with responsive spacing
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.0, // Ensures square cells
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: CustomNetworkImage(
                imageUrl: isVideo ? (items[index].thumbnail ?? "") : items[index].url,
                height: double.infinity,
                width: double.infinity,
                borderRadius: 15, // Responsive rounded corners
              ),
            ),

            if (isVideo)
              Container(
                decoration: BoxDecoration(
                  color: Colors.black26, // Overlay to make icon pop
                  borderRadius: BorderRadius.circular(15),
                ),
              ),

            if (isVideo)
              const CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: Icon(Icons.play_arrow_rounded, color: Colors.black, size: 24),
              ),
          ],
        );
      },
    );
  }
}
