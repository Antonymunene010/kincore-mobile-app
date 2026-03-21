import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/feed_controller.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_network_image.dart';
import '../../../../core/models/post_model.dart';

class SavedFeedScreen extends StatelessWidget {
  const SavedFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // FamilyFeedScreen se jo Controller initialize hua hai usko find kar rahe hain
    final FeedController controller = Get.find<FeedController>();

    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final bool isDark = theme.brightness == Brightness.dark;

    final double sw = Get.width;
    final bool isMobile = sw < 600;

    return Scaffold(
      backgroundColor: isMobile ? colors.surface : (isDark ? Colors.black : colors.surfaceVariant.withOpacity(0.3)),
      appBar: AppBar(
        backgroundColor: colors.surface,
        elevation: 0.5,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: colors.onSurface),
          onPressed: () => Get.back(),
        ),
        title: AppText('feed.savedCollection'.tr, fontSize: 20, fontWeight: AppFonts.semiBold, color: colors.onSurface),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Container(
            decoration: BoxDecoration(
              color: colors.surface,
              border: !isMobile ? Border(
                left: BorderSide(color: colors.outlineVariant.withOpacity(0.4)),
                right: BorderSide(color: colors.outlineVariant.withOpacity(0.4)),
              ) : null,
            ),
            child: Obx(() {
              if (controller.savedPosts.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.bookmark_border, size: 60, color: colors.outlineVariant),
                      const SizedBox(height: 10),
                      AppText('feed.noSavedPosts'.tr, color: colors.onSurfaceVariant),
                    ],
                  ),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                itemCount: controller.savedPosts.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final post = controller.savedPosts[index];
                  return _buildSavedPostItem(context, post, controller, colors);
                },
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildSavedPostItem(BuildContext context, PostModel post, FeedController controller, ColorScheme colors) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: colors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: colors.outlineVariant.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              CustomNetworkImage(
                  imageUrl: post.profilePic,
                  height: 40,
                  width: 40,
                  borderRadius: 20
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // API Names (name/username) pe .tr nahi lagayenge
                  AppText(post.name, fontSize: 14, fontWeight: AppFonts.bold, color: colors.onSurface),
                  AppText(post.username, fontSize: 11, color: colors.onSurfaceVariant),
                ],
              ),
              const Spacer(),
              // Saved Icon (Filled) - Click to Remove
              IconButton(
                icon: Icon(Icons.bookmark, color: colors.primary),
                onPressed: () => controller.toggleSave(post),
                tooltip: 'feed.removeFromCollection'.tr,
              ),
            ],
          ),
          const SizedBox(height: 10),

          if (post.content.isNotEmpty)
            AppText(post.content, fontSize: 14, color: colors.onSurface, maxLines: 3, overflow: TextOverflow.ellipsis),

          if (post.postImage != null && post.postImage!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CustomNetworkImage(
                    imageUrl: post.postImage!,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover
                ),
              ),
            ),
        ],
      ),
    );
  }
}