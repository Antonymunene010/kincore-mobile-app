// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kincore_app/features/screens/event_screen/family_event_screen.dart';
// import 'package:kincore_app/features/screens/home_screen/tree_view_screen.dart';
// import '../screens/profile_screen/profile_screen.dart';
// import 'custom_bottom_nav.dart';
// import 'contoller/dashboard_controller.dart';
//
// class DashboardScreen extends StatelessWidget {
//   const DashboardScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // Controller initialize kiya
//     final controller = Get.put(DashboardController());
//
//     final List<Widget> pages = [
//       const TreeScreen(),
//       const Center(child: Text("Feed")),
//       FamilyEventScreen(),
//       const Center(child: Text("K-Mall")),
//       const ProfileScreen(),
//     ];
//
//     return Scaffold(
//       extendBody: true, // Ye background content ko nav bar ke niche tak le jayega
//       body: Obx(() => IndexedStack(
//         index: controller.selectedIndex.value,
//         children: pages,
//       )),
//       // Padding isliye di hai taaki bar side se thoda chhota aur rounded dikhe
//       bottomNavigationBar: const Padding(
//         padding: EdgeInsets.fromLTRB(15, 0, 15, 20),
//         child: CustomBottomNav(),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/features/screens/event_screen/family_event_screen.dart';
import 'package:kincore_app/features/screens/feed_screen/family_fedd_screen.dart';
import 'package:kincore_app/features/screens/home_screen/tree_view_screen.dart';
import 'package:kincore_app/features/screens/k_mall_screen/k_mall_screen.dart';
import '../screens/profile_screen/profile_screen.dart';
import 'custom_bottom_nav.dart' show CustomBottomNav;
import 'contoller/dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());

    final List<Widget> pages = [
      const TreeScreen(),
      const FamilyFeedScreen(),
      const FamilyEventScreen(),
      const KMallScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      // SafeArea body ke liye taaki content top notch mein na ghuse
      body: SafeArea(
        child: Obx(() => IndexedStack(
          index: controller.selectedIndex.value,
          children: pages,
        )),
      ),
      // Bottom Nav ko Wrap kiya hai taaki OS navigation bar se door rahe
      bottomNavigationBar: const SafeArea(
        top: false, // Sirf bottom safe area handle karega
        child: CustomBottomNav(),
      ),
    );
  }
}