import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';

class TrackOrderScreen extends StatelessWidget {
  final String orderId;
  final dynamic orderData;

  const TrackOrderScreen({super.key, required this.orderId, required this.orderData});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    // Dummy Tracking Steps (Isko aap baad me API data se map kar lena)
    final List<Map<String, dynamic>> trackingSteps = [
      {"title": 'trackOrder.stepPlaced'.tr, "time": "20 Oct, 10:00 AM", "isDone": true},
      {"title": 'trackOrder.stepPayment'.tr, "time": "20 Oct, 10:05 AM", "isDone": true},
      {"title": 'trackOrder.stepShipped'.tr, "time": "21 Oct, 09:30 AM", "isDone": true},
      {"title": 'trackOrder.stepOutForDelivery'.tr, "time": 'trackOrder.expectedToday'.tr, "isDone": false},
      {"title": 'trackOrder.stepDelivered'.tr, "time": 'trackOrder.pending'.tr, "isDone": false},
    ];

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        title: AppText('trackOrder.title'.tr, fontWeight: AppFonts.semiBold, fontSize: 18),
        backgroundColor: colors.surface,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, size: 20, color: colors.onSurface),
          onPressed: () => Get.back(),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              // Order Info Header
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.orangeColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColors.orangeColor.withOpacity(0.2)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText('trackOrder.orderId'.tr, fontSize: 12, color: colors.onSurfaceVariant),
                        const SizedBox(height: 4),
                        AppText("#$orderId", fontSize: 16, fontWeight: AppFonts.bold),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AppText('trackOrder.expectedDelivery'.tr, fontSize: 12, color: colors.onSurfaceVariant),
                        const SizedBox(height: 4),
                        // Date ko dummy rakha hai, API se aaye tab aap dynamic bana lena
                        AppText("24 Oct 2026", fontSize: 14, fontWeight: AppFonts.semiBold, color: AppColors.orangeColor),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              AppText('trackOrder.trackingHistory'.tr, fontSize: 18, fontWeight: AppFonts.semiBold),
              const SizedBox(height: 20),

              // Vertical Tracking Stepper
              ...List.generate(trackingSteps.length, (index) {
                final step = trackingSteps[index];
                final bool isLast = index == trackingSteps.length - 1;
                return _buildTrackingStep(
                  title: step['title'],
                  time: step['time'],
                  isDone: step['isDone'],
                  isLast: isLast,
                  colors: colors,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrackingStep({
    required String title,
    required String time,
    required bool isDone,
    required bool isLast,
    required ColorScheme colors,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Stepper Icon & Line
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: isDone ? AppColors.orangeColor : colors.surface,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isDone ? AppColors.orangeColor : colors.outlineVariant,
                  width: 2,
                ),
              ),
              child: Icon(Icons.check, size: 14, color: isDone ? Colors.white : Colors.transparent),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 40,
                color: isDone ? AppColors.orangeColor : colors.outlineVariant.withOpacity(0.5),
              ),
          ],
        ),
        const SizedBox(width: 15),
        // Step Details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                title,
                fontSize: 15,
                fontWeight: isDone ? AppFonts.bold : AppFonts.medium,
                color: isDone ? colors.onSurface : colors.onSurfaceVariant,
              ),
              const SizedBox(height: 4),
              AppText(time, fontSize: 12, color: colors.onSurfaceVariant),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}