import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_button.dart';

import '../../routes/dashboard_screen.dart';
import 'widget/access_info_card.dart';
import 'widget/role_selection_tab.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedRole = "role.admin".obs;

    /// Responsive Spacing Helpers
    final double screenWidth = Get.width;
    final double screenHeight = Get.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText(
          "role.title".tr,
          fontSize: 20, // Fixed Font
          fontWeight: AppFonts.semiBold,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // Responsive Horizontal Padding
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.02), // Responsive Top Gap

            /// Profile Image & Name
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50, // Fixed Radius
                    backgroundImage: AssetImage("assets/images/Ellipse.png"),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  AppText(
                    "Alex Johnson",
                    fontSize: 16, // Fixed Font
                    fontWeight: AppFonts.semiBold,
                  ),
                ],
              ),
            ),

            /// Role Badge
            Container(
              margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.orangeColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: AppText(
                "role.currentRole".trParams({'role': 'Admin'}),
                color: AppColors.orangeColor,
                fontSize: 12, // Fixed Font
              ),
            ),
            AppText(
              "role.familySpace".tr,
              fontSize: 12, // Fixed Font
              fontWeight: AppFonts.regular,
              color: Colors.grey,
            ),

            SizedBox(height: screenHeight * 0.02), // Responsive Gap

            /// Custom Tab Widget
            RoleSelectionTab(
              selectedRole: selectedRole,
              onRoleChanged: (role) => selectedRole.value = role,
            ),

            SizedBox(height: screenHeight * 0.02),
            Align(
              alignment: Alignment.centerLeft,
              child: AppText(
                "role.adminAccessTitle".tr,
                fontSize: 16, // Fixed Font
                fontWeight: AppFonts.semiBold,
              ),
            ),
            const SizedBox(height: 10),
            AppText(
              "role.adminAccessDesc".tr,
              fontSize: 10, // Fixed Font
              fontWeight: AppFonts.regular,
              color: Colors.grey.shade600,
            ),

            SizedBox(height: screenHeight * 0.03),

            /// Access Cards
            AccessInfoCard(
              icon: Icons.check_circle,
              iconColor: AppColors.orangeColor,
              title: "role.permission.editTree".tr,
              subtitle: "role.permission.editTreeSub".tr,
            ),
            AccessInfoCard(
              icon: Icons.people,
              iconColor: AppColors.orangeColor,
              title: "role.permission.memberMgmt".tr,
              subtitle: "role.permission.memberMgmtSub".tr,
            ),
            AccessInfoCard(
              icon: Icons.settings,
              iconColor: AppColors.orangeColor,
              title: "role.permission.spaceSettings".tr,
              subtitle: "role.permission.spaceSettingsSub".tr,
            ),
            AccessInfoCard(
              icon: Icons.photo_library_sharp,
              iconColor: AppColors.orangeColor,
              title: "role.permission.contentModeration".tr,
              subtitle: "role.permission.contentModerationSub".tr,
            ),

            SizedBox(height: screenHeight * 0.01),

            /// Warning Box
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.red.shade100),
              ),
              child: Row(
                children: [
                  Icon(Icons.error_outline, color: Colors.red.shade400, size: 20),
                  const SizedBox(width: 10),
                  Expanded(
                    child: AppText(
                      "role.warning".tr,
                      fontSize: 10, // Fixed Font
                      color: AppColors.blackColor,
                      fontWeight: AppFonts.regular,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: screenHeight * 0.04),

            /// Contact Creator Link
            AppText(
              "role.changePermission".tr,
              fontSize: 10, // Fixed Font
              fontWeight: AppFonts.regular,
              color: Colors.grey.shade600,
            ),
            SizedBox(height: screenHeight * 0.02),
            CustomButton(
              text: "role.contactCreator".tr,
              onPressed: () {},
            ),

            SizedBox(height: screenHeight * 0.02),

            /// Save Button
            CustomButton(
              text: "role.saveAndCreate".tr,
              onPressed: () {
                Get.to(() => const DashboardScreen());
              },
              backgroundColor: Colors.white,
              foregroundColor: AppColors.orangeColor,
              borderColor: AppColors.orangeColor,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
