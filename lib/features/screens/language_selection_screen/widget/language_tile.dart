import 'package:flutter/material.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import 'package:kincore_app/core/utils/app_fonts.dart';
import 'package:kincore_app/core/widgets/app_text.dart';

class LanguageTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool selected;
  final VoidCallback onTap;

  const LanguageTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: selected ? AppColors.primaryColor.withOpacity(0.08) :null,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: selected
                ? AppColors.primaryColor
                : AppColors.borderColor,
            width: 2,
          ),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            // vertical: 8,
          ),
          title: AppText(
            title,
            fontSize: 16,
            fontWeight: AppFonts.semiBold,
            color: AppColors.blackColor,
          ),
          subtitle: AppText(
            subtitle,
            fontSize: 12,
            fontWeight: AppFonts.medium,
            color: Colors.grey,
          ),
          trailing: selected
              ? Icon(
            Icons.check_circle,
            color: AppColors.primaryColor,
          )
              : null,
        ),
      ),
    );
  }
}
