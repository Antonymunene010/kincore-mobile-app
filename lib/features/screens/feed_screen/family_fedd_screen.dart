import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_text.dart';
import '../../../core/widgets/custom_icon_button.dart';
import 'controller/feed_controller.dart';
import 'widget/post_card.dart';
import 'widget/post_input_area.dart';

class FamilyFeedScreen extends StatelessWidget {
  const FamilyFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FeedController());

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: AppText("Family Feed", fontSize: 20, fontWeight: AppFonts.semiBold),
        actions: [
          CustomIconButton(iconName: 'bell.svg', onTap: () {}),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          const PostInputArea(),
          Expanded(
            child: Obx(
                  () => ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                itemCount: controller.posts.length,
                // --- SMOOTHNESS KE LIYE YE ADD KIYA HAI ---
                physics: const BouncingScrollPhysics(), // Ekdum smooth scroll experience
                cacheExtent: 1000, // Screen ke niche 1000 pixels tak ka data ready rakhega
                addAutomaticKeepAlives: true,
                addRepaintBoundaries: true,
                // ----------------------------------------
                itemBuilder: (context, index) {
                  return PostCard(
                      key: ValueKey(controller.posts[index].id), // Unique key for better performance
                      index: index,
                      controller: controller
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}