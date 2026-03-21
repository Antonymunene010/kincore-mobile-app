import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';

// --- Section Header Widget ---
class KinshipSectionHeader extends StatelessWidget {
  final String text;
  final Color color;

  const KinshipSectionHeader({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return AppText(
      text,
      fontSize: 20,
      fontWeight: AppFonts.bold,
      color: color,
    );
  }
}

// --- Path Item Card Widget ---
class KinshipPathCard extends StatelessWidget {
  final Map<String, dynamic> item;

  const KinshipPathCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: colors.outlineVariant.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(theme.brightness == Brightness.dark ? 0.3 : 0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.orangeColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: item['isImage']
                ? ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(item['icon'], fit: BoxFit.cover),
            )
                : Icon(Icons.arrow_forward, color: colors.onSurfaceVariant),
          ),
          const SizedBox(width: 16),
          AppText(
            item['title'],
            fontSize: 16,
            fontWeight: AppFonts.medium,
            color: AppColors.orangeColor,
          ),
        ],
      ),
    );
  }
}

// --- Details Card Widget ---
class KinshipDetailsCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const KinshipDetailsCard({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colors.outlineVariant.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(theme.brightness == Brightness.dark ? 0.3 : 0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title,
                  fontSize: 18,
                  fontWeight: AppFonts.bold,
                  color: AppColors.orangeColor,
                ),
                const SizedBox(height: 6),
                AppText(
                  subtitle,
                  fontSize: 14,
                  color: colors.onSurface.withOpacity(0.8),
                ),
              ],
            ),
          ),
          Container(
            width: 85,
            height: 65,
            decoration: BoxDecoration(
              color: AppColors.orangeColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(Icons.park_outlined, color: Colors.green, size: 35),
          ),
        ],
      ),
    );
  }
}