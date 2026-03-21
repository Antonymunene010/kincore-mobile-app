import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
import 'controller/reels_controller.dart';
import 'reels_userprofile_screen.dart';
import 'widget/reels_video_player_screen.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReelsController());

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 24),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator(color: Colors.orange));
        }

        return PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: controller.reels.length,
          itemBuilder: (context, index) {
            final reel = controller.reels[index];
            return Stack(
              children: [
                // [FIXED]: Naya Video Player Widget Jo Niche Banaya Hai
                Positioned.fill(
                  child: ReelVideoPlayer(videoUrl: reel['videoUrl']),
                ),

                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black.withOpacity(0.6), Colors.transparent, Colors.black.withOpacity(0.6)],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),

                // Right Side Actions
                Positioned(
                  right: 15, bottom: 80,
                  child: Column(
                    children: [
                      _buildReelAction(
                        reel['isLiked'] ? Icons.favorite : Icons.favorite_border,
                        controller.formatLikes(reel['likes']),
                        iconColor: reel['isLiked'] ? Colors.red : Colors.white,
                        onTap: () => controller.toggleLike(index),
                      ),
                      _buildReelAction(
                        Icons.comment,
                        reel['comments'],
                        onTap: () => _showCommentsSheet(context),
                      ),
                      _buildReelAction(Icons.share, 'Share'),
                      _buildReelAction(
                        Icons.more_horiz,
                        '',
                        onTap: () => _showOptionsSheet(context),
                      ),
                    ],
                  ),
                ),

                // Bottom User Info
                Positioned(
                  left: 15, bottom: 30, right: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => Get.to(() => ReelUserProfileScreen(userName: reel['user'], userPic: reel['userPic'])),
                        child: Row(
                          children: [
                            CircleAvatar(radius: 20, backgroundImage: NetworkImage(reel['userPic'])),
                            const SizedBox(width: 10),
                            AppText(reel['user'], color: Colors.white, fontSize: 16, fontWeight: AppFonts.bold),
                            const SizedBox(width: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: AppText("Follow", color: Colors.white, fontSize: 12),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      AppText(reel['description'], color: Colors.white, fontSize: 14),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.music_note, color: Colors.white, size: 16),
                          const SizedBox(width: 8),
                          AppText(reel['audio'], color: Colors.white, fontSize: 12),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        );
      }),
    );
  }

  Widget _buildReelAction(IconData icon, String text, {Color iconColor = Colors.white, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Column(
          children: [
            Icon(icon, color: iconColor, size: 35),
            if (text.isNotEmpty) const SizedBox(height: 5),
            if (text.isNotEmpty) AppText(text, color: Colors.white, fontSize: 12),
          ],
        ),
      ),
    );
  }

  // ----------- BOTTOM SHEETS LOGIC -----------

  void _showCommentsSheet(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    Get.bottomSheet(
      Container(
        height: Get.height * 0.6,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(width: 40, height: 5, decoration: BoxDecoration(color: colors.outlineVariant, borderRadius: BorderRadius.circular(10))),
            const SizedBox(height: 15),
            AppText("Comments", fontSize: 18, fontWeight: AppFonts.bold),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                padding: const EdgeInsets.all(15),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(radius: 18, backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=${index + 10}')),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText("User_${index + 1}", fontSize: 14, fontWeight: AppFonts.bold),
                              const SizedBox(height: 3),
                              AppText("This is an amazing video! Love it 🔥", fontSize: 13, color: colors.onSurface),
                            ],
                          ),
                        ),
                        Icon(Icons.favorite_border, size: 16, color: colors.outline),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15).copyWith(bottom: 30),
              decoration: BoxDecoration(border: Border(top: BorderSide(color: colors.outlineVariant.withOpacity(0.5)))),
              child: Row(
                children: [
                  const CircleAvatar(radius: 18, backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=1')),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                      decoration: BoxDecoration(color: colors.surfaceVariant.withOpacity(0.3), borderRadius: BorderRadius.circular(25)),
                      child: AppText("Add a comment...", fontSize: 13, color: colors.outline),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  void _showOptionsSheet(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 40, height: 5, decoration: BoxDecoration(color: colors.outlineVariant, borderRadius: BorderRadius.circular(10))),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.report_problem_outlined, color: Colors.redAccent, size: 28),
              title: AppText("Report", fontSize: 16, fontWeight: AppFonts.semiBold, color: Colors.redAccent),
              onTap: () {
                Get.back();
                Get.snackbar("Reported", "Thanks for letting us know.", snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.redAccent, colorText: Colors.white, margin: const EdgeInsets.all(10));
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

