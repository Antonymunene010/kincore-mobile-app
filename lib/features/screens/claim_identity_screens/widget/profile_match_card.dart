import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';

class ProfileMatchCard extends StatelessWidget {
  final RxBool isConfirmed;
  final VoidCallback onToggle;

  const ProfileMatchCard({
    super.key,
    required this.isConfirmed,
    required this.onToggle
  });

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
              const Icon(Icons.person_search_outlined, color: AppColors.orangeColor, size: 24),
              const SizedBox(width: 8),
              AppText('claim.profileMatch'.tr, fontSize: 13, fontWeight: AppFonts.bold, color: AppColors.orangeColor),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage("https://i.pravatar.cc/150?u=arthur"),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText("Arthur Harrison", fontSize: 18, fontWeight: AppFonts.bold),
                    AppText("Born 1985/ San Francisco, CA", fontSize: 12, color: colors.onSurface.withOpacity(0.6)),
                    AppText("Son Of Robert Doe & Sarah Smith", fontSize: 12, color: colors.onSurface.withOpacity(0.6)),
                  ],
                ),
              )
            ],
          ),
          const Divider(height: 30),
          GestureDetector(
            onTap: onToggle,
            child: Row(
              children: [
                Obx(() => Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: isConfirmed.value ? Colors.black : Colors.transparent,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: isConfirmed.value
                      ? const Icon(Icons.check, color: Colors.white, size: 16)
                      : const SizedBox(width: 16, height: 16),
                )),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText('claim.thisIsMe'.tr, fontSize: 14, fontWeight: AppFonts.bold),
                      AppText('claim.confirmProfile'.tr, fontSize: 11, color: colors.onSurface.withOpacity(0.6), maxLines: 2),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
