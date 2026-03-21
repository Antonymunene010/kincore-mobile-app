import 'package:flutter/material.dart';

import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';

class ProfileMenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Widget? trailing;

  const ProfileMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: colors.outlineVariant.withOpacity(0.5)),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFFF6433).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: const Color(0xFFFF6433), size: 22),
        ),
        title: AppText(title, fontSize: 16, fontWeight: AppFonts.semiBold, color: colors.onSurface),
        subtitle: AppText(subtitle, fontSize: 12, color: colors.onSurface.withOpacity(0.6)),
        trailing: trailing ?? Icon(Icons.arrow_forward_ios_rounded, size: 16, color: colors.onSurface),
      ),
    );
  }
}