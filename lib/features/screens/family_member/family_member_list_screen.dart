import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../../../core/widgets/custom_network_image.dart';
import '../memory_screen/widget/memory_tab.dart';
import 'controller/family_member_controller.dart';

class FamilyMemberListScreen extends StatelessWidget {
  const FamilyMemberListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FamilyController());
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final double screenW = Get.width;
    final double screenH = Get.height;

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: colorScheme.onSurface, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText('memberList.title'.tr, fontSize: 20, fontWeight: AppFonts.semiBold, color: colorScheme.onSurface),
        // actions: [
        //   CustomIconButton(iconName: 'bell.svg', onTap: () {}),
        //   SizedBox(width: screenW * 0.05),
        // ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenW * 0.05, vertical: screenH * 0.015),
            child: Obx(
                  () => MemoryTabSwitcher(
                tabs: ['memberList.tabFamilies'.tr, 'memberList.tabPeople'.tr],
                selectedTab: controller.selectedTab.value,
                onTabChanged: controller.changeTab,
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              final currentList = controller.selectedTab.value == 'memberList.tabFamilies'.tr ? controller.familyMembers : controller.peopleMembers;

              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator(color: colorScheme.primary));
              }

              if (currentList.isEmpty) {
                return Center(child: AppText('memberList.noMembers'.tr, fontSize: 16, color: colorScheme.onSurface));
              }

              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: screenW * 0.05, vertical: screenH * 0.01),
                itemCount: currentList.length,
                itemBuilder: (context, index) {
                  final member = currentList[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: screenH * 0.015),
                    padding: EdgeInsets.all(screenW * 0.03),
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      border: Border.all(color: colorScheme.outlineVariant),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        CustomNetworkImage(imageUrl: member.image, height: screenW * 0.15, width: screenW * 0.15, borderRadius: 50),
                        SizedBox(width: screenW * 0.04),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(member.name, fontSize: 16, fontWeight: AppFonts.bold, color: colorScheme.onSurface),
                              SizedBox(height: screenH * 0.005),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: colorScheme.primary.withOpacity(0.5)),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: AppText(member.relation, fontSize: 10, color: colorScheme.onSurface.withOpacity(0.7), fontWeight: AppFonts.medium),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 8),
                                    child: CircleAvatar(radius: 2, backgroundColor: Colors.grey),
                                  ),
                                  AppText(member.years, fontSize: 14, color: colorScheme.onSurface.withOpacity(0.6)),
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
