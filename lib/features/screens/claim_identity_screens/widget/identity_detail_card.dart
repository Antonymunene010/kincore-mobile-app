import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';

class IdentityDetailCard extends StatelessWidget {
  const IdentityDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.orangeColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.orangeColor.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage("https://i.pravatar.cc/150?u=arthur"),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText("Arthur Harrison", fontSize: 18, fontWeight: AppFonts.bold),
                    AppText("Born 1985/ San Francisco, CA", fontSize: 11, color: colors.onSurface.withOpacity(0.6)),
                    AppText("Son Of Robert Doe & Sarah Smith", fontSize: 11, color: colors.onSurface.withOpacity(0.6)),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(color: AppColors.orangeColor, thickness: 0.5),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDetailColumn('identity.submittedOn'.tr, "Oct 24, 2023", colors),
              _buildDetailColumn('identity.relationship'.tr, 'identity.relationshipValue'.tr, colors),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDetailColumn(String label, String value, ColorScheme colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(label, fontSize: 13, fontWeight: AppFonts.medium, color: colors.onSurface.withOpacity(0.7)),
        const SizedBox(height: 4),
        AppText(value, fontSize: 18, fontWeight: AppFonts.bold),
      ],
    );
  }
}
