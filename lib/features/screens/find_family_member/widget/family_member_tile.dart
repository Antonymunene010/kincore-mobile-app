import 'package:flutter/material.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import '../../../../core/models/family_member_model.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_network_image.dart';

class FamilyMemberTile extends StatelessWidget {
  final FamilyMember member;
  final bool isSelected;
  final VoidCallback onTap;

  const FamilyMemberTile({
    super.key,
    required this.member,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap, // 👈 Click action
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isSelected ? AppColors.orangeColor : colors.outline.withOpacity(0.1),
            width: isSelected ? 2.5 : 1.0,
          ),
        ),
        child: Row(
          children: [
            CustomNetworkImage(imageUrl: member.image, height: 60, width: 60, borderRadius: 30),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(member.name, fontSize: 17, fontWeight: FontWeight.bold),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      _buildTag(member.relation),
                      const SizedBox(width: 8),
                      AppText("1995 • Present", fontSize: 13, color: colors.onSurface.withOpacity(0.5)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // Location
                  AppText("California, USA", fontSize: 12, color: colors.onSurface.withOpacity(0.4)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: AppText(text, fontSize: 11, color: Colors.orange.shade700),
    );
  }
}