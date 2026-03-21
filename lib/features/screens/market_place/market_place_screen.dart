import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
import 'controller/market_place_contoller.dart';
import 'market_place_chat_history_screen.dart';
import 'market_place_details_screen.dart';

class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MarketplaceController());
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final sw = Get.width;

    // Responsive grid count
    final int crossAxisCount = sw > 1024 ? 4 : (sw > 600 ? 3 : 2);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: AppText('marketplace.title'.tr, fontSize: 20, fontWeight: AppFonts.bold, color: colors.onSurface),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: colors.onSurface, size: 20),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.chat_bubble_2, color: colors.onSurface),
            onPressed: () => Get.to(() => const MarketplaceChatHistoryScreen()),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator(color: Colors.orange));
        }

        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // [NEW]: Search Bar Widget
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: colors.surfaceVariant.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextField(
                    style: TextStyle(color: colors.onSurface),
                    onChanged: (value) => controller.searchProducts(value), // Search action
                    decoration: InputDecoration(
                      hintText: 'marketplace.searchHint'.tr,
                      hintStyle: TextStyle(color: colors.onSurfaceVariant),
                      prefixIcon: Icon(Icons.search, color: colors.onSurfaceVariant),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
              ),

              // 1. Client's Approved Orange-Yellow Gradient Banner
              Container(
                margin: const EdgeInsets.all(15),
                width: double.infinity,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF7043), Color(0xFFFFCA28)], // Orange to Yellow
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText('marketplace.bannerTitle'.tr, color: Colors.white, fontSize: 22, fontWeight: AppFonts.bold),
                    const SizedBox(height: 5),
                    AppText('marketplace.bannerSub'.tr, color: Colors.white, fontSize: 14),
                  ],
                ),
              ),

              // 2. Categories
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: controller.categories.length,
                  itemBuilder: (context, index) {
                    final cat = controller.categories[index];
                    final isSelected = controller.selectedCategory.value == cat;
                    return GestureDetector(
                      onTap: () => controller.changeCategory(cat),
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFFFF7043) : colors.surfaceVariant.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        // Added .tr here so dynamic categories from controller get translated
                        child: AppText(cat.tr, color: isSelected ? Colors.white : colors.onSurface, fontWeight: AppFonts.bold),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

              // 3. Product Grid (With Empty State Check)
              controller.products.isEmpty
                  ? Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                  child: AppText('marketplace.noProducts'.tr, color: colors.outline, fontSize: 16),
                ),
              )
                  : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.75, // Adjust for image + text
                  ),
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    final product = controller.products[index];
                    return GestureDetector(
                      onTap: () => Get.to(() => MarketplaceDetailScreen(product: product)),
                      child: Container(
                        decoration: BoxDecoration(
                          color: colors.surface,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            if (!isDark) BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                                child: Image.network(product['image'], fit: BoxFit.cover, width: double.infinity),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Product price, title, and location coming from API, no .tr needed here
                                  AppText("\$${product['price']}", fontSize: 16, fontWeight: AppFonts.bold),
                                  const SizedBox(height: 4),
                                  AppText(product['title'], fontSize: 14, color: colors.onSurface, maxLines: 1),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on, size: 12, color: colors.outline),
                                      const SizedBox(width: 4),
                                      Expanded(child: AppText(product['location'], fontSize: 11, color: colors.outline, maxLines: 1)),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        );
      }),
    );
  }
}