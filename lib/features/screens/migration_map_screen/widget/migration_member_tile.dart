import 'package:flutter/material.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
import '../model/migration_model.dart';

class MigrationMemberTile extends StatelessWidget {
  final MigrationMember member;
  const MigrationMemberTile({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colors.outlineVariant.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 25, backgroundImage: NetworkImage(member.image)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              AppText(member.name, fontSize: 16, fontWeight: AppFonts.bold),
              AppText(member.relation, fontSize: 12, color: Colors.grey),
            ]),
          ),
          const Icon(Icons.arrow_circle_right, size: 28),
        ],
      ),
    );
  }
}