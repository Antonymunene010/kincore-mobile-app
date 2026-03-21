import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
import '../controller/request_history_controller.dart';

class RequestExpandableCard extends GetView<RequestHistoryController> {
  final int index;
  const RequestExpandableCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Obx(() {
      bool isExpanded = controller.expandedIndex.value == index;

      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          // Background: Expanded hone par light orange tint, warna default surface color
          color: isExpanded ? AppColors.orangeColor.withOpacity(0.12) : colors.surface,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isExpanded ? AppColors.orangeColor : colors.outlineVariant.withOpacity(0.5),
          ),
        ),
        child: Column(
          children: [
            // --- HEADER ---
            ListTile(
              onTap: () => controller.toggleExpansion(index),
              leading: const CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage("https://i.pravatar.cc/150?u=a"),
              ),
              // API Name (No translation needed)
              title: AppText("Arthur Harrison", fontSize: 16, fontWeight: AppFonts.bold),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                      'familyBio.existingMember'.tr,
                      fontSize: 12,
                      color: colors.onSurface.withOpacity(0.6) // Adaptive Grey
                  ),
                  const SizedBox(height: 4),
                  _buildStatusBadge(index == 0 ? 'common.approved'.tr : 'identity.status.pending'.tr, colors),
                ],
              ),
              trailing: Icon(
                isExpanded ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
                color: AppColors.orangeColor,
                size: 30,
              ),
            ),

            // --- EXPANDABLE CONTENT ---
            if (isExpanded)
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(color: AppColors.orangeColor.withOpacity(0.3)),
                    const SizedBox(height: 8),
                    // Check if you have this key in your tr files, if not you can add it
                    AppText('requestHistory.birthdateUpdate'.tr, fontSize: 14, fontWeight: AppFonts.bold),
                    const SizedBox(height: 15),
                    _buildTimeline(colors),
                  ],
                ),
              ),
          ],
        ),
      );
    });
  }

  // Adaptive Status Badge
  Widget _buildStatusBadge(String status, ColorScheme colors) {
    bool isApproved = status == 'common.approved'.tr;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: isApproved ? Colors.green.withOpacity(0.1) : AppColors.orangeColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: AppText(
          status,
          fontSize: 10,
          color: isApproved ? Colors.green : AppColors.orangeColor,
          fontWeight: AppFonts.medium
      ),
    );
  }

  Widget _buildTimeline(ColorScheme colors) {
    return Column(
      children: [
        _timelineItem('requestHistory.requestApproved'.tr, 'requestHistory.dummyApprovedTime'.tr, colors, isLast: false, child: _adminComment(colors)),
        _timelineItem('requestHistory.dataChange'.tr, "", colors, isLast: false, child: _dataDiff(colors)),
        _timelineItem('requestHistory.requestSubmitted'.tr, 'requestHistory.dummySubmittedTime'.tr, colors, isLast: true),
      ],
    );
  }

  Widget _timelineItem(String title, String time, ColorScheme colors, {required bool isLast, Widget? child}) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const Icon(Icons.circle, size: 16, color: AppColors.orangeColor),
              if (!isLast)
                Expanded(
                    child: Container(width: 2, color: AppColors.orangeColor.withOpacity(0.4))
                ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(title, fontSize: 14, fontWeight: AppFonts.bold),
                if (time.isNotEmpty)
                  AppText(time, fontSize: 11, color: colors.onSurface.withOpacity(0.5)),
                if (child != null) Padding(padding: const EdgeInsets.symmetric(vertical: 8), child: child),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Admin Comment Box (Fixed for Dark Mode)
  Widget _adminComment(ColorScheme colors) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        // Light mode mein halka orange, Dark mode mein dark surface color
        color: AppColors.orangeColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.orangeColor.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'requestHistory.adminComment'.tr,
            fontSize: 11,
            color: colors.onSurface.withOpacity(0.9),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              CircleAvatar(
                  radius: 12,
                  backgroundColor: AppColors.orangeColor.withOpacity(0.2),
                  child: Icon(Icons.person, size: 14, color: AppColors.orangeColor)
              ),
              const SizedBox(width: 8),
              // Dynamic name injection in string using .trParams
              AppText('requestHistory.reviewedBy'.trParams({'admin': 'Jane'}), fontSize: 10, fontWeight: AppFonts.bold),
            ],
          )
        ],
      ),
    );
  }

  // Data Difference Text (Fixed colors for better readability)
  Widget _dataDiff(ColorScheme colors) {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'Poppins'), // App Font use karein
        children: [
          // Dynamic data ko as it is rakha hai
          const TextSpan(text: "1980/05/12 ", style: TextStyle(color: Colors.redAccent)),
          TextSpan(text: 'requestHistory.changeTo'.tr, style: TextStyle(color: colors.onSurface.withOpacity(0.7))),
          const TextSpan(text: "1980/05/15", style: TextStyle(color: Colors.green)),
        ],
      ),
    );
  }
}