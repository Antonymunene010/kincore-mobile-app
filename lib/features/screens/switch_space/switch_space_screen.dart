import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/features/routes/dashboard_screen.dart';
import 'package:kincore_app/features/screens/find_family_member/find_your_self.dart';import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/custom_button.dart';
import 'widget/space_card.dart';

class SwitchSpaceScreen extends StatelessWidget {
  const SwitchSpaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Theme data fetch kiya
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final List<Map<String, dynamic>> dummySpaces = [
      {"name": "The Anderson Family", "members": "12", "online": true, "image": "assets/images/Ellipse.png"},
      {"name": "The Niva Family", "members": "10", "online": false, "image": "https://images.unsplash.com/photo-1511895426328-dc8714191300"},
      {"name": "The Saddon Family", "members": "8", "online": true, "image": "https://images.unsplash.com/photo-1544005313-94ddf0286df2"},
      {"name": "The Mahajan Family", "members": "6", "online": false, "image": "https://images.unsplash.com/photo-1529333166437-7750a6dd5a70"},
    ];

    var selectedIndex = 0.obs;

    return Scaffold(
      backgroundColor: colors.surface, // Scaffold background fix
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: colors.surface, // AppBar background fix (was grey[150])
        leading: IconButton(
          // [FIX] Icon color ab theme ke hisaab se change hoga (Black/White)
          icon: Icon(Icons.arrow_back_ios, color: colors.onSurface, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText("space.switch".tr, fontSize: 20, fontWeight: AppFonts.semiBold),
        actions: [
          TextButton(
            onPressed: () => Get.offAll(() => const FindYourselfScreen()),
            child: AppText("common.done".tr, fontSize: 14, color: AppColors.orangeColor, fontWeight: AppFonts.semiBold),
          ),
        ],
      ),
      // Badi screen par content beech mein rahe isliye Center + ConstrainedBox
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600), // Web compatibility
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                AppText("space.current".tr, fontSize: 16, fontWeight: AppFonts.semiBold),
                const SizedBox(height: 15),
                Obx(() => SpaceCard(
                  name: dummySpaces[selectedIndex.value]['name'],
                  members: dummySpaces[selectedIndex.value]['members'],
                  imageUrl: dummySpaces[selectedIndex.value]['image'],
                  isActive: true,
                  isOnline: dummySpaces[selectedIndex.value]['online'],
                  onTap: () {},
                )),
                const SizedBox(height: 10),
                AppText("space.other".tr, fontSize: 16, fontWeight: AppFonts.semiBold),
                const SizedBox(height: 15),
                Expanded(
                  child: ListView.builder(
                    itemCount: dummySpaces.length,
                    itemBuilder: (context, index) {
                      return Obx(() => SpaceCard(
                        name: dummySpaces[index]['name'],
                        members: dummySpaces[index]['members'],
                        imageUrl: dummySpaces[index]['image'],
                        isActive: selectedIndex.value == index,
                        isOnline: false,
                        onTap: () => selectedIndex.value = index,
                      ));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: CustomButton(
                    text: "space.confirmSwitch".tr,
                    onPressed: () {

                      Get.snackbar(
                        "space.switch".tr,
                        "space.switchedTo".trParams({'spaceName': dummySpaces[selectedIndex.value]['name']}),                        backgroundColor: colors.surface,
                        colorText: colors.onSurface,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kincore_app/features/routes/dashboard_screen.dart';
// import '../../../core/utils/app_colors.dart';
// import '../../../core/widgets/app_text.dart';
// import '../../../core/utils/app_fonts.dart';
// import '../../../core/widgets/custom_button.dart';
// import 'controller/switch_space_controller.dart';
// import 'widget/space_card.dart';
//
// class SwitchSpaceScreen extends StatelessWidget {
//   const SwitchSpaceScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // Controller initialize kiya
//     final controller = Get.put(SwitchSpaceController());
//
//     final theme = Theme.of(context);
//     final colors = theme.colorScheme;
//
//     return Scaffold(
//       backgroundColor: colors.surface,
//       appBar: AppBar(
//         elevation: 0,
//         centerTitle: false,
//         backgroundColor: colors.surface,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios, color: colors.onSurface, size: 20),
//           onPressed: () => Get.back(),
//         ),
//         title: AppText("space.switch".tr, fontSize: 20, fontWeight: AppFonts.semiBold),
//         actions: [
//           TextButton(
//             onPressed: () => Get.offAll(() => const DashboardScreen()),
//             child: AppText("common.done".tr, fontSize: 14, color: AppColors.orangeColor, fontWeight: AppFonts.semiBold),
//           ),
//         ],
//       ),
//       body: Center(
//         child: ConstrainedBox(
//           constraints: const BoxConstraints(maxWidth: 600),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 20),
//                 AppText("space.current".tr, fontSize: 16, fontWeight: AppFonts.semiBold),
//                 const SizedBox(height: 15),
//
//                 // CURRENT SPACE (Jo list me selected hai)
//                 Obx(() {
//                   if (controller.spaces.isEmpty) return const SizedBox();
//                   final currentSpace = controller.spaces[controller.selectedIndex.value];
//                   return SpaceCard(
//                     name: currentSpace['name'],
//                     members: currentSpace['members'],
//                     imageUrl: currentSpace['image'],
//                     isActive: true,
//                     isOnline: currentSpace['online'],
//                     onTap: () {},
//                   );
//                 }),
//
//                 const SizedBox(height: 10),
//                 AppText("space.other".tr, fontSize: 16, fontWeight: AppFonts.semiBold),
//                 const SizedBox(height: 15),
//
//                 // OTHER SPACES LIST
//                 Expanded(
//                   child: Obx(() => ListView.builder(
//                     itemCount: controller.spaces.length,
//                     itemBuilder: (context, index) {
//                       final space = controller.spaces[index];
//                       return SpaceCard(
//                         name: space['name'],
//                         members: space['members'],
//                         imageUrl: space['image'],
//                         isActive: controller.selectedIndex.value == index,
//                         isOnline: false,
//                         onTap: () => controller.selectSpace(index),
//                       );
//                     },
//                   )),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 20),
//                   child: CustomButton(
//                     text: "space.confirmSwitch".tr,
//                     onPressed: () {
//                       Get.snackbar(
//                         "space.switch".tr,
//                         "space.switchedTo".trParams({'spaceName': controller.spaces[controller.selectedIndex.value]['name']}),
//                         backgroundColor: colors.surface,
//                         colorText: colors.onSurface,
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }