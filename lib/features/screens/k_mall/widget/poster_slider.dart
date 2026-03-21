// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import '../../../../core/utils/app_fonts.dart';
// import '../../../../core/widgets/app_text.dart';
// import '../controller/k_mall_controller.dart';
//
// class MallPosterSlider extends StatelessWidget {
//   const MallPosterSlider({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<KMallController>();
//     final colors = Theme.of(context).colorScheme;
//
//     final double sw = Get.width;
//     final bool isMobile = sw < 600;
//     final bool isDesktop = sw >= 1024;
//
//     // RESPONSIVE HEIGHT LOGIC
//     // Mobile par height screen ke hisab se, Web par fixed max height
//     final double sliderHeight = isDesktop ? 300.0 : (isMobile ? Get.height * 0.18 : 220.0);
//
//     return Column(
//       mainAxisSize: MainAxisSize.min, // Extra space fix karne ke liye
//       children: [
//         CarouselSlider(
//           options: CarouselOptions(
//             height: sliderHeight,
//             autoPlay: true,
//             // Web par slider ko thoda chota dikhayenge taaki professional lage
//             viewportFraction: isDesktop ? 0.7 : 0.9,
//             enlargeCenterPage: true,
//             onPageChanged: (index, _) => controller.changeBanner(index),
//           ),
//           items: controller.posters.map((poster) {
//             return Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 // [FIXED]: Yahan image add kiya hai from poster.imageUrl
//                 image: DecorationImage(
//                   image: NetworkImage(poster.imageUrl ?? ''),
//                   fit: BoxFit.cover,
//                   // Text ko readable banane ke liye image ke upar ek halka sa dark overlay (shadow) daala hai
//                   colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
//                 ),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(isDesktop ? 40 : 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     AppText(poster.title ?? '',
//                         color: Colors.white, // Text hamesha white rakha taaki dark overlay pe dikhe
//                         fontSize: isDesktop ? 18 : 14),
//                     const SizedBox(height: 5),
//                     AppText(
//                       poster.discount ?? '',
//                       color: Colors.white,
//                       fontSize: isDesktop ? 40 : 26,
//                       fontWeight: AppFonts.bold,
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//
//         // Spacing adjustment
//         SizedBox(height: isDesktop ? 20 : 12),
//
//         GetBuilder<KMallController>(
//           id: 'banner_dots',
//           builder: (controller) => Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(
//               controller.posters.length,
//                   (index) => AnimatedContainer(
//                 duration: const Duration(milliseconds: 300),
//                 margin: const EdgeInsets.symmetric(horizontal: 3),
//                 width: controller.currentBannerIndex == index ? (isDesktop ? 30 : 20) : 7,
//                 height: 7,
//                 decoration: BoxDecoration(
//                   color: controller.currentBannerIndex == index ? colors.primary : colors.outlineVariant,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
import '../controller/k_mall_controller.dart';

class MallPosterSlider extends StatelessWidget {
  const MallPosterSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<KMallController>();
    final colors = Theme.of(context).colorScheme;

    final double sw = Get.width;
    final bool isMobile = sw < 600;
    final bool isDesktop = sw >= 1024;

    // Height logic
    final double sliderHeight = isDesktop ? 360.0 : (isMobile ? 220.0 : 280.0);

    if (controller.posters.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: sliderHeight,
            autoPlay: true,
            viewportFraction: isDesktop ? 0.7 : 0.9,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
            onPageChanged: (index, _) => controller.changeBanner(index),
          ),
          items: controller.posters.map((poster) {
            return Container(
              width: double.infinity,
              clipBehavior: Clip.antiAlias, // Overflow hone se rokega
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(poster.imageUrl ?? ''),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
                ),
              ),
              // [100% BULLETPROOF FIX]: SingleChildScrollView + NeverScrollable
              // Isse text kabhi bhi screen ke bahar nahi jayega aur layout error nahi dega
              child: Center(
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: isDesktop ? 40 : 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            poster.title ?? '',
                            color: Colors.white,
                            fontSize: isDesktop ? 20 : 15,
                          ),
                          const SizedBox(height: 5),
                          AppText(
                            poster.discount ?? '',
                            color: Colors.white,
                            fontSize: isDesktop ? 42 : 28,
                            fontWeight: AppFonts.bold,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),

        SizedBox(height: isDesktop ? 20 : 12),

        GetBuilder<KMallController>(
          id: 'banner_dots',
          builder: (controller) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              controller.posters.length,
                  (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: controller.currentBannerIndex == index ? (isDesktop ? 30 : 20) : 7,
                height: 7,
                decoration: BoxDecoration(
                  color: controller.currentBannerIndex == index ? colors.primary : colors.outlineVariant,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}