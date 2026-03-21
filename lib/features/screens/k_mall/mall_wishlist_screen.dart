import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import 'controller/k_mall_controller.dart';
import 'widget/mall_product_card.dart';

class MallWishlistScreen extends StatelessWidget {
  const MallWishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<KMallController>();
    final colors = Theme.of(context).colorScheme;

    // For Responsiveness
    final double screenW = Get.width;
    final int crossAxisCount = screenW > 600 ? 3 : 2;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        title:
        AppText('mall.wishlistTitle'.tr, fontSize: 18, fontWeight: AppFonts.semiBold),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded,
              color: colors.onSurface, size: 20),
          onPressed: () => Get.back(),
        ),
        backgroundColor: colors.surface,
        elevation: 0,
        iconTheme: IconThemeData(color: colors.onSurface),
      ),
      body: GetBuilder<KMallController>(
        id: 'wishlist',
        builder: (controller) {
          if (controller.wishlistProducts.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 80, color: colors.outline),
                  const SizedBox(height: 10),
                  AppText('mall.noItemsWishlist'.tr, color: colors.outline),
                ],
              ),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(15),
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 0.72,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
            ),
            itemCount: controller.wishlistProducts.length,
            itemBuilder: (context, index) {
              final item = controller.wishlistProducts[index];
              return MallProductCard(item: item, controller: controller);
            },
          );
        },
      ),
    );
  }
}
