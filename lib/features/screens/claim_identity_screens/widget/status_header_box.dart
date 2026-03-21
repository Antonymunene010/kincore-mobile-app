import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';

class StatusHeaderBox extends StatelessWidget {
  const StatusHeaderBox({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colors.outlineVariant.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.orangeColor, width: 2),
            ),
            child: const Icon(Icons.hourglass_empty_rounded, color: AppColors.orangeColor, size: 45),
          ),
          const SizedBox(height: 16),
          AppText('identity.claimPending'.tr, fontSize: 22, fontWeight: AppFonts.bold),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.orangeColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: AppText('identity.status.pending'.tr, fontSize: 12, color: AppColors.orangeColor, fontWeight: AppFonts.medium),
          ),
          const SizedBox(height: 16),
          AppText(
            'identity.status.description'.tr,
            fontSize: 12,
            textAlign: TextAlign.center,
            color: colors.onSurface.withOpacity(0.7),
          ),
        ],
      ),
    );
  }
}
