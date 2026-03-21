import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../controller/feed_controller.dart';
import '../report_issue_screen.dart';

class PostCard extends StatelessWidget {
  final int index;
  final FeedController controller;

  const PostCard({super.key, required this.index, required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final bool isDark = theme.brightness == Brightness.dark;
    final bool isWeb = Get.width > 900;

    return Obx(() {
      final post = controller.posts[index];

      return Container(
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(isWeb ? 15 : 12),
          // --- BORDER TYPE VIEW FOR DARK MODE ---
          border: Border.all(
            color: isDark ? colors.outlineVariant.withOpacity(0.5) : colors.outlineVariant.withOpacity(0.2),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? 0.3 : 0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ---------- HEADER ----------
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              leading: CustomNetworkImage(imageUrl: post.profilePic, height: 45, width: 45, borderRadius: 25),
              title: AppText(post.name, fontSize: 15, fontWeight: AppFonts.bold),
              subtitle: AppText(post.username, fontSize: 12, color: colors.onSurfaceVariant),
              trailing: PopupMenuButton<String>(
                icon: Icon(Icons.more_vert, color: colors.onSurfaceVariant),
                onSelected: (value) {
                  if (value == 'report') Get.to(() => const ReportIssueScreen());
                },
                itemBuilder: (_) => [
                  PopupMenuItem(value: 'archive', child: Text('feed.archive'.tr)),
                  PopupMenuItem(value: 'report', child: Text('feed.reportPost'.tr, style: TextStyle(color: Colors.red))),
                ],
              ),
            ),

            /// ---------- POST TEXT ----------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: AppText(post.content, fontSize: 14, color: colors.onSurface),
            ),

            /// ---------- POST IMAGE ----------
            if (post.postImage != null)
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    border: Border.symmetric(
                        horizontal: BorderSide(color: colors.outlineVariant.withOpacity(0.2))
                    )
                ),
                child: CustomNetworkImage(
                  imageUrl: post.postImage!,
                  width: double.infinity,
                  height: isWeb ? 400 : 280,
                  fit: BoxFit.cover,
                ),
              ),

            /// ---------- INTERACTIONS ----------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  _iconBtn(
                      post.isLiked ? Icons.favorite : Icons.favorite_border,
                      post.isLiked ? Colors.red : colors.onSurfaceVariant,
                      "${post.likes}",
                          () => controller.toggleLike(index)
                  ),
                  const SizedBox(width: 15),
                  _iconBtn(Icons.chat_bubble_outline, colors.onSurfaceVariant, "${post.commentsCount}", () => controller.toggleComments(index)),
                  const Spacer(),
                  IconButton(icon: const Icon(Icons.bookmark_border), onPressed: () {}),
                ],
              ),
            ),

            /// ---------- COMMENT SECTION ----------
            if (post.isCommentVisible) _buildCommentSection(colors, post, index, isDark),
          ],
        ),
      );
    });
  }

  Widget _iconBtn(IconData icon, Color color, String count, VoidCallback tap) {
    return InkWell(
      onTap: tap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(width: 5),
            AppText(count, fontSize: 13),
          ],
        ),
      ),
    );
  }

  Widget _buildCommentSection(ColorScheme colors, dynamic post, int index, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isDark ? colors.surfaceVariant.withOpacity(0.1) : colors.surfaceVariant.withOpacity(0.2),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
        border: Border(top: BorderSide(color: colors.outlineVariant.withOpacity(0.3))),
      ),
      child: Column(
        children: [
          ...post.comments.map((comment) => _commentTile(colors, comment)).toList(),
          const SizedBox(height: 10),
          _commentInput(colors, index),
        ],
      ),
    );
  }

  Widget _commentTile(ColorScheme colors, dynamic comment) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomNetworkImage(imageUrl: comment['image'] ?? "", height: 32, width: 32, borderRadius: 16),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: colors.surface, borderRadius: BorderRadius.circular(12)),
              child: AppText(comment['text'] ?? "", fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _commentInput(ColorScheme colors, int index) {
    return Row(
      children: [
        const CustomNetworkImage(imageUrl: "https://i.pravatar.cc/150?u=me", height: 35, width: 35, borderRadius: 20),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'feed.writeCommentHint'.tr,
              hintStyle: const TextStyle(fontSize: 13),
              filled: true,
              fillColor: colors.surface,
              contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide.none),
              suffixIcon: IconButton(icon: Icon(Icons.send, color: colors.primary, size: 20), onPressed: () {}),
            ),
          ),
        ),
      ],
    );
  }
}
