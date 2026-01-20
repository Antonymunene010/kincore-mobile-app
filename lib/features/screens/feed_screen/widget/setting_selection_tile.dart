import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text.dart';

class SettingSelectionTile extends StatelessWidget {
  final String title;
  final IconData? icon; // Only change: added '?' to make it optional
  final bool isSelected;
  final VoidCallback onTap;

  const SettingSelectionTile({
    super.key,
    required this.title,
    this.icon, // Only change: removed 'required'
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            // Only change: wrapped Icon and SizedBox in a null check
            if (icon != null) ...[
              Icon(icon!, color: AppColors.blackColor, size: 22),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: AppText(title, fontSize: 16, fontWeight: FontWeight.w500),
            ),
            // Custom Checkbox
            Container(
              height: 22,
              width: 22,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.orangeColor : Colors.transparent,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: isSelected ? AppColors.orangeColor : AppColors.blackColor,
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, color: AppColors.whiteColor, size: 16)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}