import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_text.dart';
import '../../../core/widgets/custom_button.dart';

import '../../routes/dashboard_screen.dart';
import 'widget/access_info_card.dart';
import 'widget/role_selection_tab.dart';

class RoleAccessScreen extends StatelessWidget {
  const RoleAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedRole = "Admin".obs;

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
          "Role & Access",
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
                "Current Role: Admin",
                color: AppColors.orangeColor,
                fontSize: 12, // Fixed Font
              ),
            ),
            const AppText(
              "Smith Family Space",
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
                "Administration Access",
                fontSize: 16, // Fixed Font
                fontWeight: AppFonts.semiBold,
              ),
            ),
            const SizedBox(height: 10),
            AppText(
              "Admins have Full Control Over the Family Space. They CAn Mange Members, Edit The Family Tree Without Restriction, And Configure All Space Settings.",
              fontSize: 10, // Fixed Font
              fontWeight: AppFonts.regular,
              color: Colors.grey.shade600,
            ),

            SizedBox(height: screenHeight * 0.03),

            /// Access Cards
            const AccessInfoCard(
              icon: Icons.check_circle,
              iconColor: AppColors.orangeColor,
              title: "Family Tree Editing",
              subtitle: "Add Edit Or Deleted Any Profile",
            ),
            const AccessInfoCard(
              icon: Icons.people,
              iconColor: AppColors.orangeColor,
              title: "Member Management",
              subtitle: "Invite New Users And Assign Roles",
            ),
            const AccessInfoCard(
              icon: Icons.settings,
              iconColor: AppColors.orangeColor,
              title: "Space Settings",
              subtitle: "Change Privacy And Notifications",
            ),
            const AccessInfoCard(
              icon: Icons.photo_library_sharp,
              iconColor: AppColors.orangeColor,
              title: "Content Moderation",
              subtitle: "Manage Albums And Deleted Posts",
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
                  const Expanded(
                    child: AppText(
                      "Only The Family Creator Can Transfer Ownership Or Deleted The Entire Family Space.",
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
              "Need To Change Your Permissions?",
              fontSize: 10, // Fixed Font
              fontWeight: AppFonts.regular,
              color: Colors.grey.shade600,
            ),
            SizedBox(height: screenHeight * 0.02),
            CustomButton(
              text: "Contact Family Creator",
              onPressed: () {},
            ),

            SizedBox(height: screenHeight * 0.02),

            /// Save Button
            CustomButton(
              text: "Save & create",
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