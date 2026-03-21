import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/widgets/custom_icon_button.dart';
import 'package:kincore_app/features/screens/find_family_member/find_family_member.dart';
import 'package:kincore_app/features/screens/tree/tree_controller.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import '../add_members/add_child.dart';
import '../add_members/add_family_member.dart';
import '../add_members/add_parents.dart';

class TreeScreen extends StatefulWidget {
  const TreeScreen({super.key});

  @override
  State<TreeScreen> createState() => _TreeScreenState();
}

class _TreeScreenState extends State<TreeScreen> {
  final controller = Get.put(TreeController());
  final TextEditingController searchController = TextEditingController();

  void onSearchChanged(String query) {
    debugPrint("Searching for member: $query");
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final double screenWidth = Get.width;
    final double screenHeight = Get.height;

    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: false,
      //   automaticallyImplyLeading: false,
      //   title: const AppText(
      //     "The Harrison Clan",
      //     fontSize: 20,
      //     fontWeight: AppFonts.semiBold,
      //   ),
      //   actions: [
      //     Wrap(
      //       children: [
      //         CustomIconButton(
      //           iconName: 'location.svg',
      //           size: 20,
      //           onTap: () {},
      //         ),
      //         CustomIconButton(iconName: 'bell.svg', size: 20, onTap: () {}),
      //         CustomIconButton(iconName: 'search.svg', size: 20, onTap: () {}),
      //       ],
      //     ),
      //     SizedBox(width: screenWidth * 0.02),
      //   ],
      // ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              children: [
                AppText(
                  'tree.title'.tr, // [FIX] Localized Title
                  fontSize: 20,
                  fontWeight: AppFonts.semiBold,
                ),
                const Spacer(),
                CustomIconButton(
                  iconName: 'location.svg',
                  size: 20,
                  onTap: () {},
                ),
                CustomIconButton(
                    iconName: 'search.svg',
                    size: 20,
                    onTap: () => Get.to(() => const FindMemberScreen()) // [FIX] Added () => for proper routing
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SizedBox(
              height: 50,
              child: GetBuilder<TreeController>(
                id: 'sCat',
                builder: (controller) {
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.treeCategoryList.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      final category = controller.treeCategoryList[index];
                      final isSelected = controller.selectedCat == category;

                      return ChoiceChip(
                        labelPadding: const EdgeInsets.symmetric(horizontal: 2),
                        label: AppText(
                          category.tr, // [FIX] Added .tr for dynamic categories coming from controller
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: isSelected ? Colors.white : AppColors.blackColor,
                        ),
                        selected: isSelected,
                        showCheckmark: false,
                        selectedColor: AppColors.orangeColor,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(
                            color: isSelected ? AppColors.orangeColor : Colors.white,
                            width: 1.5,
                          ),
                        ),
                        onSelected: (bool selected) {
                          if (selected) {
                            controller.selectCategory(category);
                          }
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),

          /// ---------------- GENERATION BADGE ----------------
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04,
              vertical: screenHeight * 0.008,
            ),
            decoration: BoxDecoration(
              color: colors.secondary.withOpacity(0.12),
              borderRadius: BorderRadius.circular(20),
            ),
            child: AppText(
              "tree.generations".trParams({'count': '4', 'members': '24'}),
              color: colors.secondary,
              fontSize: 10,
              fontWeight: AppFonts.semiBold,
            ),
          ),

          SizedBox(height: screenHeight * 0.015),

          /// ---------------- TREE VIEW PLACEHOLDER ----------------
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  color: theme.scaffoldBackgroundColor,
                  child: Center(
                    child: AppText(
                      "tree.webContentView".tr,
                      fontSize: 14,
                      color: colors.onBackground.withOpacity(0.6),
                    ),
                  ),
                ),

                /// ---------------- ZOOM CONTROLS ----------------
                Positioned(
                  right: screenWidth * 0.05,
                  top: screenHeight * 0.02,
                  child: Column(
                    children: [
                      _buildZoomButton(context, Icons.add),
                      SizedBox(height: screenHeight * 0.012),
                      _buildZoomButton(context, Icons.remove),
                      SizedBox(height: screenHeight * 0.012),
                      _buildZoomButton(context, Icons.gps_fixed),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: screenHeight * 0.1),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor:AppColors.orangeColor, // Background color orange
        shape: const CircleBorder(),
        mini: true,
        child: CustomIconButton(
          onTap: () => _showAddMemberPopup(context),
          iconName: 'add_person.svg',
          iconColor: Colors.white,// Icon color white (ensure your custom widget supports this)
        ),
      ),
    );
  }

  /// ---------------- ZOOM BUTTON ----------------
  Widget _buildZoomButton(BuildContext context, IconData icon) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: colors.secondary.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: colors.secondary, size: 20),
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
