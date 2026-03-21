// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kincore_app/core/utils/app_colors.dart';
// import 'package:kincore_app/core/widgets/custom_button.dart';
// import 'package:kincore_app/features/screens/k_mall/second_mall_screen.dart';
// import '../../../../core/utils/app_fonts.dart';
// import '../../../core/widgets/app_text.dart';
// import '../../../core/widgets/custom_network_image.dart';
// import 'controller/k_mall_controller.dart';
//
// class OrderHistoryScreen extends StatelessWidget {
//   const OrderHistoryScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<KMallController>();
//     final colors = Theme.of(context).colorScheme;
//     final isDark = Get.isDarkMode;
//
//     return Scaffold(
//       backgroundColor: isDark ? colors.surface : const Color(0xFFF5F5F5),
//       appBar: AppBar(
//         title: AppText(
//           "orderHistory.title".tr,
//           fontWeight: AppFonts.semiBold,
//           fontSize: 20,
//         ),
//         backgroundColor: colors.surface,
//         elevation: 0,
//         centerTitle: false,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios_new, size: 20),
//           onPressed: () => Get.off(const SecondMallScreen()),
//         ),
//       ),
//       body: Column(
//         children: [
//           // Search Bar
//           Padding(
//             padding: const EdgeInsets.all(15),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: "orderHistory.searchHint".tr,
//                 prefixIcon: const Icon(Icons.search),
//                 filled: true,
//                 fillColor: colors.surface,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30),
//                   borderSide: BorderSide.none,
//                 ),
//               ),
//             ),
//           ),
//
//           Expanded(
//             child: Obx(
//                   () => ListView.builder(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 itemCount: controller.orderHistory.length,
//                 itemBuilder: (context, index) {
//                   final order = controller.orderHistory[index];
//                   final product = order['product'];
//
//                   return Container(
//                     margin: const EdgeInsets.only(bottom: 15),
//                     padding: const EdgeInsets.all(15),
//                     decoration: BoxDecoration(
//                       color: colors.surface,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             _statusBadge(order['status'].toString().tr),
//                             AppText(
//                               order['date'],
//                               color: Colors.grey,
//                               fontSize: 13,
//                             ),
//                             AppText(
//                               "#${order['id']}",
//                               fontWeight: FontWeight.bold,
//                               fontSize: 13,
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 15),
//                         Row(
//                           children: [
//                             CustomNetworkImage(
//                               imageUrl: product.image,
//                               width: 80,
//                               height: 80,
//                               borderRadius: 12,
//                             ),
//                             const SizedBox(width: 15),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   AppText(
//                                     product.name,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                   const SizedBox(height: 5),
//                                   AppText(
//                                     "orderHistory.netQty".tr,
//                                     color: Colors.grey,
//                                     fontSize: 13,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             AppText(
//                               "\$${order['total']}",
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ],
//                         ),
//                         const Divider(height: 30),
//                         CustomButton(
//                           text: 'orderHistory.trackOrder'.tr,
//                           onPressed: () {},
//                           textColor: AppColors.whiteColor,
//                           backgroundColor: AppColors.orangeColor,
//                           width: double.infinity,
//                           height: 45,
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _statusBadge(String status) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//       decoration: BoxDecoration(
//         color: Colors.blue.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: AppText(
//         status,
//         color: Colors.blue,
//         fontSize: 11,
//         fontWeight: FontWeight.bold,
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import 'package:kincore_app/features/screens/k_mall/second_mall_screen.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_network_image.dart';
import 'controller/k_mall_controller.dart';
// Nayi screens import karein (path apne project ke hisaab se adjust kar lena)
import 'invoice_screen.dart';
import 'track_order_screen.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<KMallController>();
    final colors = Theme.of(context).colorScheme;
    final isDark = Get.isDarkMode;

    return Scaffold(
      backgroundColor: isDark ? colors.surface : const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: AppText(
          "orderHistory.title".tr,
          fontWeight: AppFonts.semiBold,
          fontSize: 20,
        ),
        backgroundColor: colors.surface,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Get.off(const SecondMallScreen()),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800), // Responsive Max Width
          child: Column(
            children: [
              // Search Bar
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "orderHistory.searchHint".tr,
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: colors.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Obx(
                      () => ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    itemCount: controller.orderHistory.length,
                    itemBuilder: (context, index) {
                      final order = controller.orderHistory[index];
                      final product = order['product'];

                      final bool isDelivered = order['status'].toString().toLowerCase() == 'delivered';
                      final String orderId = order['id'].toString();

                      return Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: colors.surface,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _statusBadge(order['status'].toString().tr),
                                AppText(
                                  order['date'],
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                                AppText(
                                  "#$orderId",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                CustomNetworkImage(
                                  imageUrl: product.image,
                                  width: 80,
                                  height: 80,
                                  borderRadius: 12,
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        product.name,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      const SizedBox(height: 5),
                                      AppText(
                                        "orderHistory.netQty".tr,
                                        color: Colors.grey,
                                        fontSize: 13,
                                      ),
                                    ],
                                  ),
                                ),
                                AppText(
                                  "\$${order['total']}",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            const Divider(height: 25),

                            // Buttons Row
                            Row(
                              children: [
                                // Left Button: Invoice or View Details
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () {
                                      // Dono cases me currently Invoice / Details screen pe bhej rahe hain
                                      Get.to(() => InvoiceScreen(orderId: orderId, orderData: order));
                                    },
                                    style: OutlinedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(vertical: 12),
                                      side: const BorderSide(color: AppColors.orangeColor),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                    ),
                                    child: AppText(
                                      isDelivered ? 'View Details' : 'Invoice',
                                      color: AppColors.orangeColor,
                                      fontSize: 13,
                                      fontWeight: AppFonts.semiBold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15),

                                // Right Button: Buy Again or Track Order
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (isDelivered) {
                                        Get.snackbar("Buy Again", "Added to cart successfully!");
                                      } else {
                                        Get.to(() => TrackOrderScreen(orderId: orderId, orderData: order));
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.orangeColor,
                                      padding: const EdgeInsets.symmetric(vertical: 12),
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                    ),
                                    child: AppText(
                                      isDelivered ? 'Buy Again' : 'Track Order',
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: AppFonts.semiBold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statusBadge(String status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: status.toLowerCase() == 'delivered'
            ? Colors.green.withOpacity(0.1)
            : Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: AppText(
        status,
        color: status.toLowerCase() == 'delivered' ? Colors.green : Colors.blue,
        fontSize: 11,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}