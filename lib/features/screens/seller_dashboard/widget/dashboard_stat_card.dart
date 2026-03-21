import 'package:flutter/material.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';

class StatCard extends StatelessWidget {
  final String title, value, percent;
  final bool isPositive, isFullWidth;

  const StatCard({
    super.key, required this.title, required this.value,
    required this.percent, required this.isPositive, this.isFullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      width: isFullWidth ? double.infinity : null,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.cardColor, // Light mein white, dark mein dark grey/black
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10, offset: const Offset(0, 4)
          )
        ],
        border: Border.all(color: theme.dividerColor.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(title, fontSize: 14, color: colors.onSurface.withOpacity(0.6)),
          const SizedBox(height: 10),
          AppText(value, fontSize: 24, fontWeight: AppFonts.bold),
          const SizedBox(height: 5),
          AppText(
            percent,
            fontSize: 14,
            fontWeight: AppFonts.medium,
            color: isPositive ? Colors.green : Colors.red,
          ),
        ],
      ),
    );
  }
}