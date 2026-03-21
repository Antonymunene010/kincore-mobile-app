// import 'package:flutter/material.dart';
//
// class PostInputArea extends StatelessWidget {
//   const PostInputArea({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(15),
//       padding: const EdgeInsets.all(15),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(color: Colors.grey.shade200),
//       ),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               const CircleAvatar(
//                 backgroundImage: NetworkImage("https://i.pravatar.cc/150?u=me"),
//               ),
//               const SizedBox(width: 10),
//               const Expanded(
//                 child: Text(
//                   "What's Happening?",
//                   style: TextStyle(color: Colors.grey),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 15),
//           Row(
//             children: [
//               Icon(Icons.image_outlined, color: Colors.grey.shade400),
//               const SizedBox(width: 15),
//               Icon(Icons.gif_box_outlined, color: Colors.grey.shade400),
//               const SizedBox(width: 15),
//               Icon(Icons.emoji_emotions_outlined, color: Colors.grey.shade400),
//               const Spacer(),
//               ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFFFF6130),
//                   elevation: 0,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                 ),
//                 child: const Text(
//                   "Post",
//                   style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import 'package:kincore_app/core/widgets/custom_button.dart';
import 'package:kincore_app/core/widgets/custom_network_image.dart'; // Path verify kar lena bhai
import 'package:kincore_app/features/screens/feed_screen/create_post_screen.dart';
import '../controller/feed_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../controller/feed_controller.dart';
import '../create_post_screen.dart';

class PostInputArea extends StatelessWidget {
  const PostInputArea({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FeedController>();

    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colors.outline.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          /// -------- INPUT ROW --------
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomNetworkImage(
                imageUrl: "https://i.pravatar.cc/150?u=99",
                height: 40,
                width: 40,
                borderRadius: 100,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: controller.postContentController,
                  maxLines: null,
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: colors.onSurface),
                  decoration: InputDecoration(
                    hintText: 'feed.whatsHappening'.tr,                    hintStyle: theme.textTheme.bodyMedium
                        ?.copyWith(color: colors.onSurfaceVariant),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// -------- ACTION ROW --------
          Row(
            children: [
              Icon(Icons.image_outlined,
                  color: colors.onSurfaceVariant),
              const SizedBox(width: 15),
              Icon(Icons.gif_box_outlined,
                  color: colors.onSurfaceVariant),
              const SizedBox(width: 15),
              Icon(Icons.emoji_emotions_outlined,
                  color: colors.onSurfaceVariant),
              const Spacer(),
              CustomButton(
                text: 'feed.createPost'.tr,                fontSize: 11,
                height: 35,
                width: 150,
                foregroundColor: colors.onPrimary,
                backgroundColor: colors.primary,
                onPressed: () {
                  Get.to(const CreatePostScreen());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
