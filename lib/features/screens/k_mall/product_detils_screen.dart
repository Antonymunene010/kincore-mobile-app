import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/features/screens/k_mall/second_mall_screen.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_network_image.dart';
import '../seller_dashboard/product_chat_screen.dart';
import 'controller/k_mall_controller.dart';
import 'controller/product_detail_controller.dart';
import 'data/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final detailController = Get.put(ProductDetailController(), tag: product.id.toString());
    final mallController = Get.find<KMallController>(); // Global controller for wishlist/cart sync

    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final double sw = Get.width;
    final double maxWidth = sw < 600 ? sw : (sw < 1024 ? 600.0 : 850.0);

    return Scaffold(
      backgroundColor: colors.surface,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeroHeader(colors, mallController),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15),
                          _buildTitlePrice(colors),
                          _buildRatingRow(),
                          const SizedBox(height: 15),
                          _buildTags(),
                          const SizedBox(height: 20),
                          _buildFamilyMemberCard(colors),
                          const SizedBox(height: 25),
                          AppText('mall.description'.tr, fontSize: 18, fontWeight: AppFonts.bold),
                          const SizedBox(height: 10),
                          AppText(
                            product.description.isEmpty
                                ? "Experience premium quality with ${product.name}. Designed for comfort and durability." // This can be localized if needed
                                : product.description,
                            fontSize: 14, color: colors.onSurface.withOpacity(0.7),
                          ),
                          const SizedBox(height: 15),

                          if (detailController.shouldShowSize(product.category)) ...[
                            AppText('mall.selectSize'.tr, fontSize: 18, fontWeight: AppFonts.bold),
                            const SizedBox(height: 12),
                            _buildSizeSelector(detailController, colors),
                          ],

                          const SizedBox(height: 15),
                          _buildSimilarProducts(detailController, colors),
                          const SizedBox(height: 140),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          _buildBottomAction(mallController, maxWidth),
        ],
      ),
    );
  }

  Widget _buildHeroHeader(ColorScheme colors, KMallController mallController) {
    return Stack(
      children: [
        CustomNetworkImage(imageUrl: product.image, height: 420, width: double.infinity, fit: BoxFit.cover),
        Positioned(
          top: 50, left: 15, right: 15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _circleBtn(Icons.arrow_back_ios_new, () => Get.back(), colors),
              AppText('mall.title'.tr, fontSize: 20, fontWeight: AppFonts.bold, color: Colors.white),
              _circleBtn(Icons.notifications_none, () {}, colors),
            ],
          ),
        ),
        Positioned(
          bottom: 20, right: 20,
          child: GetBuilder<KMallController>(
            id: 'wishlist',
            builder: (controller) {
              bool isFav = controller.wishlistProducts.any((p) => p.id == product.id);
              return _circleBtn(
                isFav ? Icons.favorite : Icons.favorite_border,
                    () => controller.toggleFavorite(product),
                colors,
                isFav: isFav,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _circleBtn(IconData icon, VoidCallback onTap, ColorScheme colors, {bool isFav = false}) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.white.withOpacity(0.9),
        child: Icon(icon, size: 20, color: isFav ? Colors.red : Colors.black),
      ),
    );
  }

  Widget _buildTitlePrice(ColorScheme colors) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: AppText(product.name, fontSize: 24, fontWeight: AppFonts.bold, maxLines: 2)),
        AppText("\$${product.price}", fontSize: 22, fontWeight: AppFonts.bold, color: AppColors.orangeColor),
      ],
    );
  }

  Widget _buildRatingRow() {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 20),
        const SizedBox(width: 5),
        AppText('mall.productReview'.trParams({'rating': product.rating.toString(), 'count': product.reviews.toString()}), fontSize: 14, color: Colors.grey),
      ],
    );
  }

  Widget _buildTags() {
    return Row(
      children: [
        _tag('mall.tag.homeMade'.tr),
        const SizedBox(width: 10),
        _tag('mall.tag.newCollection'.tr),
      ],
    );
  }

  Widget _tag(String txt) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(color: const Color(0xFFFFEBE6), borderRadius: BorderRadius.circular(20)),
      child: AppText(txt, color: Colors.orange, fontSize: 12, fontWeight: AppFonts.medium),
    );
  }

  Widget _buildFamilyMemberCard(ColorScheme colors) {
    final bool isDark = Get.isDarkMode;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark ? colors.surfaceVariant.withOpacity(0.3) : const Color(0xFFFFEBE6).withOpacity(0.5),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: isDark ? colors.outlineVariant.withOpacity(0.4) : const Color(0xFFFFD7CC)),
      ),
      child: Row(
        children: [
          const CircleAvatar(radius: 25, backgroundImage: NetworkImage("https://i.pravatar.cc/150?u=4")),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              AppText("Arthur Harrison", fontSize: 16, fontWeight: AppFonts.bold, color: colors.onSurface),
              AppText('familyBio.existingMember'.tr, fontSize: 12, color: colors.onSurfaceVariant.withOpacity(0.8)),
            ]),
          ),
          IconButton(
            // [UPDATED]: Yahan se current product ka data Chat screen me bheja ja raha hai
            onPressed: () => Get.to(() => ProductChatScreen(
              productName: product.name,
              productPrice: product.price.toString(),
              productImage: product.image,
            )),
            icon: const Icon(CupertinoIcons.chat_bubble_text, color: AppColors.orangeColor),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }

  Widget _buildSizeSelector(ProductDetailController controller, ColorScheme colors) {
    return Obx(() => Row(
      children: product.sizes.map((s) {
        bool sel = controller.selectedSize.value == s;
        return GestureDetector(
          onTap: () => controller.selectSize(s),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: 45, height: 45, margin: const EdgeInsets.only(right: 12),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: sel ? AppColors.orangeColor : Colors.transparent,
              border: Border.all(color: sel ? AppColors.orangeColor : colors.outlineVariant.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: AppText(s, fontWeight: AppFonts.medium, color: sel ? Colors.white : colors.onSurface),
          ),
        );
      }).toList(),
    ));
  }

  Widget _buildSimilarProducts(ProductDetailController controller, ColorScheme colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          AppText('mall.relatedProducts'.tr, fontSize: 16, fontWeight: AppFonts.bold),
          TextButton(
            onPressed: () => Get.to(() => const SecondMallScreen()),
            child: AppText('common.seeAll'.tr, color: AppColors.orangeColor, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ]),
        const SizedBox(height: 10),
        SizedBox(
          height: 190,
          child: Obx(() => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.similarProducts.length,
            itemBuilder: (context, i) {
              final p = controller.similarProducts[i];
              return GestureDetector(
                onTap: () => Get.off(() => ProductDetailScreen(product: p), preventDuplicates: false),
                child: Container(
                  width: 130, margin: const EdgeInsets.only(right: 15),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Expanded(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CustomNetworkImage(imageUrl: p.image, fit: BoxFit.cover, width: double.infinity)
                      ),
                    ),
                    const SizedBox(height: 8),
                    AppText(p.name, fontSize: 13, fontWeight: AppFonts.semiBold, maxLines: 1),
                    AppText("\$${p.price}", color: AppColors.orangeColor, fontSize: 14, fontWeight: AppFonts.bold),
                  ]),
                ),
              );
            },
          )),
        ),
      ],
    );
  }

  Widget _buildBottomAction(KMallController mallController, double width) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: width, height: 70,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(40)),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                AppText('checkout.total'.tr, color: Colors.grey, fontSize: 11),
                AppText("\$${product.price}", color: Colors.white, fontSize: 18, fontWeight: AppFonts.bold),
              ]),
            ),
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () => mallController.addToCart(product),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(color: AppColors.orangeColor, borderRadius: BorderRadius.circular(30)),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_bag, color: Colors.white, size: 20),
                      SizedBox(width: 8),
                      AppText('mall.addToCart'.tr, color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
