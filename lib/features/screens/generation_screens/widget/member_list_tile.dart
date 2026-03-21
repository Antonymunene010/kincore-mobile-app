import 'package:flutter/material.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
import '../model/generation_model.dart';

class MemberListTile extends StatelessWidget {
  final FamilyMember member;
  final bool isExpanded;

  const MemberListTile({super.key, required this.member, required this.isExpanded});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isExpanded ? AppColors.orangeColor.withOpacity(0.15) : colors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: isExpanded ? AppColors.orangeColor : colors.outlineVariant.withOpacity(0.5)
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 25, backgroundImage: NetworkImage(member.image)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              AppText(member.name, fontSize: 16, fontWeight: AppFonts.bold, color: colors.onSurface),
              AppText(member.relation, fontSize: 12, color: colors.onSurfaceVariant),
            ]),
          ),
          CircleAvatar(
            radius: 15,
            backgroundColor: isExpanded ? AppColors.orangeColor : Colors.black,
            child: Icon(
              isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
              color: Colors.white, size: 18,
            ),
          ),
        ],
      ),
    );
  }
}