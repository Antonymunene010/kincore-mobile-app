import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_network_image.dart';
import 'add_product_screen.dart';
// import 'product_chat_screen.dart';

class MyListingsScreen extends StatelessWidget {
  const MyListingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    // Dummy Data for Seller Statistics
    final List<Map<String, dynamic>> myProducts = [
      {
        'name': 'Nike Air Max 2026',
        'price': '120.00',
        'image': 'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
        'status': 'myListings.active'.tr, // Dynamic Status
        'views': 342,
        'messages': 5,
        'date': '2 Oct 2026'
      },
      {
        'name': 'Vintage Wooden Chair',
        'price': '45.00',
        'image': 'https://images.unsplash.com/photo-1592078615290-033ee584e267',
        'status': 'myListings.sold'.tr, // Dynamic Status
        'views': 890,
        'messages': 12,
        'date': '15 Sep 2026'
      }
    ];

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: colors.onSurface, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText('myListings.title'.tr, fontSize: 18, fontWeight: AppFonts.semiBold, color: colors.onSurface),
        actions: [
          IconButton(onPressed: () {Get.to(const AddProductScreen());}, icon: Icon(Icons.add, color: colors.onSurface)),
        ],
        centerTitle: true,
      ),
      body: Center(
        child: ConstrainedBox(
          // [RESPONSIVE]: Web par UI center mein rahega
          constraints: const BoxConstraints(maxWidth: 800),
          child: myProducts.isEmpty
              ? Center(child: AppText('myListings.empty'.tr, color: colors.outline))
              : ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: myProducts.length,
            itemBuilder: (context, index) {
              final product = myProducts[index];
              // Example logic checking translated 'Active' string
              final isActive = product['status'] == 'myListings.active'.tr;

              return Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: colors.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: colors.outlineVariant.withOpacity(0.3)),
                  boxShadow: [
                    if (!isDark) // [THEME]: Shadow sirf light mode me
                      BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))
                  ],
                ),
                child: Column(
                  children: [
                    // Product Info Row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomNetworkImage(imageUrl: product['image'], width: 80, height: 80, borderRadius: 12),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(product['name'], fontSize: 16, fontWeight: AppFonts.bold, color: colors.onSurface),
                              const SizedBox(height: 4),
                              AppText("\$${product['price']}", fontSize: 15, fontWeight: AppFonts.semiBold, color: AppColors.orangeColor),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: isActive ? Colors.green.withOpacity(0.1) : Colors.grey.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: AppText(
                                  product['status'],
                                  fontSize: 11,
                                  fontWeight: AppFonts.bold,
                                  color: isActive ? Colors.green : Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Divider(color: colors.outlineVariant.withOpacity(0.4)),
                    ),
                    // Statistics Row
                    // Statistics Row (FIXED: Row ki jagah Wrap use kiya)
                    Wrap(
                      alignment: WrapAlignment.spaceBetween, // Items ke beech me space
                      spacing: 15, // Horizontal space
                      runSpacing: 10, // Agar next line me aaye to vertical space
                      children: [
                        _buildStatItem(Icons.visibility_outlined, "${product['views']} ${'myListings.views'.tr}", colors),
                        _buildStatItem(Icons.chat_bubble_outline, "${product['messages']} ${'myListings.chats'.tr}", colors),
                        _buildStatItem(Icons.calendar_today_outlined, product['date'], colors),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      // Add New Product FAB
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () => Get.to(() => const AddProductScreen()),
      //   backgroundColor: AppColors.orangeColor,
      //   icon: const Icon(Icons.add, color: Colors.white),
      //   label: AppText('myListings.addProduct'.tr, color: Colors.white, fontWeight: AppFonts.bold),
      // ),
    );
  }

  Widget _buildStatItem(IconData icon, String text, ColorScheme colors) {
    return Row(
      children: [
        Icon(icon, size: 16, color: colors.outline),
        const SizedBox(width: 6),
        AppText(text, fontSize: 12, color: colors.onSurfaceVariant),
      ],
    );
  }
}