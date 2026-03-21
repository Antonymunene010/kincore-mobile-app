import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_network_image.dart';
import 'check_out_screen.dart';
import 'controller/k_mall_controller.dart';
import 'product_detils_screen.dart';

class MallCartScreen extends StatelessWidget {
  const MallCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<KMallController>();
    final colors = Theme.of(context).colorScheme;
    final double sw = Get.width;
    final double maxWidth = sw < 600 ? sw : 700.0;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        title: AppText("cart.title".tr, fontSize: 20, fontWeight: AppFonts.bold),
        backgroundColor: colors.surface,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Get.back(),
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Column(
            children: [
              Expanded(
                child: GetBuilder<KMallController>(
                  id: 'cart_screen',
                  builder: (ctrl) {
                    if (ctrl.cartList.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_bag_outlined,
                                size: 80, color: colors.primary.withOpacity(0.2)),
                            const SizedBox(height: 10),
                            AppText("cart.empty".tr, fontSize: 16),
                          ],
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: ctrl.cartList.length,
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      itemBuilder: (context, index) {
                        final item = ctrl.cartList[index];
                        return GestureDetector(
                          onTap: () => Get.to(() => ProductDetailScreen(product: item)),
                          child: _buildCartItem(item, ctrl, colors),
                        );
                      },
                    );
                  },
                ),
              ),
              _buildKincoreBottomBar(controller, colors),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCartItem(item, ctrl, ColorScheme colors) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colors.surfaceVariant.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomNetworkImage(imageUrl: item.image, width: 90, height: 90, borderRadius: 12),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(item.name, fontSize: 16, fontWeight: AppFonts.semiBold),
                    const SizedBox(height: 5),
                    AppText("mall.selectSize".tr + ": 38", fontSize: 13, color: Colors.grey),
                    const SizedBox(height: 10),
                    AppText("\$${item.price}",
                        fontSize: 18, fontWeight: AppFonts.bold, color: AppColors.orangeColor),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                onPressed: () => ctrl.removeFromCart(item.id),
                icon: const Icon(Icons.delete_outline, color: Colors.redAccent, size: 20),
                label: AppText("cart.remove".tr, color: Colors.redAccent, fontSize: 13),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => ctrl.setCheckoutProduct(item),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                child: AppText("cart.buyNow".tr, color: Colors.white, fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildKincoreBottomBar(KMallController ctrl, ColorScheme colors) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5))
        ],
      ),
      child: SafeArea(
        child: GetBuilder<KMallController>(
          id: 'cart_screen',
          builder: (ctrl) {
            return Container(
              height: 65,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(35),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText("checkout.total".tr.toUpperCase(), color: Colors.white70, fontSize: 12),
                          AppText("\$${ctrl.totalCartPrice}",
                              color: Colors.white, fontSize: 20, fontWeight: AppFonts.bold),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if(ctrl.cartList.isNotEmpty) {
                        Get.snackbar("checkout.proceedingSnackbar".tr, "Redirecting to payment...",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: const Color(0xFFFF7043),
                            colorText: Colors.white);
                      } else {
                        Get.snackbar("cart.empty".tr, "checkout.emptyCartSnackbar".tr);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF7043),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          const Icon(Icons.shopping_bag, color: Colors.white, size: 20),
                          const SizedBox(width: 8),
                          AppText("checkout.title".tr, color: Colors.white, fontWeight: AppFonts.bold),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
