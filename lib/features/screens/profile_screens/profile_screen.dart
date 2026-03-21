import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/features/screens/setting_screen/setting_screen.dart';
import 'package:kincore_app/features/screens/role_selection_screen/role_selcetion_screen.dart';
import 'package:kincore_app/features/screens/seller_dashboard/add_product_screen.dart';
import 'package:kincore_app/features/screens/seller_dashboard/seller_dashboard_screen.dart';
import '../../../core/models/memory_model.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../../../core/widgets/custom_network_image.dart';
import '../add_members/add_parents.dart';
import '../add_members/add_child.dart';
import '../add_members/add_family_member.dart';
import '../family_member/controller/family_member_controller.dart';
import '../family_member/family_member_list_screen.dart';
import '../generation_screens/generation_screen.dart';
import '../memory_screen/add_memory_screen.dart';
import '../memory_screen/controller/memory_controller.dart';
import '../memory_screen/memory_screen.dart';
import '../role_access_screen/role_access_screen.dart';
import '../scanner_screen/scanner_screen.dart';
import 'controller/profile_controller.dart';
import 'edit_profile_screen.dart';
import 'widget/profile_action_button.dart';
import '../redeem_coin_screen/widget/wallet_balance_card.dart';

class ProfileScreen extends StatelessWidget {
  // ISSUE 1: Added isOwnProfile to differentiate between viewing own profile vs others
  final bool isOwnProfile;

  const ProfileScreen({super.key, this.isOwnProfile = true});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    final familyController = Get.put(FamilyController());
    final memoryController = Get.put(MemoryController());

    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final screenW = Get.width;
    final screenH = Get.height;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: !isOwnProfile, // Only show back button if viewing someone else
        title: AppText(
          isOwnProfile ? "profile.myProfile".tr : "User Profile",
          fontSize: 20,
          fontWeight: AppFonts.semiBold,
        ),
        actions: [
          if (isOwnProfile) ...[
            IconButton(
                onPressed: () => Get.to(const ScannerScreen()),
                icon: const Icon(CupertinoIcons.qrcode)),
            // IconButton(
            //   onPressed: () => Get.to(const PersonalProfileScreen()),
            //   icon: const Icon(Icons.sync, color: AppColors.orangeColor, size: 28),
            // ),
            SizedBox(width: screenW * 0.01),
          ]
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: screenW * 0.05),
            child: Column(
              children: [
                /// ---------------- Profile Header ----------------
                Container(
                  padding: EdgeInsets.all(screenW * 0.04),
                  decoration: BoxDecoration(
                    color: colors.surface,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: theme.dividerColor),
                  ),
                  child: Column(
                    children: [
                      // ISSUE 6: Profile Picture Click Actions
                      GestureDetector(
                        onTap: () => _showProfileImageOptions(context, isOwnProfile),
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                // Orange border to indicate story exists
                                border: Border.all(color: AppColors.orangeColor, width: 2),
                              ),
                              child: Obx(() => CustomNetworkImage(
                                imageUrl: controller.profileImageUrl.value,
                                height: 95,
                                width: 95,
                                borderRadius: 50,
                              )),
                            ),
                            if (isOwnProfile)
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                      color: colors.surface,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4)
                                      ]
                                  ),
                                  child: Icon(
                                    Icons.add_a_photo,
                                    size: 16,
                                    color: colors.onSurface,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenH * 0.015),
                      Obx(() => AppText(
                        controller.userName.value,
                        fontSize: 20,
                        fontWeight: AppFonts.semiBold,
                      )),
                      const SizedBox(height: 4),

                      // ISSUE 3 & 4: Family Role & Space counts
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            "Level 3 Historian", // Hardcoded for demo, replace with controller value
                            fontSize: 12,
                            color: AppColors.orangeColor,
                            fontWeight: AppFonts.bold,
                          ),
                          const SizedBox(width: 8),
                          AppText(
                            "•  Part of 3 Family Spaces",
                            fontSize: 12,
                            color: colors.onSurface.withOpacity(0.6),
                            fontWeight: AppFonts.medium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() => AppText(
                            controller.lifeSpan.value,
                            fontSize: 13,
                            fontWeight: AppFonts.medium,
                          )),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: colors.secondary.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Obx(() => AppText(
                              controller.relationBadge.value,
                              color: colors.secondary,
                              fontSize: 10,
                              fontWeight: AppFonts.bold,
                            )),
                          ),
                        ],
                      ),
                      SizedBox(height: screenH * 0.025),

                      /// Main Action Buttons (Conditional based on isOwnProfile)
                      if (isOwnProfile)
                        Row(
                          children: [
                            Expanded(
                              child: CustomProfileActionButton(
                                iconName: 'edit.svg',
                                label: "profile.editProfile".tr,
                                onTap: () => Get.to(const EditProfileScreen()),
                              ),
                            ),
                            SizedBox(width: screenW * 0.02),
                            Expanded(
                              child: CustomProfileActionButton(
                                iconName: 'add_icon.svg',
                                label: "profile.addMember".tr,
                                onTap: () => _showAddMemberPopup(context),
                              ),
                            ),
                            SizedBox(width: screenW * 0.02),
                            Expanded(
                              child: CustomProfileActionButton(
                                iconName: 'camera_upload.svg',
                                label: "profile.addMemory".tr,
                                onTap: () => Get.to(const AddMemoryScreen()),
                              ),
                            ),
                          ],
                        )
                      else
                      // Other user's profile actions
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.message, size: 18, color: Colors.white),
                                label: AppText('profile.message'.tr, color: Colors.white, fontSize: 13),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.orangeColor,
                                    elevation: 0,
                                    padding: const EdgeInsets.symmetric(vertical: 12)
                                ),
                              ),
                            ),
                            SizedBox(width: screenW * 0.02),
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.dynamic_feed, size: 18, color: colors.onSurface),
                                label: AppText('profile.viewFeed'.tr, color: colors.onSurface, fontSize: 13),
                                style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 12)
                                ),
                              ),
                            ),
                          ],
                        ),

                      /// ISSUE 5 & FIX 2: See Your Role & Privacy Button combined
                      SizedBox(height: screenH * 0.02),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: Obx(() {
                                final isLocked = controller.isPrivacyLocked.value;
                                return OutlinedButton.icon(
                                  onPressed: () => controller.togglePrivacy(),
                                  icon: Icon(
                                    isLocked ? Icons.lock_outline : Icons.lock_open_outlined,
                                    size: 16,
                                    color: colors.onSurfaceVariant,
                                  ),
                                  label: Flexible(
                                    child: AppText(
                                      isLocked ? 'profile.privacyLocked'.tr : 'profile.privacyUnlocked'.tr,
                                      fontSize: 12,
                                      color: colors.onSurfaceVariant,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(color: colors.outlineVariant),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                  ),
                                );
                              }),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: OutlinedButton.icon(
                                onPressed: () => Get.to(const RoleAccessScreen()),
                                icon: Icon(Icons.manage_accounts_outlined, size: 18, color: colors.primary),
                                label: Flexible(
                                  child: AppText(
                                    'profile.roleAccess'.tr,
                                    fontSize: 12,
                                    color: colors.primary,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: colors.primary.withOpacity(0.5)),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  padding: const EdgeInsets.symmetric(horizontal: 4),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: screenH * 0.02),

                /// --- ISSUE 2: UPDATED Seller Dashboard Buttons ---
                if (isOwnProfile)
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Get.to(() => const SellerDashboardScreen()), // [FIXED]: Arrow function with () => for better GetX navigation
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: AppColors.orangeColor, width: 1.5),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            minimumSize: const Size(double.infinity, 48), // [FIXED]: Dono buttons ki fixed height 48 kar di
                            padding: const EdgeInsets.symmetric(horizontal: 5), // Lamba text aaye toh thodi jagah mile
                          ),
                          child: AppText(
                            'profile.viewDashboard'.tr,
                            color: AppColors.orangeColor,
                            fontWeight: AppFonts.semiBold,
                            fontSize: 13,
                            maxLines: 1, // [FIXED]: Text ek hi line mein rahega
                            overflow: TextOverflow.ellipsis, // [FIXED]: Lamba text hone par '...' aayega
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Get.to(() => const AddProductScreen()), // [FIXED]: Correct GetX syntax
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.orangeColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            minimumSize: const Size(double.infinity, 48), // [FIXED]: Guaranteed exact same height
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                          ),
                          child: AppText(
                            'profile.addProduct'.tr,
                            color: Colors.white,
                            fontWeight: AppFonts.semiBold,
                            fontSize: 13,
                            maxLines: 1, // [FIXED]: Text ek hi line mein rahega
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),

                if (isOwnProfile) SizedBox(height: screenH * 0.03),

                /// ---------------- Wallet (Hidden on others profile) ----------------
                if (isOwnProfile) WalletBalanceCard(screenW: screenW, screenH: screenH),
                if (isOwnProfile) SizedBox(height: screenH * 0.03),

                /// ---------------- Vital Statistics ----------------
                _sectionHeader(context, 'profile.vitalStats'.tr),
                _infoContainer(
                  context,
                  Column(
                    children: [
                      _StatRow(label:'profile.stat.fullName'.tr, value: "Eleanor Rigby"),
                      _StatRow(label: 'profile.stat.born'.tr, value: "May 12, 1920"),
                      _StatRow(label: 'profile.stat.location'.tr, value: "London, UK"),
                      _StatRow(
                        label: 'profile.stat.occupation'.tr,
                        value: "Rice Cleaner At Church",
                        isLast: true,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: screenH * 0.03),

                /// ---------------- Family Members ----------------
                _sectionHeader(
                  context,
                  "profile.familyMember".tr,
                  hasViewAll: true,
                  onViewAll: () => Get.to(const FamilyMemberListScreen()),
                ),

                SizedBox(
                  height: 130,
                  child: Obx(() => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: familyController.familyMembers.length,
                    itemBuilder: (_, index) {
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
                  )),
                ),

                SizedBox(height: screenH * 0.01),

                /// ---------------- Timeline ----------------
                _sectionHeader(context, 'profile.keyLifeEvents'.tr),
                _infoContainer(
                  context,
                  Column(
                    children: [
                      const _TimelineItem(
                        year: "1920",
                        title: "Born In Liverpool",
                        subtitle: "May 12th, to John and Mary Rigby",
                      ),
                      const _TimelineItem(
                        year: "1945",
                        title: "Marriage To Paul Mckenzie",
                      ),
                      const _TimelineItem(
                        year: "2005",
                        title: "Passed Away",
                        subtitle: "Aged 85 Buried at St. Peter's Church",
                        isLast: true,
                      ),
                      const SizedBox(height: 10),
                      CustomButton(
                        text: 'profile.viewMoreTimeline'.tr,
                        onPressed:()=>  Get.to(const GenerationScreen()),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: screenH * 0.03),

                /// ---------------- Memories ----------------
                _sectionHeader(
                  context,
                  'profile.memories'.tr,
                  hasViewAll: true,
                  onViewAll: () => Get.to(const MemoriesGridScreen()),
                ),

                _memoriesGrid(context, memoryController),

                SizedBox(height: screenH * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// --- ISSUE 6: Bottom Sheet for Profile Options ---
  void _showProfileImageOptions(BuildContext context, bool isOwn) {
    final colors = Theme.of(context).colorScheme;
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 40, height: 5, decoration: BoxDecoration(color: colors.outlineVariant, borderRadius: BorderRadius.circular(10))),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.data_usage),
              title: const AppText("View Story", fontWeight: AppFonts.medium),
              onTap: () {
                Get.back();
                // Navigate to story logic
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_pin),
              title: const AppText("View Profile Picture", fontWeight: AppFonts.medium),
              onTap: () => Get.back(),
            ),
            if (!isOwn)
              ListTile(
                leading: const Icon(Icons.dynamic_feed),
                title: const AppText("View User Feed", fontWeight: AppFonts.medium),
                onTap: () => Get.back(),
              ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }

  /// --- POPUP LOGIC FOR ADD MEMBER ---
  void _showAddMemberPopup(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: colors.onSurface.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 20),
            AppText('profile.addMember'.tr, fontSize: 18, fontWeight: AppFonts.semiBold),
            const SizedBox(height: 25),
            _buildPopupOption(
              icon: Icons.person_add_alt_1_rounded,
              title: 'addMember.addParentsTitle'.tr,
              onTap: () {
                Get.back();
                Get.to(() => const AddParentsScreen());
              },
              colors: colors,
            ),
            _buildPopupOption(
              icon: Icons.child_care_rounded,
              title: 'addMember.addChildTitle'.tr,
              onTap: () {
                Get.back();
                Get.to(() => const AddChildScreen());
              },
              colors: colors,
            ),
            _buildPopupOption(
              icon: Icons.people_alt_rounded,
              title: 'addMember.addOtherMember'.tr,
              onTap: () {
                Get.back();
                Get.to(() => const AddFamilyMemberScreen());
              },
              isLast: true,
              colors: colors,
            ),
          ],
        ),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }

  Widget _buildPopupOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    required ColorScheme colors,
    bool isLast = false,
  }) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: CircleAvatar(
            backgroundColor: colors.primary.withOpacity(0.1),
            child: Icon(icon, color: colors.primary, size: 20),
          ),
          title: AppText(title, fontSize: 15, fontWeight: AppFonts.medium),
          trailing: Icon(Icons.arrow_forward_ios_rounded,
              size: 14, color: colors.onSurface.withOpacity(0.3)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        ),
        if (!isLast) Divider(color: colors.onSurface.withOpacity(0.05), height: 1),
      ],
    );
  }
}

/// ================= HELPERS =================

Widget _sectionHeader(
    BuildContext context,
    String title, {
      bool hasViewAll = false,
      VoidCallback? onViewAll,
    }) {
  final colors = Theme.of(context).colorScheme;

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      AppText(title, fontSize: 18, fontWeight: AppFonts.semiBold),
      if (hasViewAll)
        TextButton(
          onPressed: onViewAll,
          child: AppText(
            'common.viewAll'.tr,
            fontSize: 12,
            color: colors.secondary,
          ),
        ),
    ],
  );
}

Widget _infoContainer(BuildContext context, Widget child) {
  final theme = Theme.of(context);

  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: theme.colorScheme.surface,
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: theme.dividerColor),
    ),
    child: child,
  );
}

class _StatRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isLast;

  const _StatRow({
    required this.label,
    required this.value,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: AppText(
              label,
              fontSize: 13,
              fontWeight: AppFonts.medium,
            ),
          ),
          Expanded(
            flex: 3,
            child: AppText(
              value,
              fontSize: 13,
              fontWeight: AppFonts.medium,
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final String year;
  final String title;
  final String? subtitle;
  final bool isLast;

  const _TimelineItem({
    required this.year,
    required this.title,
    this.subtitle,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CircleAvatar(radius: 6, backgroundColor: colors.secondary),
            if (!isLast) Container(width: 2, height: 65, color: colors.secondary),
          ],
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                year,
                fontSize: 13,
                color: colors.secondary,
                fontWeight: AppFonts.medium,
              ),
              AppText(title, fontSize: 14, fontWeight: AppFonts.semiBold),
              if (subtitle != null)
                AppText(
                  subtitle!,
                  fontSize: 11,
                  fontWeight: AppFonts.medium,
                ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _memoriesGrid(
    BuildContext context,
    MemoryController controller,
    ) {
  return Obx(() {
    if (controller.isLoading.value) {
      return const Center(child: CircularProgressIndicator());
    }

    final list = controller.allMemories;
    final count = list.length > 3 ? 3 : list.length;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: count == 0 ? 3 : count,
      itemBuilder: (_, index) {
        final hasData = list.length > index;
        return Stack(
          children: [
            if (hasData)
              CustomNetworkImage(
                imageUrl: list[index].type == MemoryType.video
                    ? list[index].thumbnail!
                    : list[index].url,
                borderRadius: 12,
              )
            else
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).colorScheme.surfaceVariant,
                ),
              ),
          ],
        );
      },
    );
  });
}