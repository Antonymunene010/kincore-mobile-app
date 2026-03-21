import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_colors.dart'; // Make sure this exists
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_input_field.dart';
import 'controller/notification_controller.dart';
import 'model/notification_model.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationController());
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : colors.surface,
      appBar: AppBar(
        backgroundColor: colors.surface,
        elevation: 0.5,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: colors.onSurface),
          onPressed: () => Get.back(),
        ),
        title: AppText('Notifications'.tr, fontSize: 20, fontWeight: AppFonts.semiBold, color: colors.onSurface),
        actions: [
          // Mark All Read Shortcut
          IconButton(
            icon: Icon(Icons.done_all, color: colors.primary),
            onPressed: controller.markAllRead,
            tooltip: "Mark all as read".tr,
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          // --- SEARCH & FILTER SECTION ---
          Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
            color: colors.surface,
            child: Column(
              children: [
                // Search Bar
                CustomInputField(
                  label: '',
                  hint: 'Search notifications...'.tr,
                  prefixIcon: const Icon(Icons.search),
                  onChanged: controller.search,
                  // Assuming CustomInputField has styling, if not wrap in Container
                ),
                const SizedBox(height: 15),

                // Filter Chips
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildFilterChip("All", controller, colors),
                      _buildFilterChip("Unread", controller, colors),
                      _buildFilterChip("Events", controller, colors),
                      _buildFilterChip("Gifts", controller, colors),
                      _buildFilterChip("Security", controller, colors),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // --- NOTIFICATION LIST ---
          Expanded(
            child: Obx(() {
              if (controller.filteredNotifications.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.notifications_off_outlined, size: 60, color: colors.outlineVariant),
                      const SizedBox(height: 10),
                      AppText("No notifications found".tr, color: colors.onSurfaceVariant),
                    ],
                  ),
                );
              }
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.filteredNotifications.length,
                itemBuilder: (context, index) {
                  final notif = controller.filteredNotifications[index];
                  return _buildNotificationTile(context, notif, controller, colors);
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  // --- WIDGETS ---

  Widget _buildFilterChip(String label, NotificationController controller, ColorScheme colors) {
    return Obx(() {
      bool isSelected = controller.selectedFilter.value == label;
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: ChoiceChip(
          label: Text(label.tr), // Added .tr here
          selected: isSelected,
          onSelected: (val) => controller.changeFilter(label),
          selectedColor: colors.primary.withOpacity(0.1),
          backgroundColor: colors.surface,
          labelStyle: TextStyle(
            color: isSelected ? colors.primary : colors.onSurface,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: isSelected ? colors.primary : colors.outlineVariant.withOpacity(0.5),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildNotificationTile(BuildContext context, NotificationModel notif, NotificationController controller, ColorScheme colors) {
    return Dismissible(
      key: Key(notif.id.toString()),
      background: Container(color: Colors.red, alignment: Alignment.centerRight, padding: const EdgeInsets.only(right: 20), child: const Icon(Icons.delete, color: Colors.white)),
      onDismissed: (direction) {
        // Handle delete if needed
      },
      child: Material(
        color: notif.isRead ? Colors.transparent : colors.primary.withOpacity(0.05), // Highlight Unread
        child: InkWell(
          onTap: () => controller.handleNotificationTap(notif),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon based on Type
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: colors.surfaceContainerHighest,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(_getIconForType(notif.type), color: colors.primary, size: 24),
                ),
                const SizedBox(width: 15),

                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: AppText(
                              notif.title, // Usually dynamic data
                              fontSize: 15,
                              fontWeight: notif.isRead ? AppFonts.medium : AppFonts.bold,
                              color: colors.onSurface,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          AppText(notif.time, fontSize: 11, color: colors.onSurfaceVariant),
                        ],
                      ),
                      const SizedBox(height: 4),
                      AppText(
                        notif.body, // Usually dynamic data
                        fontSize: 13,
                        color: notif.isRead ? colors.onSurfaceVariant : colors.onSurface,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

                // Unread Indicator Dot
                if (!notif.isRead)
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: CircleAvatar(radius: 4, backgroundColor: colors.primary),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _getIconForType(NotificationType type) {
    switch (type) {
      case NotificationType.identity: return Icons.verified_user_outlined;
      case NotificationType.relationship: return Icons.family_restroom;
      case NotificationType.gift: return Icons.card_giftcard;
      case NotificationType.event: return Icons.event;
      case NotificationType.security: return Icons.security;
      case NotificationType.admin: return Icons.admin_panel_settings_outlined;
      default: return Icons.notifications_none;
    }
  }
}