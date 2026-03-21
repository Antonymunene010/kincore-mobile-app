import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/features/screens/k_mall/mall_cart_screen.dart';
import 'package:kincore_app/features/screens/k_mall/order_history_screen.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import 'controller/k_mall_controller.dart';
import 'mall_wishlist_screen.dart';
import 'widget/mall_product_card.dart';
import 'widget/mall_search.dart';
import 'widget/mall_category_icons.dart';
import 'widget/mall_filter_chips.dart';

class SecondMallScreen extends StatelessWidget {
  const SecondMallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<KMallController>();
    final colors = Theme.of(context).colorScheme;

    final double sw = Get.width;
    final bool isMobile = sw < 600;
    final bool isTablet = sw >= 600 && sw < 1024;
    final bool isDesktop = sw >= 1024;

    final double maxContentWidth = isDesktop ? 1200 : (isTablet ? 800 : sw);
    final int columns = isDesktop ? 5 : (isTablet ? 3 : 2);

    const double horizontalPadding = 15.0;
    const double spacing = 15.0;

    final double cardWidth = (maxContentWidth - (horizontalPadding * 2) - (spacing * (columns - 1))) / columns;
    final double desiredHeight = isDesktop ? 280 : 265;
    final double finalAspectRatio = cardWidth / desiredHeight;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        backgroundColor: colors.surface,
        elevation: 0,
        centerTitle: !isMobile,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: colors.onSurface, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText('nav.mall'.tr, fontSize: 20, fontWeight: AppFonts.semiBold),
        actions: [
          IconButton(onPressed: () => Get.to(OrderHistoryScreen()), icon: Icon(Icons.history, color: colors.primary)),
          IconButton(
            onPressed: () => Get.to(() => const MallWishlistScreen()),
            icon: Icon(Icons.favorite_outline, color: colors.primary),
          ),
          IconButton(onPressed: () => Get.to(const MallCartScreen()), icon: Icon(Icons.shopping_cart_outlined, color: colors.primary)),
          if (!isMobile) SizedBox(width: (sw - maxContentWidth) / 2 + 10),
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: maxContentWidth,
          child: Column(
            children: [
              const MallSearchBar(),
              MallCategoryIcons(colors: colors, controller: controller),
              const SizedBox(height: 10),
              MallFilterChips(colors: colors, controller: controller),
              const SizedBox(height: 10),

              Expanded(
                child: GetBuilder<KMallController>(
                  id: 'product_grid',
                  builder: (controller) {
                    return GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 15),
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columns,
                        childAspectRatio: finalAspectRatio,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: spacing,
                      ),
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (context, index) {
                        return MallProductCard(
                          item: controller.featuredProducts[index],
                          controller: controller,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}