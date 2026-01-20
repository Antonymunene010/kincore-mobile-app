// import 'package:flutter/material.dart';
// import '../controller/feed_controller.dart';
//
// class PostCard extends StatelessWidget {
//   final int index;
//   final FeedController controller;
//
//   const PostCard({super.key, required this.index, required this.controller});
//
//   @override
//   Widget build(BuildContext context) {
//     var post = controller.posts[index];
//     return Container(
//       margin: const EdgeInsets.only(bottom: 15),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(color: Colors.grey.shade200),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ListTile(
//             leading: CircleAvatar(backgroundImage: NetworkImage(post.profilePic)),
//             title: Text(post.name, style: const TextStyle(fontWeight: FontWeight.bold)),
//             subtitle: Text(post.username),
//             trailing: PopupMenuButton(
//               icon: const Icon(Icons.more_vert),
//               itemBuilder: (context) => [
//                 const PopupMenuItem(value: 'repost', child: Text("Repost")),
//                 const PopupMenuItem(value: 'archive', child: Text("Archive")),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: Text(post.content),
//           ),
//           if (post.postImage != null) ...[
//             const SizedBox(height: 10),
//             Image.network(post.postImage!, width: double.infinity, height: 200, fit: BoxFit.cover),
//           ],
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Row(
//               children: [
//                 IconButton(
//                   icon: Icon(
//                     post.isLiked ? Icons.favorite : Icons.favorite_border,
//                     color: post.isLiked ? Colors.red : Colors.grey,
//                   ),
//                   onPressed: () => controller.toggleLike(index),
//                 ),
//                 Text("${post.likes}"),
//                 const SizedBox(width: 15),
//                 IconButton(
//                   icon: const Icon(Icons.chat_bubble_outline),
//                   onPressed: () => controller.toggleComments(index),
//                 ),
//                 Text("${post.commentsCount}"),
//                 const Spacer(),
//                 const Icon(Icons.bookmark_border, color: Colors.grey),
//               ],
//             ),
//           ),
//           if (post.isCommentVisible)
//             Container(
//               padding: const EdgeInsets.all(15),
//               color: Colors.grey.shade50,
//               child: Column(
//                 children: [
//                   ...post.comments.map((c) => Padding(
//                     padding: const EdgeInsets.only(bottom: 8),
//                     child: Row(
//                       children: [
//                         const Icon(Icons.subdirectory_arrow_right, size: 16, color: Colors.grey),
//                         const SizedBox(width: 5),
//                         Text(c),
//                       ],
//                     ),
//                   )).toList(),
//                   TextField(
//                     controller: controller.commentController,
//                     decoration: InputDecoration(
//                       hintText: "Write a comment...",
//                       suffixIcon: IconButton(
//                         icon: const Icon(Icons.send, color: Color(0xFFFF6130)),
//                         onPressed: () => controller.addComment(index),
//                       ),
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../controller/feed_controller.dart';
import '../repost_issu_screen.dart';

class PostCard extends StatelessWidget {
  final int index;
  final FeedController controller;

  const PostCard({super.key, required this.index, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var post = controller.posts[index];
      return Container(
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CustomNetworkImage(
                imageUrl: post.profilePic,
                height: 40,
                width: 40,
                borderRadius: 100,
              ),
              title: Text(post.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(post.username),
              // --- UPDATED POPUP MENU DESIGN ---
              trailing: PopupMenuButton<String>(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                icon: const Icon(Icons.more_vert, color: Colors.black54),
                onSelected: (value) {
                  if (value == 'report') {
                    // Report screen par navigate karega
                    Get.to(() => const ReportIssueScreen());
                  } else if (value == 'archive') {
                    print("Post Archived");
                    // controller.archivePost(index); // Future use ke liye
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'archive',
                    child: Row(
                      children: const [
                        Icon(Icons.archive_outlined, size: 20, color: Colors.black87),
                        SizedBox(width: 10),
                        Text("Archive"),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'report',
                    child: Row(
                      children: const [
                        Icon(Icons.report_gmailerrorred_outlined, size: 20, color: Colors.redAccent),
                        SizedBox(width: 10),
                        Text("Report", style: TextStyle(color: Colors.redAccent)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(post.content),
            ),

            if (post.postImage != null) ...[
              const SizedBox(height: 10),
              CustomNetworkImage(
                imageUrl: post.postImage!,
                width: double.infinity,
                height: 200,
                borderRadius: 0,
                fit: BoxFit.cover,
              ),
            ],

            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      post.isLiked ? Icons.favorite : Icons.favorite_border,
                      color: post.isLiked ? Colors.red : Colors.grey,
                    ),
                    onPressed: () => controller.toggleLike(index),
                  ),
                  Text("${post.likes}"),
                  const SizedBox(width: 15),
                  IconButton(
                    icon: const Icon(Icons.chat_bubble_outline),
                    onPressed: () => controller.toggleComments(index),
                  ),
                  Text("${post.commentsCount}"),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.bookmark_border, color: Colors.grey),
                    onPressed: () => print("Saved"),
                  ),
                ],
              ),
            ),

            if (post.isCommentVisible)
              Container(
                padding: const EdgeInsets.all(15),
                color: Colors.grey.shade50,
                child: Column(
                  children: [
                    ...post.comments.map((commentData) {
                      final String commentText = (commentData is Map) ? (commentData['text'] ?? "") : commentData.toString();
                      final String userImg = (commentData is Map) ? (commentData['image'] ?? "https://i.pravatar.cc/150?u=99") : "https://i.pravatar.cc/150?u=99";

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomNetworkImage(
                              imageUrl: userImg,
                              height: 28,
                              width: 28,
                              borderRadius: 100,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.grey.shade200),
                                ),
                                child: Text(commentText, style: const TextStyle(fontSize: 13)),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    const SizedBox(height: 10),
                    TextField(
                      onChanged: (val) => controller.commentTexts[index] = val,
                      controller: TextEditingController.fromValue(
                        TextEditingValue(
                          text: controller.commentTexts[index] ?? "",
                          selection: TextSelection.collapsed(offset: (controller.commentTexts[index] ?? "").length),
                        ),
                      ),
                      decoration: InputDecoration(
                        hintText: "Write a comment...", filled: true, fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.send, color: Color(0xFFFF6130)),
                          onPressed: () => controller.addComment(index),
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: Colors.grey.shade200)),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      );
    });
  }
}