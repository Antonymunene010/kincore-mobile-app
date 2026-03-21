import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';

class MarketplaceChatScreen extends StatelessWidget {
  final String sellerName;
  final String sellerImage;
  final String productTitle;
  final String productPrice;
  final String productImage;

  const MarketplaceChatScreen({
    super.key,
    required this.sellerName,
    required this.sellerImage,
    required this.productTitle,
    required this.productPrice,
    required this.productImage,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: colors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: colors.onSurface, size: 20),
          onPressed: () => Get.back(),
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(sellerImage),
              radius: 18,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(sellerName, fontSize: 16, fontWeight: AppFonts.bold, color: colors.onSurface),
                AppText("Online", fontSize: 11, color: Colors.green),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Context Header: Jis product ki baat ho rahi hai
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: colors.surface,
              border: Border(bottom: BorderSide(color: colors.outlineVariant.withOpacity(0.3))),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(productImage, width: 50, height: 50, fit: BoxFit.cover),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(productTitle, fontSize: 14, fontWeight: AppFonts.semiBold, color: colors.onSurface),
                      AppText("\$$productPrice", fontSize: 13, color: const Color(0xFFFF7043), fontWeight: AppFonts.bold),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Chat Area (Dummy chat bubble jo "Send" pe click karne ke baad aayi)
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF7043), // Theme Orange
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    child: AppText(
                      "Hi, is this still available?",
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Message Input Box
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: colors.surface,
              boxShadow: [
                if (!isDark)
                  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -4))
              ],
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: colors.onSurface),
                      decoration: InputDecoration(
                        hintText: "Type a message...",
                        hintStyle: TextStyle(color: colors.outline),
                        filled: true,
                        fillColor: isDark ? colors.surfaceVariant.withOpacity(0.2) : colors.surfaceVariant.withOpacity(0.3),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: const Color(0xFFFF7043),
                    radius: 22,
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white, size: 20),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}