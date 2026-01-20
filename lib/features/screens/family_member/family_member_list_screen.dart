import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_text.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../../../core/widgets/custom_network_image.dart';
import '../memory_screen/widget/memory_tab.dart';
import 'controller/family_member_controller.dart';

class FamilyMemberListScreen extends StatelessWidget {
  const FamilyMemberListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Find existing controller
    final controller = Get.find<FamilyController>();
    final double screenW = Get.width;
    final double screenH = Get.height;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText("All Family Member", fontSize: 20, fontWeight: AppFonts.semiBold),
        actions: [
          CustomIconButton(iconName: 'bell.svg', onTap: () {}),
          SizedBox(width: screenW * 0.05),
        ],
      ),
      body: Column(
        children: [
          // --- TAB SWITCHER ADDED HERE ---
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenW * 0.05,
              vertical: screenH * 0.015,
            ),
            child: Obx(
                  () => MemoryTabSwitcher(
                tabs: const ["Families", "People"],
                selectedTab: controller.selectedTab.value,
                onTabChanged: (tab) => controller.changeTab(tab),
              ),
            ),
          ),

          // --- DYNAMIC LIST SECTION ---
          Expanded(
            child: Obx(() {
              // Current tab ke hisab se list select karna
              final currentList = controller.selectedTab.value == "Families"
                  ? controller.familyMembers
                  : controller.peopleMembers;

              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (currentList.isEmpty) {
                return const Center(child: AppText("No members found", fontSize: 16));
              }

              return ListView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: screenW * 0.05,
                  vertical: screenH * 0.01,
                ),
                itemCount: currentList.length,
                itemBuilder: (context, index) {
                  final member = currentList[index];

                  return Container(
                    margin: EdgeInsets.only(bottom: screenH * 0.015),
                    padding: EdgeInsets.all(screenW * 0.03),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        CustomNetworkImage(
                          imageUrl: member.image,
                          height: screenW * 0.15,
                          width: screenW * 0.15,
                          borderRadius: 50,
                        ),
                        SizedBox(width: screenW * 0.04),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                member.name,
                                fontSize: 16,
                                fontWeight: AppFonts.bold,
                              ),
                              SizedBox(height: screenH * 0.005),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.orangeColor.withOpacity(0.5),
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: AppText(
                                      member.relation,
                                      fontSize: 10,
                                      color: Colors.grey.shade700,
                                      fontWeight: AppFonts.medium,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 8),
                                    child: CircleAvatar(
                                      radius: 2,
                                      backgroundColor: Colors.grey,
                                    ),
                                  ),
                                  AppText(
                                    member.years,
                                    fontSize: 14,
                                    color: Colors.grey.shade600,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}