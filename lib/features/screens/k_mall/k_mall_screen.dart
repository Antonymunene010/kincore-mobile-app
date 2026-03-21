import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/features/screens/find_family_member/find_your_self.dart';
import 'package:kincore_app/features/screens/k_mall/mall_cart_screen.dart';
import 'package:kincore_app/features/screens/k_mall/second_mall_screen.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import 'controller/k_mall_controller.dart';
import 'mall_wishlist_screen.dart';
import 'order_history_screen.dart';
import 'widget/mall_search.dart';
import 'widget/poster_slider.dart';
import 'widget/product_section.dart';

class KMallScreen extends StatelessWidget {
  const KMallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(KMallController());
    final colors = Theme.of(context).colorScheme;

    final double sw = Get.width;
    final bool isMobile = sw < 600;
    final bool isTablet = sw >= 600 && sw < 1024;
    final bool isDesktop = sw >= 1024;

    final double maxContentWidth = isDesktop ? 1100 : (isTablet ? 800 : sw);

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        backgroundColor: colors.surface,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 0,
        title: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxContentWidth),
          child: AppText(
            'mall.title'.tr,
            fontSize: 22,
            fontWeight: AppFonts.semiBold,
            color: colors.onSurface,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.to(const OrderHistoryScreen()),
            icon: Icon(Icons.history, color: colors.primary),
          ),
          IconButton(
            onPressed: () => Get.to(() => const MallWishlistScreen()),
            icon: Icon(Icons.favorite_outline, color: colors.primary),
          ),
          IconButton(
            onPressed: () => Get.to(const MallCartScreen()),
            icon: Icon(Icons.shopping_cart_outlined, color: colors.primary),
          ),
        ],
      ),
      body: GetBuilder<KMallController>(
        id: 'loading',
        builder: (controller) {
          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator(color: colors.primary));
          }

          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: maxContentWidth,
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 0 : 20),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const MallSearchBar(),
                    const SizedBox(height: 15),

                    // [FIXED]: Yahan se ConstrainedBox hata diya hai!
                    // Ab height directly MallPosterSlider handle karega.
                    const MallPosterSlider(),

                    const SizedBox(height: 20),
                    GetBuilder<KMallController>(
                      id: 'featured_section',
                      builder: (ctrl) => ProductSection(
                        title: 'mall.featured'.tr,
                        items: ctrl.featuredProducts,
                        controller: ctrl,
                        onSeeAll: () => Get.to(() => const SecondMallScreen()),
                      ),
                    ),
                    const SizedBox(height: 10),
                    GetBuilder<KMallController>(
                      id: 'popular_section',
                      builder: (ctrl) => ProductSection(
                        title: 'mall.mostPopular'.tr,
                        items: ctrl.popularProducts,
                        controller: ctrl,
                        onSeeAll: () {},
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}