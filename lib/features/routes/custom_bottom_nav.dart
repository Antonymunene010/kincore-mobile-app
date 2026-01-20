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
//
//     return Obx(() {
//       return Stack(
//         clipBehavior: Clip.none, // Bahar ki line dikhane ke liye zaroori hai
//         alignment: Alignment.topCenter,
//         children: [
//           // 1. Main Background Container (Peach Color)
//           Container(
//             height: 65,
//             decoration: BoxDecoration(
//               color: const Color(0xFFFFD8C7),
//               borderRadius: BorderRadius.circular(35),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: List.generate(5, (index) => _buildNavItem(index, controller)),
//             ),
//           ),
//
//           // 2. Floating Orange Line (Container ke bahar upar ki taraf)
//           Positioned(
//             top: -2, // Image ke hisab se exact upar set kiya
//             left: 0,
//             right: 0,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: List.generate(5, (index) {
//                 bool isSelected = controller.selectedIndex.value == index;
//                 return AnimatedContainer(
//                   duration: const Duration(milliseconds: 250),
//                   width: isSelected ? 50 : 0, // Line ki length icon ke upar
//                   height: 3, // Line ki thickness
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFFF6130),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 );
//               }),
//             ),
//           ),
//         ],
//       );
//     });
//   }
//
//   Widget _buildNavItem(int index, DashboardController controller) {
//     bool isSelected = controller.selectedIndex.value == index;
//     List<String> icons = ['tree.svg', 'feed.svg', 'event.svg', 'shopping.svg', 'user.svg'];
//     List<String> labels = ['Tree', 'Feed', 'Events', 'Shop', 'Profile'];
//
//     return Expanded(
//       child: GestureDetector(
//         onTap: () => controller.changeIndex(index),
//         behavior: HitTestBehavior.opaque,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const SizedBox(height: 5), // Top line se thodi gap
//             SvgPicture.asset(
//               'assets/icons/${icons[index]}',
//               height: 22,
//               colorFilter: ColorFilter.mode(
//                 isSelected ? const Color(0xFFFF6130) : Colors.black54,
//                 BlendMode.srcIn,
//               ),
//             ),
//             if (isSelected)
//               Padding(
//                 padding: const EdgeInsets.only(top: 2),
//                 child: Text(
//                   labels[index],
//                   style: const TextStyle(
//                     fontSize: 10,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFFFF6130),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'contoller/dashboard_controller.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Obx(() {
      return Container(
        height: 60,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Color(0xFFE8E8E8), width: 1), // Top light divider
          ),
        ),
        child: Row(
          children: List.generate(5, (index) {
            final bool isSelected = controller.selectedIndex.value == index;
            final Color activeColor = const Color(0xFFFF6130);

            final icons = ['tree.svg', 'feed.svg', 'event.svg', 'shopping.svg', 'user.svg'];
            final labels = ['Tree', 'Feed', 'Events', 'K-mall', 'Profile'];

            return Expanded(
              child: InkWell(
                onTap: () => controller.changeIndex(index),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // --- Selected Orange Indicator (Top Border Touch) ---
                    if (isSelected)
                      Positioned(
                        top: 0,
                        child: Container(
                          width: 45,
                          height: 3,
                          decoration: BoxDecoration(
                            color: activeColor,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(4),
                              bottomRight: Radius.circular(4),
                            ),
                          ),
                        ),
                      ),

                    // --- Icon & Label ---
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 4),
                        SvgPicture.asset(
                          'assets/icons/${icons[index]}',
                          height: 22,
                          colorFilter: ColorFilter.mode(
                            isSelected ? activeColor : Colors.grey,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          labels[index],
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            color: isSelected ? activeColor : Colors.grey,
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