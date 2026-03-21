// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kincore_app/core/utils/app_colors.dart';
// import '../controller/request_history_controller.dart';
// import '../../../../core/widgets/app_text.dart';
//
// class StatusFilterTabs extends GetView<RequestHistoryController> {
//   const StatusFilterTabs({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final colors = theme.colorScheme;
//     final tabs = ["All", "Pending", "Approved", "Rejected"];
//
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//       child: Row(
//         children: tabs.map((tab) => Obx(() {
//           bool isSelected = controller.selectedTab.value == tab;
//
//           return GestureDetector(
//             onTap: () => controller.selectTab(tab),
//             child: AnimatedContainer(
//               duration: const Duration(milliseconds: 250), // Smooth transition
//               margin: const EdgeInsets.symmetric(horizontal: 6),
//               padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
//               decoration: BoxDecoration(
//                 // Selected hai toh Orange, warna transparent
//                 color: isSelected ? AppColors.orangeColor : Colors.transparent,
//                 borderRadius: BorderRadius.circular(25),
//                 border: Border.all(
//                   // Unselected state mein theme ke border color ko follow karega
//                   color: isSelected
//                       ? AppColors.orangeColor
//                       : colors.outlineVariant.withOpacity(0.6),
//                   width: 1.2,
//                 ),
//               ),
//               child: AppText(
//                 tab,
//                 fontSize: 14,
//                 // Selected hai toh white text (hamesha readable),
//                 // warna theme ka secondary text color
//                 color: isSelected
//                     ? Colors.white
//                     : colors.onSurface.withOpacity(0.7),
//                 fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//               ),
//             ),
//           );
//         })).toList(),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import '../controller/request_history_controller.dart';
import '../../../../core/widgets/app_text.dart';

class StatusFilterTabs extends GetView<RequestHistoryController> {
  const StatusFilterTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final tabs = ["All", "Pending", "Approved", "Rejected"];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Container(
        height: 50, // Slightly increased for better tap target
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          // Light mode mein halka grey, Dark mode mein surface-variant (Darker grey/navy)
          color: colors.surfaceVariant.withOpacity(0.5),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Obx(() {
          return Row(
            children: List.generate(tabs.length, (index) {
              final tab = tabs[index];
              final bool isSelected = controller.selectedTab.value == tab;

              return Expanded(
                child: GestureDetector(
                  onTap: () => controller.selectTab(tab),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.orangeColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                      // Selected tab par halka shadow taaki wo "pop" kare
                      boxShadow: isSelected && theme.brightness == Brightness.light
                          ? [
                        BoxShadow(
                          color: AppColors.orangeColor.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        )
                      ]
                          : [],
                    ),
                    alignment: Alignment.center,
                    child: AppText(
                      tab.tr, // [FIXED]: Yahan .tr lagaya gaya hai
                      fontSize: 13,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                      color: isSelected
                          ? Colors.white
                          : colors.onSurfaceVariant,
                    ),
                  ),
                ),
              );
            }),
          );
        }),
      ),
    );
  }
}