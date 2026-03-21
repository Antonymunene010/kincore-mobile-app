import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
import 'market_place_chat_screen.dart';
import 'controller/market_place_contoller.dart'; // [NEW]: Controller import kiya

class MarketplaceDetailScreen extends StatelessWidget {
  final Map<String, dynamic> product;
  const MarketplaceDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    // [NEW]: Controller ko yahan find kiya
    final controller = Get.find<MarketplaceController>();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: colors.onSurface, size: 20),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(icon: Icon(Icons.share, color: colors.onSurface), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product['image'], width: double.infinity, height: 300, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(product['title'], fontSize: 22, fontWeight: AppFonts.bold),
                  const SizedBox(height: 10),
                  AppText("\$${product['price']}", fontSize: 24, fontWeight: AppFonts.bold, color: const Color(0xFFFF7043)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: colors.outline, size: 16),
                      const SizedBox(width: 5),
                      AppText(product['location'], color: colors.outline, fontSize: 14),
                    ],
                  ),
                  const Divider(height: 40),
                  AppText("Seller Information", fontSize: 18, fontWeight: AppFonts.bold),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      CircleAvatar(radius: 25, backgroundImage: NetworkImage("https://i.pravatar.cc/150?u=${product['sellerName']}")),
                      const SizedBox(width: 15),
                      AppText(product['sellerName'], fontSize: 16, fontWeight: AppFonts.bold),
                    ],
                  ),
                  const Divider(height: 40),
                  AppText("Description", fontSize: 18, fontWeight: AppFonts.bold),
                  const SizedBox(height: 10),
                  AppText(product['description'], fontSize: 14, color: colors.onSurfaceVariant),
                ],
              ),
            )
          ],
        ),
      ),

      // BOTTOM CHAT BAR
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: colors.surface,
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))],
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  decoration: BoxDecoration(
                    color: colors.surfaceVariant.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: AppText("Hi, is this still available?", color: colors.outline),
                ),
              ),
              const SizedBox(width: 15),
              ElevatedButton(
                onPressed: () {
                  // [FIXED]: 1. Pehle chat history me add karenge
                  controller.startChat(product);

                  // 2. Uske baad Chat screen par bhejenge
                  Get.to(() => MarketplaceChatScreen(
                    sellerName: product['sellerName'],
                    sellerImage: "https://i.pravatar.cc/150?u=${product['sellerName']}",
                    productTitle: product['title'],
                    productPrice: product['price'].toString(),
                    productImage: product['image'],
                  ));
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  backgroundColor: const Color(0xFFFF7043), // Theme Orange
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: AppText("Send", color: Colors.white, fontWeight: AppFonts.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}