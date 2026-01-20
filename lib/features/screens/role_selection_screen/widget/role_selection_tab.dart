import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/app_text.dart';

class RoleSelectionTab extends StatelessWidget {
  final List<String> roles = ["Admin", "Member", "Guest"];
  final RxString selectedRole;
  final Function(String) onRoleChanged;

  RoleSelectionTab({
    super.key,
    required this.selectedRole,
    required this.onRoleChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: roles.map((role) {
          return Expanded(
            child: Obx(() {
              bool isSelected = selectedRole.value == role;
              return GestureDetector(
                onTap: () => onRoleChanged(role),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.orangeColor : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: AppText(
                    role,
                    color: isSelected ? Colors.white : Colors.black,
                    fontSize: 14,
                    fontWeight: isSelected ? AppFonts.semiBold : AppFonts.regular,
                  ),
                ),
              );
            }),
          );
        }).toList(),
      ),
    );
  }
}