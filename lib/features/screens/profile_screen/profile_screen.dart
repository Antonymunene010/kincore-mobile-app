import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/features/screens/memory_screen/add_memory_screen.dart';
import 'package:kincore_app/features/screens/profile_screen/edit_profile_screen.dart';
import '../../../core/models/memory_model.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_text.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../../../core/widgets/custom_network_image.dart';
import '../add_members/add_parents.dart';
import '../family_member/controller/family_member_controller.dart';
import '../memory_screen/controller/memory_controller.dart';
import '../memory_screen/memory_screen.dart';
import 'controller/profile_controller.dart';
import '../family_member/family_member_list_screen.dart';
import 'widget/profile_action_button.dart';
import '../redeem_coin_screen/widget/wallet_balance_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    final familyController = Get.put(FamilyController());
    final memoryController = Get.put(MemoryController());

    final double screenW = Get.width;
    final double screenH = Get.height;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        // --- YE LINES ADD KI HAIN COLOR FIX KARNE KE LIYE ---
        surfaceTintColor: Colors.transparent, // Purple tint hatane ke liye
        scrolledUnderElevation: 0, // Scroll karne par shadow/color na badle
        elevation: 0,
        automaticallyImplyLeading: false,
        title: AppText("My Profile", fontSize: 20, fontWeight: AppFonts.semiBold),
        actions: [
          CustomIconButton(iconName: 'bell.svg', onTap: () {}),
          SizedBox(width: screenW * 0.02),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenW * 0.05),
        child: Column(
          children: [
            /// 1. Profile Header Box
            Container(
              padding: EdgeInsets.all(screenW * 0.04),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Obx(
                        () => CustomNetworkImage(
                          imageUrl: controller.profileImageUrl.value,
                          height: 100,
                          width: 100,
                          borderRadius: 50,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: AppColors.whiteColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.add_a_photo,
                            size: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenH * 0.015),
                  Obx(
                    () => AppText(
                      controller.userName.value,
                      fontSize: 20,
                      fontWeight: AppFonts.semiBold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        () => AppText(
                          controller.lifeSpan.value,
                          fontWeight: AppFonts.medium,
                          fontSize: 14,
                          color: AppColors.blackColor,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.orangeColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Obx(
                          () => AppText(
                            controller.relationBadge.value,
                            color: AppColors.orangeColor,
                            fontSize: 10,
                            fontWeight: AppFonts.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenH * 0.02),
                  Row(
                    children: [
                      CustomProfileActionButton(
                        iconName: 'edit.svg',
                        label: "Edit Profile",
                        onTap: () => Get.to(const EditProfileScreen()),
                      ),
                      SizedBox(width: screenW * 0.02),
                      CustomProfileActionButton(
                        iconName: 'add_icon.svg',
                        label: "Add Member",
                        onTap: () => Get.to(AddParentsScreen()),
                      ),
                      SizedBox(width: screenW * 0.02),
                      CustomProfileActionButton(
                        iconName: 'camera_upload.svg',
                        label: "Add Memory",
                        onTap: () => Get.to(const AddMemoryScreen()),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: screenH * 0.03),

            /// 2. Total Balance / Wallet Section (Naya Section)
            WalletBalanceCard(screenW: screenW, screenH: screenH),

            SizedBox(height: screenH * 0.03),

            /// 3. Vital Statistics (Moved above border as requested)
            _buildSectionHeader("Vital Statistics", screenW),
            Container(
              padding: EdgeInsets.all(screenW * 0.04),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  _buildStatRow("Full Name", "Eleanor Rigby"),
                  _buildStatRow("Born", "May 12, 1920"),
                  _buildStatRow("Location", "London, UK"),
                  _buildStatRow(
                    "Occupation",
                    "Rice Cleaner At Church",
                    isLast: true,
                  ),
                ],
              ),
            ),

            SizedBox(height: screenH * 0.03),

            /// 4. Family Members
            _buildSectionHeader(
              "Family Member",
              screenW,
              fontSize: 16,
              hasViewAll: true,
              onViewAll: () => Get.to(() => const FamilyMemberListScreen()),
            ),
            SizedBox(
              height: 130,
              child: Obx(
                () => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: familyController.familyMembers.length,
                  itemBuilder: (context, index) {
                    final member = familyController.familyMembers[index];
                    return Padding(
                      padding: EdgeInsets.only(right: screenW * 0.05),
                      child: Column(
                        children: [
                          CustomNetworkImage(
                            imageUrl: member.image,
                            height: 60,
                            width: 60,
                            borderRadius: 30,
                          ),
                          const SizedBox(height: 8),
                          AppText(
                            member.relation,
                            fontSize: 14,
                            fontWeight: AppFonts.semiBold,
                          ),
                          AppText(
                            member.name,
                            fontSize: 10,
                            fontWeight: AppFonts.medium,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            /// 5. Key Life Events
            _buildSectionHeader("Key Life Events", screenW),
            Container(
              padding: EdgeInsets.all(screenW * 0.04),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  _buildTimelineItem(
                    "1920",
                    "Born In Liverpool",
                    "May 12th, to john and mary Rigby",
                    screenH,
                  ),
                  _buildTimelineItem(
                    "1945",
                    "Marriage To Paul Mckenzie",
                    "",
                    screenH,
                  ),
                  _buildTimelineItem(
                    "2005",
                    "Passed Away",
                    "Aged 85 Buried at St. Peter's Church",
                    screenH,
                    isLast: true,
                  ),
                  SizedBox(height: screenH * 0.01),
                  CustomButton(
                    text: "View More Timeline",
                    onPressed: () {},
                    backgroundColor: AppColors.orangeColor.withOpacity(0.1),
                    foregroundColor: AppColors.orangeColor,
                    borderColor: Colors.transparent,
                  ),
                ],
              ),
            ),

            SizedBox(height: screenH * 0.03),

            /// 6. Memories
            _buildSectionHeader(
              "Memories",
              screenW,
              hasViewAll: true,
              onViewAll: () => Get.to(() => const MemoriesGridScreen()),
            ),

            Obx(() {
              if (memoryController.isLoading.value)
                return const Center(child: CircularProgressIndicator());
              var displayList = memoryController.allMemories;
              int totalItems = displayList.length;
              int displayCount = totalItems > 3 ? 3 : totalItems;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: displayCount == 0 ? 3 : displayCount,
                itemBuilder: (context, index) {
                  bool hasData = displayList.length > index;
                  return Stack(
                    children: [
                      if (hasData)
                        CustomNetworkImage(
                          imageUrl: displayList[index].type == MemoryType.video
                              ? displayList[index].thumbnail!
                              : displayList[index].url,
                          height: double.infinity,
                          width: double.infinity,
                          borderRadius: 12,
                        )
                      else
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),

                      if (index == 2 && totalItems > 3)
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: AppText(
                              "${totalItems - 2} +",
                              color: Colors.white,
                              fontWeight: AppFonts.bold,
                              fontSize: 18,
                            ),
                          ),
                        )
                      else if (hasData &&
                          displayList[index].type == MemoryType.video)
                        const Center(
                          child: Icon(
                            Icons.play_circle_fill,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                    ],
                  );
                },
              );
            }),
            SizedBox(height: screenH * 0.05),
          ],
        ),
      ),
    );
  }

  // --- Helpers ---
  Widget _buildSectionHeader(
    String title,
    double screenW, {
    double fontSize = 20,
    bool hasViewAll = false,
    VoidCallback? onViewAll,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(title, fontSize: fontSize, fontWeight: AppFonts.semiBold),
        if (hasViewAll)
          TextButton(
            onPressed: onViewAll,
            child: AppText(
              "View All",
              color: AppColors.orangeColor,
              fontSize: 12,
            ),
          ),
      ],
    );
  }

  Widget _buildStatRow(String label, String value, {bool isLast = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: AppText(
              label,
              color: AppColors.blackColor,
              fontSize: 14,
              fontWeight: AppFonts.medium,
            ),
          ),
          Expanded(
            flex: 3,
            child: AppText(
              value,
              color: AppColors.blackColor,
              fontSize: 14,
              fontWeight: AppFonts.medium,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(
    String year,
    String title,
    String subtitle,
    double screenH, {
    bool isLast = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            const CircleAvatar(
              radius: 6,
              backgroundColor: AppColors.orangeColor,
            ),
            if (!isLast)
              Container(width: 2, height: 65, color: AppColors.orangeColor),
          ],
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                year,
                color: AppColors.orangeColor,
                fontSize: 14,
                fontWeight: AppFonts.medium,
              ),
              AppText(title, fontSize: 15, fontWeight: AppFonts.semiBold),
              if (subtitle.isNotEmpty)
                AppText(
                  subtitle,
                  fontSize: 11,
                  color: AppColors.blackColor,
                  fontWeight: AppFonts.medium,
                ),
              SizedBox(height: screenH * 0.01),
            ],
          ),
        ),
      ],
    );
  }
}
