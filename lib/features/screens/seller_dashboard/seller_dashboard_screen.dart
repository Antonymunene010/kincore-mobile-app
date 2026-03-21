import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/features/screens/seller_dashboard/add_product_screen.dart';
import 'package:kincore_app/features/screens/seller_dashboard/my_listing_screen.dart';
import 'package:kincore_app/features/screens/seller_dashboard/product_chat_screen.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_network_image.dart';
import 'controller/dashboard_controller.dart';
import 'widget/dashboard_stat_card.dart';

class SellerDashboardScreen extends StatelessWidget {
  const SellerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.delete<SellerDashboardController>();
    final controller = Get.put(SellerDashboardController());

    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final screenW = Get.width;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor, // Theme based BG
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: colors.onSurface, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText("seller.title".tr, fontSize: 20, fontWeight: AppFonts.semiBold, color: colors.onSurface),
        actions: [
          IconButton(onPressed: () {Get.to(const AddProductScreen());}, icon: Icon(Icons.add, color: colors.onSurface)),
          const SizedBox(width: 10),
        ],
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final data = controller.dashboardData.value;
        if (data == null) return Center(child: AppText("seller.noData".tr));

        return SingleChildScrollView(
          padding: EdgeInsets.all(screenW * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText("seller.overview".tr, fontSize: 18, fontWeight: AppFonts.semiBold),
              const SizedBox(height: 15),

              Row(
                children: [
                  Expanded(child: StatCard(title: "seller.totalRevenue".tr, value: data.totalRevenue, percent: data.revenueChange, isPositive: true)),
                  const SizedBox(width: 15),
                  Expanded(child: StatCard(title: "seller.orders".tr, value: data.orders, percent: data.ordersChange, isPositive: false)),
                ],
              ),
              const SizedBox(height: 15),
              StatCard(title: "seller.avgOrderValue".tr, value: data.avgOrderValue, percent: data.avgChange, isPositive: true, isFullWidth: true),

              const SizedBox(height: 25),
              AppText("seller.products".tr, fontSize: 18, fontWeight: AppFonts.semiBold),
              const SizedBox(height: 15),

              // Products List section inside SellerDashboardScreen
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.products.length,
                  itemBuilder: (context, index) {
                    final product = data.products[index];
                    return Container(
                      width: 160,
                      margin: const EdgeInsets.only(right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Agar CustomNetworkImage mein error aa rahi hai,
                          // toh temporary Image.network use karke check karo
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              product.imageUrl,
                              height: 160,
                              width: 160,
                              fit: BoxFit.cover, // Image ko poore box mein fill karega
                              errorBuilder: (context, error, stackTrace) => Container(
                                height: 160,
                                width: 160,
                                color: Colors.grey[300],
                                child: const Icon(Icons.broken_image),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          AppText(product.name, fontSize: 15, fontWeight: AppFonts.medium),
                          AppText(product.price, fontSize: 13, color: colors.onSurface.withOpacity(0.6)),
                        ],
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 25),
              AppText("seller.orders".tr, fontSize: 18, fontWeight: AppFonts.semiBold),
              const SizedBox(height: 10),

              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.recentOrders.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final order = data.recentOrders[index];
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: theme.dividerColor.withOpacity(0.1)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(order.userName, fontSize: 15, fontWeight: AppFonts.medium),
                            AppText("${'seller.orderId'.tr} ${order.orderId}", fontSize: 12, color: colors.onSurface.withOpacity(0.5)),
                          ],
                        ),
                        AppText(order.amount, fontSize: 16, fontWeight: AppFonts.bold),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
