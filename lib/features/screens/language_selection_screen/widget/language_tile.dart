import 'package:flutter/material.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import 'package:kincore_app/core/utils/app_fonts.dart';
import 'package:kincore_app/core/utils/app_text.dart';

class LanguageTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool selected;
  final VoidCallback onTap;

  const LanguageTile({
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 370,
        height: 90,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: selected
                ? AppColors.primaryColor.withOpacity(0.08)
                : Colors.grey.shade100,
            border: Border.all(
              color: selected
                  ? AppColors.primaryColor
                  : Colors.transparent,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                title,
                fontSize: 16,
                fontWeight: AppFonts.semiBold,
                color: AppColors.blackColor,
              ),
              const SizedBox(height: 4),
              AppText(
                subtitle,
                fontSize: 12,
                fontWeight: AppFonts.medium,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
