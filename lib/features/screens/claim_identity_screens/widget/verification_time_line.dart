import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';

class VerificationTimeline extends StatelessWidget {
  const VerificationTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colors.outlineVariant.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'identity.verificationProgress'.tr,
            fontSize: 16,
            fontWeight: AppFonts.semiBold,
            color: colors.onSurface,
          ),
          const SizedBox(height: 20),
          _buildTimelineTile(
            title: 'identity.progress.submitted'.tr,
            subtitle: 'identity.progress.submittedSub'.tr,
            isCompleted: true,
            showLine: true,
            colors: colors,
          ),
          _buildTimelineTile(
            title: 'identity.progress.inProgress'.tr,
            subtitle: 'identity.progress.inProgressSub'.tr,
            isCompleted: false,
            isInProgress: true,
            showLine: true,
            colors: colors,
          ),
          _buildTimelineTile(
            title: 'identity.progress.decision'.tr,
            subtitle: 'identity.progress.decisionSub'.tr,
            isCompleted: false,
            showLine: false,
            colors: colors,
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineTile({
    required String title,
    required String subtitle,
    required bool isCompleted,
    bool isInProgress = false,
    required bool showLine,
    required ColorScheme colors,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 24,
                height: 24,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isCompleted ? AppColors.orangeColor : Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: (isCompleted || isInProgress) ? AppColors.orangeColor : Colors.grey.shade400,
                    width: 2,
                  ),
                ),
                child: isCompleted
                    ? const Icon(Icons.check, size: 14, color: Colors.white)
                    : (isInProgress ? const Icon(Icons.priority_high, size: 14, color: AppColors.orangeColor) : null),
              ),
              if (showLine)
                Expanded(
                  child: Container(
                    width: 2,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    color: isCompleted ? AppColors.orangeColor : Colors.grey.shade300,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title,
                  fontSize: 15,
                  fontWeight: AppFonts.bold,
                  color: isInProgress ? AppColors.orangeColor : colors.onSurface,
                ),
                const SizedBox(height: 4),
                AppText(
                  subtitle,
                  fontSize: 12,
                  color: colors.onSurface.withOpacity(0.6),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
