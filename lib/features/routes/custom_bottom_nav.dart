// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'contoller/dashboard_controller.dart';
//
// class CustomBottomNav extends StatelessWidget {
//   const CustomBottomNav({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<DashboardController>();
//     final theme = Theme.of(context);
//     final colors = theme.colorScheme;
//
//     return Obx(() {
//       return Container(
//         height: 60,
//         decoration: BoxDecoration(
//           color: colors.surface,
//           border: Border(
//             top: BorderSide(
//               color: theme.dividerColor,
//               width: 1,
//             ),
//           ),
//         ),
//         child: Row(
//           children: List.generate(5, (index) {
//             final bool isSelected = controller.selectedIndex.value == index;
//             const activeColor = Color(0xFFFF6130);
//
//             final icons = ['home.svg', 'feed.svg', 'tree.svg', 'shopping.svg', 'user.svg'];
//             final labels = ['nav.home', 'nav.feed', 'nav.tree', 'nav.mall', 'nav.profile'];
//
//             return Expanded(
//               child: InkWell(
//                 onTap: () => controller.changeIndex(index),
//                 splashColor: Colors.transparent,
//                 highlightColor: Colors.transparent,
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     if (isSelected)
//                       Positioned(
//                         top: 0,
//                         child: Container(
//                           width: 45,
//                           height: 3,
//                           decoration: const BoxDecoration(
//                             color: activeColor,
//                             borderRadius: BorderRadius.only(
//                               bottomLeft: Radius.circular(4),
//                               bottomRight: Radius.circular(4),
//                             ),
//                           ),
//                         ),
//                       ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const SizedBox(height: 4),
//                         SvgPicture.asset(
//                           'assets/icons/${icons[index]}',
//                           height: 22,
//                           colorFilter: ColorFilter.mode(
//                             isSelected ? activeColor : colors.onSurface.withOpacity(0.6),
//                             BlendMode.srcIn,
//                           ),
//                         ),
//                         const SizedBox(height: 2),
//                         Text(
//                           labels[index].tr,
//                           style: TextStyle(
//                             fontSize: 10,
//                             fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//                             color: isSelected ? activeColor : colors.onSurface.withOpacity(0.6),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }),
//         ),
//       );
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'contoller/dashboard_controller.dart';

// 📱 MOBILE KE LIYE BOTTOM NAV (Unchanged)
class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Obx(() {
      return Container(
        height: 60, // [FIXED]: Wapas original height 60 kar di
        decoration: BoxDecoration(
          color: colors.surface,
          border: Border(
            top: BorderSide(color: theme.dividerColor, width: 1),
          ),
        ),
        child: Row(
          children: List.generate(5, (index) {
            final bool isSelected = controller.selectedIndex.value == index;
            const activeColor = Color(0xFFFF6130);

            final icons = ['home.svg', 'feed.svg', 'tree.svg', 'shopping.svg', 'user.svg'];
            final labels = ['nav.home', 'nav.feed', 'nav.tree', 'nav.mall', 'nav.profile'];

            return Expanded(
              child: InkWell(
                onTap: () => controller.changeIndex(index),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // TOP LINE - Apni jagah par fix rahegi
                    if (isSelected)
                      Positioned(
                        top: 0,
                        child: Container(
                          width: 45,
                          height: 3,
                          decoration: const BoxDecoration(
                            color: activeColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(4),
                              bottomRight: Radius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    // ICON & TEXT
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center, // Original behavior wapas
                      children: [
                        const SizedBox(height: 4),
                        SvgPicture.asset(
                          'assets/icons/${icons[index]}',
                          height: 22,
                          colorFilter: ColorFilter.mode(
                            isSelected ? activeColor : colors.onSurface.withOpacity(0.6),
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0), // Thodi side space
                          child: Text(
                            labels[index].tr,
                            maxLines: 1, // [FIXED]: Text doosri line me nahi jayega
                            overflow: TextOverflow.ellipsis, // [FIXED]: Lamba hua toh "..." aayega
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              color: isSelected ? activeColor : colors.onSurface.withOpacity(0.6),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      );
    });
  }
}

// 💻 DESKTOP/WEB KE LIYE LATEST EXPANDABLE SIDE NAV
class CustomSideNav extends StatefulWidget {
  const CustomSideNav({super.key});

  @override
  State<CustomSideNav> createState() => _CustomSideNavState();
}

class _CustomSideNavState extends State<CustomSideNav> {
  // Sidebar open/close track karne ke liye state
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Obx(() {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: isExpanded ? 220 : 80, // Expand hone pe 220px, Collapse pe 80px
        decoration: BoxDecoration(
          color: colors.surface,
          border: Border(
            right: BorderSide(color: theme.dividerColor, width: 1),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 15),

            // --- HAMBURGER MENU ICON ---
            InkWell(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                height: 50,
                alignment: isExpanded ? Alignment.centerLeft : Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: isExpanded ? 24 : 0),
                child: Icon(Icons.menu_rounded, color: colors.onSurface, size: 28),
              ),
            ),

            const SizedBox(height: 20),

            // --- MENU ITEMS ---
            ...List.generate(5, (index) {
              final bool isSelected = controller.selectedIndex.value == index;
              const activeColor = Color(0xFFFF6130);

              final icons = ['home.svg', 'feed.svg', 'tree.svg', 'shopping.svg', 'user.svg'];
              final labels = ['nav.home', 'nav.feed', 'nav.tree', 'nav.mall', 'nav.profile'];

              return InkWell(
                onTap: () => controller.changeIndex(index),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  height: 60, // [FIXED] Height fix ki taaki active line badi na ho
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: Stack(
                    children: [
                      // --- ACTIVE LINE ---
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 300),
                        left: 0,
                        top: 15,
                        bottom: 15,
                        width: isSelected ? 4 : 0, // Sirf select hone pe dikhegi
                        child: Container(
                          decoration: const BoxDecoration(
                            color: activeColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(6),
                              bottomRight: Radius.circular(6),
                            ),
                          ),
                        ),
                      ),

                      // --- ICON AND TEXT ---
                      Row(
                        children: [
                          // Padding icon ko center ya left align karne ke liye
                          SizedBox(width: isExpanded ? 24 : 28),

                          SvgPicture.asset(
                            'assets/icons/${icons[index]}',
                            height: 24,
                            width: 24,
                            colorFilter: ColorFilter.mode(
                              isSelected ? activeColor : colors.onSurface.withOpacity(0.6),
                              BlendMode.srcIn,
                            ),
                          ),

                          // --- ANIMATED TEXT ---
                          if (isExpanded) ...[
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                labels[index].tr,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                  color: isSelected ? activeColor : colors.onSurface.withOpacity(0.6),
                                ),
                              ),
                            ),
                          ]
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      );
    });
  }
}