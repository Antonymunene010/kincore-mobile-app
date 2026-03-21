import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_network_image.dart';

class FeaturedRewardsScreen extends StatelessWidget {
  const FeaturedRewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    // API data yahan map hoga (Abhi ke liye Dummy Dynamic List hai)
    final List<Map<String, String>> dynamicRewards = [
      {
        "image": "https://images.unsplash.com/photo-1514228742587-6b1558fcca3d",
        "title": "Family Crest Mug",
        "price": "450 KCC"
      },
      {
        "image": "https://images.unsplash.com/photo-1589802778601-574f03a6a9b4",
        "title": "Premium Tree Print",
        "price": "800 KCC"
      },
      {
        "image": "https://images.unsplash.com/photo-1544413660-299165566b1d",
        "title": "Custom Photo Book",
        "price": "1200 KCC"
      },
      {
        "image": "https://images.unsplash.com/photo-1583394838336-acd977736f90",
        "title": "Vintage Headphone",
        "price": "1500 KCC"
      },
      {
        "image": "https://images.unsplash.com/photo-1606293926075-69a00dbfde81",
        "title": "Smart Watch",
        "price": "3000 KCC"
      },
      {
        "image": "https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f",
        "title": "Polaroid Camera",
        "price": "2500 KCC"
      },
    ];

    return Scaffold(
      backgroundColor: isDark ? Colors.black : colors.surface,
      appBar: AppBar(
        backgroundColor: isDark ? Colors.black : colors.surface,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: colors.onSurface, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText(
            'redeem.featuredRewards'.tr,
            fontSize: 20,
            fontWeight: AppFonts.semiBold,
            color: colors.onSurface
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(Get.width * 0.05),
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Ek row me 2 items
          crossAxisSpacing: 15, // Items ke beech ka horizontal gap
          mainAxisSpacing: 15, // Items ke beech ka vertical gap
          childAspectRatio: 0.8, // Image aur text ke hisab se card ki height adjust karega
        ),
        itemCount: dynamicRewards.length,
        itemBuilder: (context, index) {
          final item = dynamicRewards[index];
          return _buildFeaturedRewardCard(
            theme: theme,
            colors: colors,
            imageUrl: item["image"]!,
            title: item["title"]!,
            price: item["price"]!,
          );
        },
      ),
    );
  }

  // Same Card Widget jo humne horizontal list ke liye use kiya tha
  Widget _buildFeaturedRewardCard({
    required ThemeData theme,
    required ColorScheme colors,
    required String imageUrl,
    required String title,
    required String price,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.dividerColor.withOpacity(0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Area (Expanded taaki grid height ke hisab se stretch ho)
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: colors.surfaceContainerHighest.withOpacity(0.5),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                child: CustomNetworkImage(
                  imageUrl: imageUrl,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Lower Text Area
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText(
                  title,
                  fontSize: 13,
                  fontWeight: AppFonts.bold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                AppText(
                  price,
                  fontSize: 12,
                  fontWeight: AppFonts.bold,
                  color: AppColors.orangeColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}