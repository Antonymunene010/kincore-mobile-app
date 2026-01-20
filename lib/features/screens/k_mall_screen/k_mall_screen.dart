import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/app_text.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../core/models/product_model.dart';
import 'controller/k_mall_controller.dart';

class KMallScreen extends StatelessWidget {
  const KMallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(KMallController());
    final double screenW = Get.width;
    final double screenH = Get.height;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        title: AppText("K-mall", fontSize: 20, fontWeight: AppFonts.semiBold),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite, color: AppColors.orangeColor)),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart, color: AppColors.orangeColor)),
          const SizedBox(width: 10),
        ],
      ),
      body: Obx(() => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Column(
          children: [
            _buildSearchBar(screenW),

            // Slider with Dots
            _buildPosterSlider(controller, screenW, screenH),

            // Section 1: Featured (Electronics)
            _buildSection("Featured", controller.featuredProducts, screenW, controller),

            // Section 2: Most Popular (Clothing/Shoes)
            _buildSection("Most Popular", controller.popularProducts, screenW, controller),

            const SizedBox(height: 20),
          ],
        ),
      )),
    );
  }

  Widget _buildSearchBar(double screenW) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenW * 0.05, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: const TextField(
          decoration: InputDecoration(
            hintText: "Find Products",
            prefixIcon: Icon(Icons.search, color: AppColors.blackColor),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ),
    );
  }

  Widget _buildPosterSlider(KMallController controller, double screenW, double screenH) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: screenH * 0.20,
            viewportFraction: 0.92,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) => controller.currentBannerIndex.value = index,
          ),
          items: controller.posters.map((poster) {
            return Container(
              width: screenW,
              decoration: BoxDecoration(
                color: AppColors.orangeColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(poster.title, color: Colors.white, fontSize: 16),
                        AppText(poster.discount, color: Colors.white, fontSize: 28, fontWeight: AppFonts.bold),
                        AppText("For Children", color: Colors.white, fontSize: 14),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: controller.posters.asMap().entries.map((entry) {
            return Container(
              width: controller.currentBannerIndex.value == entry.key ? 12 : 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: controller.currentBannerIndex.value == entry.key
                    ? AppColors.orangeColor
                    : Colors.grey.shade300,
              ),
            );
          }).toList(),
        )),
      ],
    );
  }

  Widget _buildSection(String title, List<ProductModel> items, double screenW, KMallController controller) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenW * 0.05, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(title, fontSize: 18, fontWeight: AppFonts.bold),
              AppText("See All", color: AppColors.orangeColor, fontSize: 14),
            ],
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: screenW * 0.05),
            itemCount: items.length,
            itemBuilder: (context, index) => _buildProductCard(items[index], controller),
          ),
        ),
      ],
    );
  }

  Widget _buildProductCard(ProductModel item, KMallController controller) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CustomNetworkImage(
                imageUrl: item.image,
                height: 140,
                width: 150,
                borderRadius: 15,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () => controller.toggleFavorite(item),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        shape: BoxShape.circle
                    ),
                    child: Icon(
                      item.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: item.isFavorite ? Colors.red : Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(item.name, fontSize: 14, fontWeight: AppFonts.semiBold, maxLines: 1),
                const SizedBox(height: 2),
                AppText("\$${item.price}", fontSize: 14, color: AppColors.orangeColor, fontWeight: AppFonts.bold),
              ],
            ),
          ),
        ],
      ),
    );
  }
}