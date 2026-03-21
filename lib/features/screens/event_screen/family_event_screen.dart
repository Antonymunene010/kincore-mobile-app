// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../core/utils/app_fonts.dart';
// import '../../../core/widgets/app_text.dart';
// import '../../../core/widgets/custom_input_field.dart';
// import 'controller/event_controller.dart';
// import 'event_detail_screen.dart';
// import 'widget/event_card.dart';
// import 'create_event_screen.dart';
//
// class FamilyEventScreen extends StatelessWidget {
//   const FamilyEventScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(EventController());
//     final theme = Theme.of(context);
//     final colors = theme.colorScheme;
//
//     return Scaffold(
//       backgroundColor: colors.surface,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         centerTitle: false,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios_new_rounded, color: colors.onSurface, size: 20),
//           onPressed: () => Get.back(),
//         ),
//         title: AppText('familyEvents.title'.tr, fontSize: 20, fontWeight: AppFonts.semiBold, color: colors.onSurface),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 15),
//             child: GestureDetector(
//               onTap: () => Get.to(() => const CreateEventScreen()),
//               child: Container(
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(color: colors.primary, shape: BoxShape.circle),
//                 child: Icon(Icons.add, color: colors.onPrimary, size: 28),
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: Center(
//         child: ConstrainedBox(
//           constraints: const BoxConstraints(maxWidth: 1100),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 10),
//                     CustomInputField(
//                       hint: 'familyEvents.findHint'.tr,
//                       label: '',
//                       prefixIcon: Icon(Icons.search, color: colors.onSurfaceVariant),
//                       onChanged: controller.filterEvents,
//                     ),
//                     const SizedBox(height: 20),
//                     Container(
//                       height: 55,
//                       padding: const EdgeInsets.all(4),
//                       decoration: BoxDecoration(
//                         color: colors.surfaceVariant.withOpacity(0.2),
//                         borderRadius: BorderRadius.circular(30),
//                         border: Border.all(color: colors.outlineVariant.withOpacity(0.5)),
//                       ),
//                       child: Obx(() => Row(
//                         children: [
//                           _buildTab('familyEvents.tabUpcoming'.tr, controller.selectedTab.value == 0, () => controller.selectedTab.value = 0, colors),
//                           _buildTab('familyEvents.tabPast'.tr, controller.selectedTab.value == 1, () => controller.selectedTab.value = 1, colors),
//                         ],
//                       )),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Expanded(
//                 child: Obx(() {
//                   if (controller.isLoading.value) {
//                     return Center(child: CircularProgressIndicator(color: colors.primary));
//                   }
//                   return LayoutBuilder(builder: (context, constraints) {
//                     return ListView.builder(
//                       padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
//                       itemCount: controller.filteredEvents.length,
//                       itemBuilder: (context, index) {
//                         final event = controller.filteredEvents[index];
//                         return Padding(
//                           padding: const EdgeInsets.only(bottom: 20),
//                           child: EventCard(
//                             title: event.title,
//                             imageUrl: event.imageUrl,
//                             date: event.date,
//                             location: event.location,
//                             status: event.status,
//                             memberAvatars: event.members,
//                             onTap: () => Get.to(() => const EventDetailScreen(), arguments: event),
//                           ),
//                         );
//                       },
//                     );
//                   });
//                 }),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTab(String label, bool isSelected, VoidCallback onTap, ColorScheme colors) {
//     return Expanded(
//       child: GestureDetector(
//         onTap: onTap,
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 250),
//           decoration: BoxDecoration(
//             color: isSelected ? colors.primary : Colors.transparent,
//             borderRadius: BorderRadius.circular(30),
//           ),
//           child: Center(
//             child: AppText(
//               label.tr,
//               fontSize: 16,
//               fontWeight: AppFonts.semiBold,
//               color: isSelected ? colors.onPrimary : colors.onSurfaceVariant,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_input_field.dart';
import 'controller/event_controller.dart';
import 'event_detail_screen.dart';
import 'widget/event_card.dart';
import 'create_event_screen.dart';

class FamilyEventScreen extends StatelessWidget {
  const FamilyEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EventController());
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: colors.onSurface, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText('familyEvents.title'.tr, fontSize: 20, fontWeight: AppFonts.semiBold, color: colors.onSurface),
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle_outline, color: AppColors.orangeColor, size: 28),
            onPressed: () => Get.to(() => const CreateEventScreen()),
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    CustomInputField(
                      hint: 'familyEvents.findHint'.tr,
                      label: '',
                      prefixIcon: Icon(Icons.search, color: colors.onSurfaceVariant),
                      // Search Logic Connected
                      onChanged: controller.onSearchChanged,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 55,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: colors.surfaceVariant.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: colors.outlineVariant.withOpacity(0.5)),
                      ),
                      child: Obx(() => Row(
                        children: [
                          _buildTab('familyEvents.tabUpcoming'.tr, controller.selectedTab.value == 0, () => controller.selectedTab.value = 0, colors),
                          _buildTab('familyEvents.tabPast'.tr, controller.selectedTab.value == 1, () => controller.selectedTab.value = 1, colors),
                        ],
                      )),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return Center(child: CircularProgressIndicator(color: colors.primary));
                  }

                  if (controller.filteredEvents.isEmpty) {
                    return Center(child: AppText("No events found", color: colors.onSurfaceVariant));
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    itemCount: controller.filteredEvents.length,
                    itemBuilder: (context, index) {
                      final event = controller.filteredEvents[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: EventCard(
                          title: event.title,
                          imageUrl: event.imageUrl,
                          date: event.date,
                          location: event.location,
                          status: event.status, // Controller se sahi status aa raha hai
                          memberAvatars: event.members,
                          onTap: () => Get.to(() => const EventDetailScreen(), arguments: event),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String label, bool isSelected, VoidCallback onTap, ColorScheme colors) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.orangeColor : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: AppText(
              label.tr,
              fontSize: 16,
              fontWeight: AppFonts.semiBold,
              color: isSelected ? colors.onPrimary : colors.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }
}