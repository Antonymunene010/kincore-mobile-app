// // import 'package:flutter/material.dart';
// // import '../../../../core/utils/app_fonts.dart';
// // import '../../../../core/widgets/app_text.dart';
// // import '../../../../core/widgets/custom_network_image.dart';
// // import '../controller/k_mall_controller.dart';
// // import '../data/product_model.dart';
// //
// // class MallProductCard extends StatelessWidget {
// //   final ProductModel item;
// //   final KMallController controller;
// //
// //   const MallProductCard({super.key, required this.item, required this.controller});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final colors = Theme.of(context).colorScheme;
// //     return Container(
// //       width: 155,
// //       margin: const EdgeInsets.only(right: 15),
// //       decoration: BoxDecoration(
// //         color: colors.surfaceVariant.withOpacity(0.2),
// //         borderRadius: BorderRadius.circular(20),
// //         border: Border.all(color: colors.outlineVariant.withOpacity(0.3)),
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Stack(
// //             children: [
// //               CustomNetworkImage(
// //                 imageUrl: item.image,
// //                 height: 140,
// //                 width: double.infinity,
// //                 borderRadius: 20,
// //                 fit: BoxFit.cover,
// //               ),
// //               Positioned(
// //                 top: 8,
// //                 right: 8,
// //                 child: GestureDetector(
// //                   onTap: () => controller.toggleFavorite(item),
// //                   child: Container(
// //                     padding: const EdgeInsets.all(5),
// //                     decoration: BoxDecoration(
// //                       color: colors.surface.withOpacity(0.5),
// //                       shape: BoxShape.circle,
// //                     ),
// //                     child: Icon(
// //                       item.isFavorite ? Icons.favorite : Icons.favorite_border,
// //                       size: 18,
// //                       color: item.isFavorite ? Colors.red : Colors.white,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.all(12),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 AppText(item.name, maxLines: 1, fontWeight: AppFonts.semiBold, fontSize: 14, color: colors.onSurface),
// //                 const SizedBox(height: 4),
// //                 AppText("\$${item.price}", color: colors.primary, fontWeight: AppFonts.bold, fontSize: 15),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import '../../../../core/utils/app_fonts.dart';
// import '../../../../core/widgets/app_text.dart';
// import '../../../../core/widgets/custom_network_image.dart';
// import '../controller/k_mall_controller.dart';
// import '../data/product_model.dart';
//
// class MallProductCard extends StatelessWidget {
//   final ProductModel item;
//   final KMallController controller;
//   final double width; // Horizontal list ke liye fixed width
//
//   const MallProductCard({
//     super.key,
//     required this.item,
//     required this.controller,
//     this.width = 160,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final colors = Theme.of(context).colorScheme;
//
//     return Container(
//       width: width,
//       margin: const EdgeInsets.only(right: 15),
//       decoration: BoxDecoration(
//         color: colors.surfaceVariant.withOpacity(0.2),
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Image + Heart Icon
//           Expanded(
//             flex: 3,
//             child: Stack(
//               children: [
//                 CustomNetworkImage(
//                   imageUrl: item.image,
//                   width: double.infinity,
//                   height: double.infinity,
//                   borderRadius: 15,
//                   fit: BoxFit.cover,
//                 ),
//                 Positioned(
//                   top: 8,
//                   right: 8,
//                   child: GestureDetector(
//                     onTap: () => controller.toggleFavorite(item),
//                     child: Container(
//                       padding: const EdgeInsets.all(5),
//                       decoration: BoxDecoration(
//                         color: Colors.black.withOpacity(0.2),
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(
//                         item.isFavorite ? Icons.favorite : Icons.favorite_border,
//                         color: item.isFavorite ? Colors.red : Colors.white,
//                         size: 18,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           // Details + Plus Button
//           Expanded(
//             flex: 1,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Flexible(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         AppText(
//                           item.name,
//                           fontWeight: AppFonts.semiBold,
//                           fontSize: 13,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         AppText(
//                           "\$${item.price}",
//                           color: colors.primary,
//                           fontWeight: AppFonts.bold,
//                           fontSize: 14,
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     padding: const EdgeInsets.all(2),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFFF7043),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: const Icon(Icons.add, color: Colors.white, size: 18),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../controller/k_mall_controller.dart';
import '../data/product_model.dart';
import '../product_detils_screen.dart';

class MallProductCard extends StatelessWidget {
  final ProductModel item;
  final KMallController controller;
  final double width;

  const MallProductCard({
    super.key,
    required this.item,
    required this.controller,
    this.width = 160,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: item)),
      child: Container(
        width: width,
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: colors.surfaceVariant.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image + Heart Icon
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  CustomNetworkImage(
                    imageUrl: item.image,
                    width: double.infinity,
                    height: double.infinity,
                    borderRadius: 15,
                    fit: BoxFit.cover,
                  ),
                  // HEART ICON - WRAPPED WITH GETBUILDER FOR REACTIVE UI
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GetBuilder<KMallController>(
                      id: 'product_grid', // Controller ke update IDs se match karta hai
                      builder: (ctrl) {
                        return GestureDetector(
                          onTap: () => ctrl.toggleFavorite(item),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              item.isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: item.isFavorite ? Colors.red : Colors.white,
                              size: 18,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Details + Plus Button
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            item.name,
                            fontWeight: AppFonts.semiBold,
                            fontSize: 13,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          AppText(
                            "\$${item.price}",
                            color: const Color(0xFFFF7043),
                            fontWeight: AppFonts.bold,
                            fontSize: 14,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.addToCart(item);
                        Get.rawSnackbar(
                          messageText: Text(
                              'mall.addedToCart'.trParams({'productName': item.name}),
                              style: const TextStyle(color: Colors.white)),
                          backgroundColor: Colors.green,
                          snackPosition: SnackPosition.BOTTOM,
                          margin: const EdgeInsets.all(15),
                          borderRadius: 10,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF7043),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.add, color: Colors.white, size: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}