import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_text.dart';

class ClaimTabSwitch extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabChanged;

  const ClaimTabSwitch({
    super.key,
    required this.currentIndex,
    required this.onTabChanged
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        // Dark mode mein surface color lega, light mein white
        color: colors.surface,
        borderRadius: BorderRadius.circular(25),
        // Border color ko bhi theme ke hisaab se light/dark rakha hai
        border: Border.all(color: colors.outlineVariant.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          _buildTab("claim.tab.verify".tr, 0, colors),
          _buildTab("claim.tab.confirm".tr, 1, colors),
          _buildTab("claim.tab.submit".tr, 2, colors),
        ],
      ),
    );
  }

  Widget _buildTab(String label, int index, ColorScheme colors) {
    bool isSelected = currentIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => onTabChanged(index),
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            // Selected tab hamesha Orange rahega
            color: isSelected ? AppColors.orangeColor : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: AppText(
            label,
            fontSize: 12, // Pixel perfect size
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            // Selected hai toh hamesha white text, warna theme ka default onSurface color
            color: isSelected
                ? Colors.white
                : colors.onSurface.withOpacity(0.6),
          ),
        ),
      ),
    );
  }
}
