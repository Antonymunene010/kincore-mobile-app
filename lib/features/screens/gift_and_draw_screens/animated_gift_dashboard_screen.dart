import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_network_image.dart';
import '../../routes/dashboard_screen.dart';

class AdminGiftDashboardScreen extends StatelessWidget {
  const AdminGiftDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    // Dummy Draw Results: [Drawer] -> [Receiver]
    final List<Map<String, String>> drawResults = [
      {"drawerName": "Sarah Anderson", "drawerImg": "https://i.pravatar.cc/150?u=sarah", "receiverName": "Mike Johnson", "receiverImg": "https://i.pravatar.cc/150?u=mike"},
      {"drawerName": "Mike Johnson", "drawerImg": "https://i.pravatar.cc/150?u=mike", "receiverName": "Emma Davis", "receiverImg": "https://i.pravatar.cc/150?u=emma"},
      {"drawerName": "Emma Davis", "drawerImg": "https://i.pravatar.cc/150?u=emma", "receiverName": "Sarah Anderson", "receiverImg": "https://i.pravatar.cc/150?u=sarah"},
    ];

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        backgroundColor: colors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: colors.onSurface, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText('giftSwap.eventDashboard'.tr, fontWeight: AppFonts.bold, fontSize: 18),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // --- Event Details Card ---
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.orangeColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.orangeColor.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.card_giftcard, color: AppColors.orangeColor, size: 30),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Event Name API se aayega
                        AppText("Family Christmas Swap", fontSize: 16, fontWeight: AppFonts.bold, color: colors.onSurface),
                        const SizedBox(height: 4),
                        // Budget & Date formatted dynamically
                        AppText(
                            'giftSwap.budgetDate'.trParams({
                              'amount': '\$50',
                              'date': 'Dec 25, 2026'
                            }),
                            fontSize: 12,
                            color: colors.onSurfaceVariant
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // --- Draw Results Header ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText('giftSwap.drawResults'.tr, fontSize: 18, fontWeight: AppFonts.semiBold, color: colors.onSurface),
                TextButton.icon(
                  onPressed: () {
                    // Reshuffle Logic
                    Get.snackbar(
                        'giftSwap.reshuffle'.tr,
                        'giftSwap.reshuffleMsg'.tr
                    );
                  },
                  icon: const Icon(Icons.shuffle, size: 16, color: AppColors.orangeColor),
                  label: AppText('giftSwap.reshuffle'.tr, fontSize: 13, color: AppColors.orangeColor, fontWeight: AppFonts.semiBold),
                )
              ],
            ),
            const SizedBox(height: 10),
            AppText('giftSwap.adminViewOnly'.tr, fontSize: 12, color: colors.onSurfaceVariant),
            const SizedBox(height: 15),

            // --- Draw Results List ---
            Expanded(
              child: ListView.separated(
                itemCount: drawResults.length,
                separatorBuilder: (context, index) => Divider(color: colors.outlineVariant.withOpacity(0.3)),
                itemBuilder: (context, index) {
                  final pair = drawResults[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        // [FIXED]: Left Side (Drawer) ko Expanded mein daala
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              CustomNetworkImage(imageUrl: pair["drawerImg"]!, height: 45, width: 45, borderRadius: 25),
                              const SizedBox(height: 6),
                              AppText(
                                pair["drawerName"]!,
                                fontSize: 11,
                                fontWeight: AppFonts.medium,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis, // Bada naam aane par '...' dikhega
                              ),
                            ],
                          ),
                        ),

                        // [FIXED]: Arrow section with fixed flex taaki center mein rahe
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(height: 2, width: 15, color: colors.outlineVariant),
                              Icon(Icons.arrow_forward_ios, size: 14, color: colors.outlineVariant),
                            ],
                          ),
                        ),

                        // [FIXED]: Right Side (Receiver) ko Expanded mein daala
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              CustomNetworkImage(imageUrl: pair["receiverImg"]!, height: 45, width: 45, borderRadius: 25),
                              const SizedBox(height: 6),
                              AppText(
                                pair["receiverName"]!,
                                fontSize: 11,
                                fontWeight: AppFonts.medium,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // --- Naya Button: Back to Home Screen ---
            const SizedBox(height: 15),
            CustomButton(
              text: 'giftSwap.backToHome'.tr,
              backgroundColor: AppColors.orangeColor,
              onPressed: () {
                Get.offAll(() => const DashboardScreen());
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}