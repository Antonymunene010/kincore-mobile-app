// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kincore_app/core/utils/app_colors.dart';
// import 'package:kincore_app/features/screens/feed_screen/create_post_screen.dart';
// import 'package:kincore_app/features/screens/feed_screen/report_issue_screen.dart';
// import '../../../core/utils/app_fonts.dart';
// import '../../../core/widgets/app_text.dart';
// import '../../../core/widgets/custom_network_image.dart';
// import '../../../../core/models/post_model.dart';
// import 'controller/feed_controller.dart';
// import 'your_story_screen.dart';
//
// class FamilyFeedScreen extends StatelessWidget {
//   const FamilyFeedScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(FeedController());
//     final theme = Theme.of(context);
//     final colors = theme.colorScheme;
//     final bool isDark = theme.brightness == Brightness.dark;
//
//     final double sw = Get.width;
//     final bool isMobile = sw < 600;
//     final bool isTablet = sw >= 600 && sw < 1024;
//     final bool isWeb = sw >= 1100;
//
//     return Scaffold(
//       // [FIX] Background thoda greyish kiya taaki 3D white cards clearly pop karein
//       backgroundColor: isMobile ? (isDark ? Colors.black : const Color(0xFFF4F6F8)) : (isDark ? Colors.black : colors.surfaceVariant.withOpacity(0.3)),
//       appBar: AppBar(
//         backgroundColor: colors.surface,
//         elevation: 0.5,
//         automaticallyImplyLeading: false,
//         centerTitle: false,
//         title: AppText('feed.title'.tr, fontSize: 20, fontWeight: AppFonts.semiBold),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.add_circle_outline, color: AppColors.orangeColor, size: 28),
//             onPressed: () => Get.to(() => const CreatePostScreen()),
//           ),
//         ],
//       ),
//       body: Align(
//         alignment: Alignment.topCenter,
//         child: ConstrainedBox(
//           constraints: const BoxConstraints(maxWidth: 1100),
//           child: Container(
//             // Agar web/tablet nahi hai toh background transparent rakha taaki grey background dikhe
//             color: isMobile ? Colors.transparent : colors.surface,
//             child: Column(
//               children: [
//                 /// --- STORIES ---
//                 _buildStories(colors, controller, isWeb || isTablet, isDark),
//
//                 /// --- POSTS ---
//                 Expanded(
//                   child: Obx(() => ListView.builder(
//                     padding: EdgeInsets.symmetric(
//                         vertical: 10,
//                         horizontal: isMobile ? 0 : 20
//                     ),
//                     // [FIX] +1 for the Caught Up message
//                     itemCount: controller.posts.length + 1,
//                     physics: const BouncingScrollPhysics(),
//                     itemBuilder: (context, index) {
//
//                       // [FIX] Sabse end me 'Caught Up' message dikhana hai
//                       if (index == controller.posts.length) {
//                         return _buildCaughtUpMessage(colors);
//                       }
//
//                       final post = controller.posts[index];
//                       return _buildPostCard(context, post, index, controller, colors);
//                     },
//                   )),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Custom Post Card (3D Look + New Header + Old Action Buttons)
//   Widget _buildPostCard(BuildContext context, PostModel post, int index, FeedController controller, ColorScheme colors) {
//     return Container(
//       // [FIX] Card ke chaaro taraf margin diya aur 3D shadow lagayi
//       margin: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
//       decoration: BoxDecoration(
//         color: colors.surface, // Card color hamesha white/surface rahega
//         borderRadius: BorderRadius.circular(20), // Rounded corners
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.04), // Halki si shadow 3D feel ke liye
//             blurRadius: 10,
//             spreadRadius: 2,
//             offset: const Offset(0, 4),
//           )
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // --- HEADER ---
//             Padding(
//               padding: const EdgeInsets.fromLTRB(15, 15, 5, 10),
//               child: Row(
//                 children: [
//                   CustomNetworkImage(imageUrl: post.profilePic, height: 42, width: 42, borderRadius: 21),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             AppText(post.name, fontSize: 14, fontWeight: AppFonts.bold, color: colors.onSurface),
//                             // [FIX] Relationship Tag just like reference image
//                             AppText(
//                               " • Cousin", // Ise aap 'post.relation' se replace kar sakte hain
//                               fontSize: 12,
//                               color: AppColors.orangeColor,
//                               fontWeight: AppFonts.semiBold,
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 2),
//                         // [FIX] Time & City
//                         AppText("2 hours ago • New York", fontSize: 11, color: colors.onSurfaceVariant),
//                       ],
//                     ),
//                   ),
//
//                   // 3-Dot Menu Icon
//                   PopupMenuButton<String>(
//                     icon: Icon(Icons.more_horiz, color: colors.onSurfaceVariant),
//                     color: colors.surface,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                     onSelected: (String value) {
//                       if (value == 'archive') {
//                         Get.snackbar('feed.archiveMenu'.tr, 'feed.archiveMsg'.tr, snackPosition: SnackPosition.BOTTOM, duration: const Duration(seconds: 1));
//                       } else if (value == 'report') {
//                         Get.to(() => const ReportIssueScreen());
//                       }
//                     },
//                     itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
//                       PopupMenuItem<String>(
//                         value: 'archive',
//                         child: Row(
//                           children: [
//                             Icon(Icons.archive_outlined, size: 20, color: colors.onSurface),
//                             const SizedBox(width: 10),
//                             AppText('feed.archiveMenu'.tr, fontSize: 14),
//                           ],
//                         ),
//                       ),
//                       PopupMenuItem<String>(
//                         value: 'report',
//                         child: Row(
//                           children: [
//                             const Icon(Icons.report_problem_outlined, size: 20, color: Colors.redAccent),
//                             const SizedBox(width: 10),
//                             AppText('feed.reportMenu'.tr, fontSize: 14, color: Colors.redAccent),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//
//             // --- CONTENT (Text) ---
//             if (post.content.isNotEmpty)
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//                 child: AppText(post.content, fontSize: 14, color: colors.onSurface),
//               ),
//
//             if (post.content.isNotEmpty) const SizedBox(height: 10),
//
//             // --- IMAGE ---
//             if (post.postImage != null && post.postImage!.isNotEmpty)
//               CustomNetworkImage(
//                 imageUrl: post.postImage!,
//                 width: double.infinity,
//                 height: 300,
//                 fit: BoxFit.cover,
//                 borderRadius: 0, // 0 isliye kyunki ClipRRect already corners ko round kar dega
//               ),
//
//             // --- BOTTOM ACTIONS & COMMENTS (Ye aapka hi code hai exact) ---
//             Padding(
//               padding: const EdgeInsets.all(15),
//               child: Column(
//                 children: [
//                   // Action Row
//                   Row(
//                     children: [
//                       // Heart (Like) Icon
//                       GestureDetector(
//                         onTap: () => controller.toggleLike(index),
//                         child: Icon(
//                           post.isLiked ? Icons.favorite : Icons.favorite_border,
//                           color: post.isLiked ? Colors.red : colors.onSurface,
//                           size: 26,
//                         ),
//                       ),
//                       const SizedBox(width: 5),
//                       AppText("${post.likes}", fontSize: 13, fontWeight: AppFonts.medium),
//
//                       const SizedBox(width: 20),
//
//                       // Comment Icon (Now Clickable)
//                       GestureDetector(
//                         onTap: () => controller.toggleComments(index),
//                         child: Row(
//                           children: [
//                             Icon(Icons.chat_bubble_outline, color: colors.onSurface, size: 24),
//                             const SizedBox(width: 5),
//                             AppText("${post.commentsCount}", fontSize: 13, fontWeight: AppFonts.medium),
//                           ],
//                         ),
//                       ),
//
//                       const Spacer(), // Pushes Save icon to the Right
//
//                       // Save Icon Logic
//                       Obx(() {
//                         bool isSaved = controller.isSaved(post);
//                         return GestureDetector(
//                           onTap: () => controller.toggleSave(post), // Bas controller ko call kiya
//                           child: Icon(
//                             isSaved ? Icons.bookmark : Icons.bookmark_border,
//                             color: isSaved ? colors.primary : colors.onSurface,
//                             size: 26,
//                           ),
//                         );
//                       }),
//                     ],
//                   ),
//
//                   // Expandable Comment Section
//                   if (post.isCommentVisible) ...[
//                     const SizedBox(height: 15),
//                     Divider(color: colors.outlineVariant.withOpacity(0.3), height: 1),
//                     const SizedBox(height: 10),
//
//                     // Comment List
//                     ...post.comments.map((c) => Padding(
//                       padding: const EdgeInsets.only(bottom: 12),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           CustomNetworkImage(imageUrl: c['image'], height: 28, width: 28, borderRadius: 14),
//                           const SizedBox(width: 10),
//                           Expanded(
//                             child: Container(
//                               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                               decoration: BoxDecoration(
//                                 color: colors.surfaceVariant.withOpacity(0.2),
//                                 borderRadius: BorderRadius.circular(15),
//                               ),
//                               child: AppText(c['text'], fontSize: 13, color: colors.onSurface),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )).toList(),
//
//                     // Add new comment Input Field
//                     const SizedBox(height: 5),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: SizedBox(
//                             height: 40,
//                             child: TextField(
//                               onChanged: (val) => controller.commentTexts[index] = val,
//                               style: TextStyle(fontSize: 13, color: colors.onSurface),
//                               decoration: InputDecoration(
//                                 hintText: 'feed.writeComment'.tr, // [FIX] Localized
//                                 hintStyle: TextStyle(fontSize: 13, color: colors.onSurfaceVariant),
//                                 contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
//                                 filled: true,
//                                 fillColor: colors.surfaceVariant.withOpacity(0.1),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(20),
//                                   borderSide: BorderSide(color: colors.outlineVariant.withOpacity(0.5)),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(20),
//                                   borderSide: BorderSide(color: colors.primary),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         GestureDetector(
//                           onTap: () {
//                             controller.addComment(index);
//                             FocusScope.of(context).unfocus(); // Close keyboard on send
//                           },
//                           child: CircleAvatar(
//                             radius: 18,
//                             backgroundColor: colors.primary,
//                             child: Icon(Icons.send_rounded, size: 16, color: colors.onPrimary),
//                           ),
//                         ),
//                       ],
//                     )
//                   ]
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildStories(ColorScheme colors, FeedController controller, bool isLarge, bool isDark) {
//     return Container(
//       height: isLarge ? 135 : 115,
//       decoration: BoxDecoration(
//         color: colors.surface,
//         border: Border(bottom: BorderSide(color: colors.outlineVariant.withOpacity(0.3))),
//       ),
//       child: Obx(() => ListView.builder(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//         scrollDirection: Axis.horizontal,
//         itemCount: controller.members.length + 1,
//         itemBuilder: (context, index) {
//           if (index == 0) {
//             return _buildStoryAvatar(context, 'feed.myStory'.tr, "https://i.pravatar.cc/150?u=me", true, isLarge);
//           }
//           final m = controller.members[index - 1];
//           return _buildStoryAvatar(context, m['name']!, m['image']!, false, isLarge);
//         },
//       )),
//     );
//   }
//
//   Widget _buildStoryAvatar(BuildContext context, String name, String img, bool isAdd, bool isLarge) {
//     final primary = Theme.of(context).colorScheme.primary;
//     double size = isLarge ? 70 : 55;
//
//     return GestureDetector(
//       onTap: () {
//         if (isAdd) {
//           Get.to(() => const YourStoryScreen());
//         } else {
//           // Dusron ki story dekhne ka logic yahan aayega
//         }
//       },
//       child: Padding(
//         padding: const EdgeInsets.only(right: 18),
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(2.5),
//                   decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: primary, width: 2)),
//                   child: CustomNetworkImage(imageUrl: img, height: size, width: size, borderRadius: 50),
//                 ),
//                 if (isAdd)
//                   Positioned(
//                     bottom: 2, right: 2,
//                     child: CircleAvatar(
//                       radius: isLarge ? 11 : 9,
//                       backgroundColor: Colors.white,
//                       child: Icon(Icons.add_circle, color: primary, size: isLarge ? 22 : 18),
//                     ),
//                   ),
//               ],
//             ),
//             const SizedBox(height: 6),
//             // [FIX] Yahan se .tr hataya taaki API se aane wale real names crash na karein
//             AppText(name, fontSize: 11, fontWeight: AppFonts.medium),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // --- Caught Up Message UI ---
//   // --- Caught Up Message UI ---
//   Widget _buildCaughtUpMessage(ColorScheme colors) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 40),
//       child: Column(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: AppColors.orangeColor.withOpacity(0.1),
//               shape: BoxShape.circle,
//             ),
//             child: const Icon(Icons.diversity_2_outlined, color: AppColors.orangeColor, size: 30),
//           ),
//           const SizedBox(height: 15),
//           AppText(
//               'feed.caughtUp'.tr,
//               fontSize: 14,
//               color: colors.onSurfaceVariant
//           ),
//           const SizedBox(height: 8),
//           AppText(
//             'feed.findMore'.tr,
//             fontSize: 13,
//             color: AppColors.orangeColor,
//             fontWeight: AppFonts.semiBold,
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import 'package:kincore_app/features/screens/feed_screen/create_post_screen.dart';
import 'package:kincore_app/features/screens/feed_screen/report_issue_screen.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_network_image.dart';
import '../../../../core/models/post_model.dart';
import '../profile_screens/profile_screen.dart'; // [FIX]: Profile screen import kiya test karne ke liye
import 'controller/feed_controller.dart';
import 'your_story_screen.dart';

class FamilyFeedScreen extends StatelessWidget {
  const FamilyFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FeedController());
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final bool isDark = theme.brightness == Brightness.dark;

    final double sw = Get.width;
    final bool isMobile = sw < 600;
    final bool isTablet = sw >= 600 && sw < 1024;
    final bool isWeb = sw >= 1100;

    return Scaffold(
      backgroundColor: isMobile ? (isDark ? Colors.black : const Color(0xFFF4F6F8)) : (isDark ? Colors.black : colors.surfaceVariant.withOpacity(0.3)),
      appBar: AppBar(
        backgroundColor: colors.surface,
        elevation: 0.5,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: AppText('feed.title'.tr, fontSize: 20, fontWeight: AppFonts.semiBold),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline, color: AppColors.orangeColor, size: 28),
            onPressed: () => Get.to(() => const CreatePostScreen()),
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Container(
            color: isMobile ? Colors.transparent : colors.surface,
            child: Column(
              children: [
                /// --- STORIES ---
                _buildStories(colors, controller, isWeb || isTablet, isDark),

                /// --- POSTS ---
                Expanded(
                  child: Obx(() => ListView.builder(
                    padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: isMobile ? 0 : 20
                    ),
                    itemCount: controller.posts.length + 1,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {

                      if (index == controller.posts.length) {
                        return _buildCaughtUpMessage(colors);
                      }

                      final post = controller.posts[index];
                      return _buildPostCard(context, post, index, controller, colors);
                    },
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Custom Post Card
  Widget _buildPostCard(BuildContext context, PostModel post, int index, FeedController controller, ColorScheme colors) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- HEADER ---
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 5, 10),
              child: Row(
                children: [
                  // [FIX]: Header ko clickable banaya taaki client "Other Profile" test kar sake
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        // isOwnProfile ko false pass kiya taaki dusre user wali profile khule
                        Get.to(() => const ProfileScreen(isOwnProfile: false));
                      },
                      child: Row(
                        children: [
                          CustomNetworkImage(imageUrl: post.profilePic, height: 42, width: 42, borderRadius: 21),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    AppText(post.name, fontSize: 14, fontWeight: AppFonts.bold, color: colors.onSurface),
                                    AppText(
                                      " • Cousin",
                                      fontSize: 12,
                                      color: AppColors.orangeColor,
                                      fontWeight: AppFonts.semiBold,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 2),
                                AppText("2 hours ago • New York", fontSize: 11, color: colors.onSurfaceVariant),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // 3-Dot Menu Icon
                  PopupMenuButton<String>(
                    icon: Icon(Icons.more_horiz, color: colors.onSurfaceVariant),
                    color: colors.surface,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    onSelected: (String value) {
                      if (value == 'archive') {
                        Get.snackbar('feed.archiveMenu'.tr, 'feed.archiveMsg'.tr, snackPosition: SnackPosition.BOTTOM, duration: const Duration(seconds: 1));
                      } else if (value == 'report') {
                        Get.to(() => const ReportIssueScreen());
                      }
                    },
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'archive',
                        child: Row(
                          children: [
                            Icon(Icons.archive_outlined, size: 20, color: colors.onSurface),
                            const SizedBox(width: 10),
                            AppText('feed.archiveMenu'.tr, fontSize: 14),
                          ],
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'report',
                        child: Row(
                          children: [
                            const Icon(Icons.report_problem_outlined, size: 20, color: Colors.redAccent),
                            const SizedBox(width: 10),
                            AppText('feed.reportMenu'.tr, fontSize: 14, color: Colors.redAccent),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // --- CONTENT (Text) ---
            if (post.content.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: AppText(post.content, fontSize: 14, color: colors.onSurface),
              ),

            if (post.content.isNotEmpty) const SizedBox(height: 10),

            // --- IMAGE ---
            if (post.postImage != null && post.postImage!.isNotEmpty)
              CustomNetworkImage(
                imageUrl: post.postImage!,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
                borderRadius: 0,
              ),

            // --- BOTTOM ACTIONS & COMMENTS ---
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => controller.toggleLike(index),
                        child: Icon(
                          post.isLiked ? Icons.favorite : Icons.favorite_border,
                          color: post.isLiked ? Colors.red : colors.onSurface,
                          size: 26,
                        ),
                      ),
                      const SizedBox(width: 5),
                      AppText("${post.likes}", fontSize: 13, fontWeight: AppFonts.medium),

                      const SizedBox(width: 20),

                      GestureDetector(
                        onTap: () => controller.toggleComments(index),
                        child: Row(
                          children: [
                            Icon(Icons.chat_bubble_outline, color: colors.onSurface, size: 24),
                            const SizedBox(width: 5),
                            AppText("${post.commentsCount}", fontSize: 13, fontWeight: AppFonts.medium),
                          ],
                        ),
                      ),

                      const Spacer(),

                      Obx(() {
                        bool isSaved = controller.isSaved(post);
                        return GestureDetector(
                          onTap: () => controller.toggleSave(post),
                          child: Icon(
                            isSaved ? Icons.bookmark : Icons.bookmark_border,
                            color: isSaved ? colors.primary : colors.onSurface,
                            size: 26,
                          ),
                        );
                      }),
                    ],
                  ),

                  if (post.isCommentVisible) ...[
                    const SizedBox(height: 15),
                    Divider(color: colors.outlineVariant.withOpacity(0.3), height: 1),
                    const SizedBox(height: 10),

                    ...post.comments.map((c) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomNetworkImage(imageUrl: c['image'], height: 28, width: 28, borderRadius: 14),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: colors.surfaceVariant.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: AppText(c['text'], fontSize: 13, color: colors.onSurface),
                            ),
                          ),
                        ],
                      ),
                    )).toList(),

                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: TextField(
                              onChanged: (val) => controller.commentTexts[index] = val,
                              style: TextStyle(fontSize: 13, color: colors.onSurface),
                              decoration: InputDecoration(
                                hintText: 'feed.writeComment'.tr,
                                hintStyle: TextStyle(fontSize: 13, color: colors.onSurfaceVariant),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                                filled: true,
                                fillColor: colors.surfaceVariant.withOpacity(0.1),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: colors.outlineVariant.withOpacity(0.5)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: colors.primary),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            controller.addComment(index);
                            FocusScope.of(context).unfocus();
                          },
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: colors.primary,
                            child: Icon(Icons.send_rounded, size: 16, color: colors.onPrimary),
                          ),
                        ),
                      ],
                    )
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStories(ColorScheme colors, FeedController controller, bool isLarge, bool isDark) {
    return Container(
      height: isLarge ? 135 : 115,
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border(bottom: BorderSide(color: colors.outlineVariant.withOpacity(0.3))),
      ),
      child: Obx(() => ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: controller.members.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildStoryAvatar(context, 'feed.myStory'.tr, "https://i.pravatar.cc/150?u=me", true, isLarge);
          }
          final m = controller.members[index - 1];
          return _buildStoryAvatar(context, m['name']!, m['image']!, false, isLarge);
        },
      )),
    );
  }

  Widget _buildStoryAvatar(BuildContext context, String name, String img, bool isAdd, bool isLarge) {
    final primary = Theme.of(context).colorScheme.primary;
    double size = isLarge ? 70 : 55;

    return GestureDetector(
      onTap: () {
        if (isAdd) {
          Get.to(() => const YourStoryScreen());
        } else {
          // [FIX]: Yahan Story click par bhi chaho toh doosri profile ya story view khol sakte ho
          Get.to(() => const ProfileScreen(isOwnProfile: false));
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 18),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(2.5),
                  decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: primary, width: 2)),
                  child: CustomNetworkImage(imageUrl: img, height: size, width: size, borderRadius: 50),
                ),
                if (isAdd)
                  Positioned(
                    bottom: 2, right: 2,
                    child: CircleAvatar(
                      radius: isLarge ? 11 : 9,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.add_circle, color: primary, size: isLarge ? 22 : 18),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 6),
            AppText(name, fontSize: 11, fontWeight: AppFonts.medium),
          ],
        ),
      ),
    );
  }

  Widget _buildCaughtUpMessage(ColorScheme colors) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.orangeColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.diversity_2_outlined, color: AppColors.orangeColor, size: 30),
          ),
          const SizedBox(height: 15),
          AppText(
              'feed.caughtUp'.tr,
              fontSize: 14,
              color: colors.onSurfaceVariant
          ),
          const SizedBox(height: 8),
          AppText(
            'feed.findMore'.tr,
            fontSize: 13,
            color: AppColors.orangeColor,
            fontWeight: AppFonts.semiBold,
          ),
        ],
      ),
    );
  }
}