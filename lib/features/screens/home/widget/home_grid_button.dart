import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';

class HomeGridButton extends StatelessWidget {
  final String iconName;
  final String label;
  final VoidCallback onTap;

  const HomeGridButton({
    super.key,
    required this.iconName,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    String finalPath = iconName.contains('.svg') ? 'assets/icons/$iconName' : 'assets/icons/$iconName.svg';

    return Material(
      color: theme.colorScheme.surface,
      borderRadius: BorderRadius.circular(25),
      elevation: 0,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(25),
        splashColor: AppColors.orangeColor.withOpacity(0.15),
        highlightColor: AppColors.orangeColor.withOpacity(0.05),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: theme.dividerColor.withOpacity(0.1)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 12,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                finalPath,
                height: 25,
                width: 25,
                placeholderBuilder: (context) => const Icon(Icons.broken_image, size: 28),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: AppText(
                  label,
                  fontSize: 14,
                  fontWeight: AppFonts.medium,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  height: 1.1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
