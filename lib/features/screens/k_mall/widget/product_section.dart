// // import 'package:flutter/material.dart';
// // import '../../../../core/utils/app_fonts.dart';
// // import '../../../../core/widgets/app_text.dart';
// // import '../../../../core/widgets/custom_text_button.dart';
// // import '../controller/k_mall_controller.dart';
// // import '../data/product_model.dart';
// // import 'mall_product_card.dart';
// //
// // class ProductSection extends StatelessWidget {
// //   final String title;
// //   final List<ProductModel> items;
// //   final KMallController controller;
// //   final VoidCallback onSeeAll; // Added for navigation later
// //
// //   const ProductSection({
// //     super.key,
// //     required this.title,
// //     required this.items,
// //     required this.controller,
// //     required this.onSeeAll,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final colors = Theme.of(context).colorScheme;
// //     return Column(
// //       children: [
// //         Padding(
// //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
// //           child: Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               AppText(title, fontSize: 18, fontWeight: AppFonts.bold, color: colors.onSurface),
// //               CustomTextButton(
// //                 text: "See All",
// //                 onPressed: onSeeAll,
// //               ),
// //             ],
// //           ),
// //         ),
// //         SizedBox(
// //           height: 230,
// //           child: ListView.builder(
// //             scrollDirection: Axis.horizontal,
// //             padding: const EdgeInsets.only(left: 20),
// //             physics: const BouncingScrollPhysics(),
// //             itemCount: items.length,
// //             itemBuilder: (_, i) => MallProductCard(item: items[i], controller: controller),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import '../../../../core/utils/app_fonts.dart';
// import '../../../../core/widgets/app_text.dart';
// import '../../../../core/widgets/custom_text_button.dart';
// import '../controller/k_mall_controller.dart';
// import '../data/product_model.dart';
// import 'mall_product_card.dart'; // Naya merged card import karo
//
// class ProductSection extends StatelessWidget {
//   final String title;
//   final List<ProductModel> items;
//   final KMallController controller;
//   final VoidCallback onSeeAll;
//
//   const ProductSection({
//     super.key,
//     required this.title,
//     required this.items,
//     required this.controller,
//     required this.onSeeAll,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final colors = Theme.of(context).colorScheme;
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               AppText(title, fontSize: 18, fontWeight: AppFonts.bold, color: colors.onSurface),
//               CustomTextButton(
//                 text: "See All",
//                 onPressed: onSeeAll,
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 220, // Card ki height ke hisaab se adjust kiya
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             padding: const EdgeInsets.only(left: 20),
//             physics: const BouncingScrollPhysics(),
//             itemCount: items.length,
//             itemBuilder: (_, i) => MallProductCard(
//               item: items[i],
//               controller: controller,
//               width: 160, // Horizontal list mein width fix rakhi hai
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../controller/k_mall_controller.dart';
import '../data/product_model.dart';
import 'mall_product_card.dart';

class ProductSection extends StatelessWidget {
  final String title;
  final List<ProductModel> items;
  final KMallController controller;
  final VoidCallback onSeeAll;

  const ProductSection({
    super.key,
    required this.title,
    required this.items,
    required this.controller,
    required this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(title, fontSize: 18, fontWeight: AppFonts.bold, color: colors.onSurface),
              CustomTextButton(
                text: 'common.seeAll'.tr,                onPressed: onSeeAll,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20),
            physics: const BouncingScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (_, i) => MallProductCard(
              item: items[i],
              controller: controller,
              width: 160,
            ),
          ),
        ),
      ],
    );
  }
}