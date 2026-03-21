import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
import 'controller/market_place_contoller.dart';
import 'market_place_chat_screen.dart';

class MarketplaceChatHistoryScreen extends StatelessWidget {
  const MarketplaceChatHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller pehle se inject ho chuka hoga main screen pe
    final controller = Get.find<MarketplaceController>();
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: colors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: colors.onSurface, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText('marketplace.messages'.tr, fontSize: 20, fontWeight: AppFonts.bold, color: colors.onSurface),
      ),
      body: Obx(() {
        if (controller.chatHistory.isEmpty) {
          return Center(
            child: AppText('marketplace.noMessages'.tr, color: colors.outline, fontSize: 16),
          );
        }

        return ListView.separated(
          itemCount: controller.chatHistory.length,
          separatorBuilder: (context, index) => Divider(color: colors.outlineVariant.withOpacity(0.3), height: 1),
          itemBuilder: (context, index) {
            final chat = controller.chatHistory[index];

            return ListTile(
              isThreeLine: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              leading: Stack(
                children: [
                  CircleAvatar(radius: 26, backgroundImage: NetworkImage(chat['sellerImage'])),
                  if (chat['unread'] > 0)
                    Positioned(
                      right: 0, bottom: 0,
                      child: CircleAvatar(
                        radius: 11,
                        backgroundColor: colors.surface,
                        child: CircleAvatar(
                          radius: 9,
                          backgroundColor: const Color(0xFFFF7043), // Orange Theme
                          child: AppText(chat['unread'].toString(), color: Colors.white, fontSize: 10, fontWeight: AppFonts.bold),
                        ),
                      ),
                    )
                ],
              ),
              // API se aane wale data (sellerName, productTitle) par .tr nahi lagta
              title: AppText(chat['sellerName'], fontSize: 16, fontWeight: chat['unread'] > 0 ? AppFonts.bold : AppFonts.semiBold),

              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 4),
                  AppText(chat['productTitle'], fontSize: 12, color: const Color(0xFFFF7043), fontWeight: AppFonts.semiBold),
                  const SizedBox(height: 2),
                  // Ye either dynamic message hoga ya 'Hi, is this still available?' jo controller me localize ho chuka hai
                  AppText(
                      chat['lastMessage'],
                      fontSize: 13,
                      color: chat['unread'] > 0 ? colors.onSurface : colors.onSurfaceVariant,
                      maxLines: 1
                  ),
                ],
              ),

              // [FIXED]: FittedBox lagaya hai. Ab chahe Web ho ya Mobile, kabhi overflow nahi aayega!
              trailing: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Controller mein time already translate ho gaya hai (Yesterday/Just now)
                    AppText(chat['time'], fontSize: 11, color: colors.outline),
                    const SizedBox(height: 4),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        chat['productImage'],
                        width: 32,
                        height: 32,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: 32, height: 32, color: colors.surfaceVariant,
                          child: Icon(Icons.broken_image, size: 16, color: colors.outline),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Get.to(() => MarketplaceChatScreen(
                  sellerName: chat['sellerName'],
                  sellerImage: chat['sellerImage'],
                  productTitle: chat['productTitle'],
                  productPrice: chat['productPrice'],
                  productImage: chat['productImage'],
                ));
              },
            );
          },
        );
      }),
    );
  }
}