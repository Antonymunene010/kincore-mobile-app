import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';

class MigrationHistoryCard extends StatelessWidget {
  final String from;
  final String to;
  final String date;
  final bool isCurrent;

  const MigrationHistoryCard({
    super.key,
    required this.from,
    required this.to,
    required this.date,
    this.isCurrent = false
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 50, bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isCurrent
                ? Colors.green.withOpacity(0.15)
                : AppColors.orangeColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20),
          ),
          child: AppText(
            "$date : ${isCurrent ? 'orderHistory.status.current'.tr : 'orderHistory.status.ago'.tr}",
            color: isCurrent ? Colors.green : AppColors.orangeColor,
            fontSize: 11,
            fontWeight: AppFonts.medium,
          ),
        ),

        Container(
          margin: const EdgeInsets.only(left: 50, bottom: 25),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: colors.brightness == Brightness.dark
                ? colors.surfaceVariant.withOpacity(0.2)
                : AppColors.orangeColor.withOpacity(0.12),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: AppColors.orangeColor.withOpacity(0.25),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                "migration.timeline.familyMigration".tr,
                fontWeight: AppFonts.bold,
                color: AppColors.orangeColor,
                fontSize: 15,
              ),
              const SizedBox(height: 15),

              Row(
                children: [
                  Expanded(child: _locationColumn(context, "migration.timeline.from".tr, from)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(Icons.arrow_forward, size: 16, color: colors.onSurfaceVariant),
                  ),
                  Expanded(child: _locationColumn(context, "migration.timeline.to".tr, to)),
                ],
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.surface,
                    foregroundColor: colors.onSurface,
                    elevation: 0,
                    side: BorderSide(color: colors.outlineVariant.withOpacity(0.3)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: AppText(
                    "migration.timeline.viewRoute".tr,
                    fontSize: 14,
                    fontWeight: AppFonts.bold,
                    color: colors.onSurface,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _locationColumn(BuildContext context, String label, String city) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          label,
          fontSize: 13,
          fontWeight: AppFonts.bold,
          color: colors.onSurface,
        ),
        const SizedBox(height: 4),
        AppText(
          city,
          fontSize: 12,
          color: colors.onSurfaceVariant,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
