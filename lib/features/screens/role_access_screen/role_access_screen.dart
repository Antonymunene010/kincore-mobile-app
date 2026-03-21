import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/custom_network_image.dart';
import 'widget/permission_tile.dart';

class RoleAccessScreen extends StatelessWidget {
  const RoleAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    var selectedRole = "role.admin".obs;

    return Scaffold(
      // Light theme mein halka grey background contrast ke liye
      backgroundColor: isDark
          ? colors.surface
          : const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: colors.onSurface, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText("roleAccess.title".tr, fontSize: 22, fontWeight: AppFonts.bold),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            /// --- PROFILE SECTION ---
            const CustomNetworkImage(
              imageUrl: "https://i.pravatar.cc/150?u=alex",
              height: 100,
              width: 100,
              borderRadius: 50,
            ),
            const SizedBox(height: 10),
            AppText("Alex Johnson", fontSize: 20, fontWeight: AppFonts.bold),

            // Role Badge (Light theme mein zyada visible color)
            _buildCurrentRoleBadge(context, "role.currentRole".trParams({'role': 'Admin'})),

            AppText("role.familySpace".tr,
                fontSize: 14,
                color: colors.onSurface.withOpacity(0.5)
            ),

            const SizedBox(height: 30),

            /// --- ROLE TOGGLE ---
            Obx(() => Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                // Light mode mein white background aur shadow
                color: colors.surface,
                borderRadius: BorderRadius.circular(35),
                boxShadow: isDark ? [] : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Row(
                children: ["role.admin", "role.member", "role.guest"].map((role) {
                  bool isSelected = selectedRole.value == role;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => selectedRole.value = role,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFFFF6B3C) // Bright orange
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: AppText(
                              role.tr,
                              color: isSelected
                                  ? Colors.white
                                  : colors.onSurface.withOpacity(0.7),
                              fontWeight: isSelected ? AppFonts.bold : AppFonts.medium
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            )),

            const SizedBox(height: 35),

            /// --- ADMINISTRATION ACCESS SECTION ---
            Align(
              alignment: Alignment.centerLeft,
              child: AppText("role.adminAccessTitle".tr, fontSize: 18, fontWeight: AppFonts.bold),
            ),
            const SizedBox(height: 10),
            AppText(
                "role.adminAccessDesc".tr,
                fontSize: 13,
                color: colors.onSurface.withOpacity(0.6)
            ),

            const SizedBox(height: 20),

            /// --- PERMISSION TILES ---
            PermissionTile(
              title: "role.permission.editTree".tr,
              subtitle: "role.permission.editTreeSub".tr,
              icon: Icons.check_circle,
              iconColor: Color(0xFFFF6B3C),
            ),
            PermissionTile(
              title: "role.permission.memberMgmt".tr,
              subtitle: "role.permission.memberMgmtSub".tr,
              icon: Icons.people,
              iconColor: Color(0xFFFF6B3C),
            ),
            PermissionTile(
              title: "role.permission.spaceSettings".tr,
              subtitle: "role.permission.spaceSettingsSub".tr,
              icon: Icons.settings,
              iconColor: Color(0xFFFF6B3C),
            ),

            const SizedBox(height: 20),

            /// --- WARNING BOX ---
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFFE8E0), // Soft red/orange
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFFFB399)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.error_outline, color: Color(0xFFFF4500)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: AppText(
                        "role.warning".tr,
                        fontSize: 12,
                        color: const Color(0xFF8B2E0E),
                        fontWeight: AppFonts.medium
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            AppText("role.changePermission".tr,
                fontSize: 13,
                color: colors.onSurface.withOpacity(0.5)
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentRoleBadge(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE8E0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: AppText(text, fontSize: 12, color: const Color(0xFFFF6B3C), fontWeight: AppFonts.semiBold),
    );
  }
}
