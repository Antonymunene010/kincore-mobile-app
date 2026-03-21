import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_network_image.dart';

class ProductChatScreen extends StatelessWidget {
  // [NEW]: Dynamic data ke liye variables
  final String productName;
  final String productPrice;
  final String productImage;

  const ProductChatScreen({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productImage,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: colors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: colors.onSurface, size: 20),
          onPressed: () => Get.back(),
        ),
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'), // Seller ka image
              radius: 18,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText("Arthur Harrison", fontSize: 16, fontWeight: AppFonts.semiBold, color: colors.onSurface),
                AppText('chat.online'.tr, fontSize: 11, color: Colors.green),
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            children: [
              // Context Header (Dynamic Product Data)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: colors.surface,
                  border: Border(bottom: BorderSide(color: colors.outlineVariant.withOpacity(0.3))),
                ),
                child: Row(
                  children: [
                    CustomNetworkImage(
                      imageUrl: productImage, // [UPDATED]
                      width: 50, height: 50, borderRadius: 8,
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(productName, fontSize: 14, fontWeight: AppFonts.semiBold, color: colors.onSurface), // [UPDATED]
                          AppText("\$$productPrice", fontSize: 13, color: AppColors.orangeColor, fontWeight: AppFonts.bold), // [UPDATED]
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Chat Area
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    _buildChatBubble("Hi, is this still available?", isMe: false, colors: colors, isDark: isDark),
                  ],
                ),
              ),

              // Message Input Box
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: colors.surface,
                  boxShadow: [
                    if(!isDark)
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
                            hintText: 'chat.typeMessage'.tr,
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
                        backgroundColor: AppColors.orangeColor,
                        radius: 22,
                        child: IconButton(
                          icon: const Icon(Icons.send, color: Colors.white, size: 20),
                          onPressed: () {}, // Send logic
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChatBubble(String text, {required bool isMe, required ColorScheme colors, required bool isDark}) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isMe
              ? AppColors.orangeColor
              : (isDark ? colors.surfaceVariant.withOpacity(0.3) : colors.surfaceVariant.withOpacity(0.5)),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(15),
            topRight: const Radius.circular(15),
            bottomLeft: Radius.circular(isMe ? 15 : 0),
            bottomRight: Radius.circular(isMe ? 0 : 15),
          ),
        ),
        child: AppText(
          text,
          color: isMe ? Colors.white : colors.onSurface,
          fontSize: 14,
        ),
      ),
    );
  }
}