import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/features/screens/memory_screen/add_memory_screen.dart';
import '../../../core/models/memory_model.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_text.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../../../core/widgets/custom_network_image.dart';
import 'controller/memory_controller.dart';
import 'widget/memory_tab.dart';

class MemoriesGridScreen extends StatelessWidget {
  const MemoriesGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MemoryController());
    final double screenW = Get.width;
    final double screenH = Get.height;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText("Memory", fontSize: 20, fontWeight: AppFonts.semiBold),
        actions: [
          CustomIconButton(iconName: 'bell.svg', onTap: () {}),
          SizedBox(width: screenW * 0.05),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenW * 0.05,
              vertical: 10,
            ),
            child: Obx(
                  () => MemoryTabSwitcher(
                tabs: const ["All", "Photos", "Videos"],
                selectedTab: controller.selectedTab.value,
                onTabChanged: (tab) => controller.changeTab(tab),
              ),
            ),
          ),

          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.orangeColor,
                  ),
                );
              }
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: screenW * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (controller.selectedTab.value != "Videos") ...[
                      _buildSectionTitle("Photos"),
                      _buildMediaGrid(controller.photos, screenW),
                    ],
                    if (controller.selectedTab.value != "Photos") ...[
                      _buildSectionTitle("Videos"),
                      _buildMediaGrid(
                        controller.videos,
                        screenW,
                        isVideo: true,
                      ),
                    ],
                    SizedBox(height: screenH * 0.15), // Space for bottom button
                  ],
                ),
              );
            }),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(screenW * 0.05),
        color: Colors.white,
        child: CustomButton(
          text: "Add Memory",
          onPressed: () {
            Get.to(const AddMemoryScreen());
          },
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: AppText(title, fontSize: 18, fontWeight: AppFonts.bold),
    );
  }

  Widget _buildMediaGrid(
      List<MemoryModel> items,
      double screenW, {
        bool isVideo = false,
      }) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Stack(
          alignment: Alignment.center,
          children: [
            // --- UPDATED: CACHED NETWORK IMAGE APPLIED HERE ---
            CustomNetworkImage(
              imageUrl: isVideo ? (items[index].thumbnail ?? "") : items[index].url,
              height: double.infinity,
              width: double.infinity,
              borderRadius: 12, // Same as your previous ClipRRect radius
            ),

            if (isVideo)
              const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white70,
                child: Icon(Icons.play_arrow, color: Colors.black, size: 22),
              ),
          ],
        );
      },
    );
  }
}