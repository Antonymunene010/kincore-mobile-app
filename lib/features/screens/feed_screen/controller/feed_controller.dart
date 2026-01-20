// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import '../../../../core/models/post_model.dart';
// //
// // class FeedController extends GetxController {
// //   var posts = <PostModel>[].obs;
// //   final commentController = TextEditingController();
// //
// //   @override
// //   void onInit() {
// //     super.onInit();
// //     loadDummyData();
// //   }
// //
// //   void loadDummyData() {
// //     posts.assignAll([
// //       PostModel(
// //         id: 1,
// //         name: "Sam Guy",
// //         username: "@samguy",
// //         profilePic: "https://i.pravatar.cc/150?u=1",
// //         content: "On a first-time visit to New Orleans, there's so much to see and do.",
// //         likes: 110,
// //         commentsCount: 32,
// //         comments: ["Amazing view!", "Wish I was there!"],
// //       ),
// //       PostModel(
// //         id: 2,
// //         name: "Sam Guy",
// //         username: "@samguy",
// //         profilePic: "https://i.pravatar.cc/150?u=2",
// //         content: "Travel and you will born for a second time",
// //         postImage: "https://images.unsplash.com/photo-1469474968028-56623f02e42e",
// //         likes: 110,
// //         commentsCount: 32,
// //         comments: ["Beautiful photography", "Which camera?"],
// //       ),
// //     ]);
// //   }
// //
// //   void toggleLike(int index) {
// //     var post = posts[index];
// //     if (post.isLiked) {
// //       post.likes--;
// //     } else {
// //       post.likes++;
// //     }
// //     post.isLiked = !post.isLiked;
// //     posts[index] = post;
// //   }
// //
// //   void toggleComments(int index) {
// //     posts[index].isCommentVisible = !posts[index].isCommentVisible;
// //     posts.refresh();
// //   }
// //
// //   void addComment(int index) {
// //     if (commentController.text.isNotEmpty) {
// //       posts[index].comments.add(commentController.text);
// //       posts[index].commentsCount++;
// //       commentController.clear();
// //       posts.refresh();
// //     }
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../core/models/post_model.dart';
//
// class FeedController extends GetxController {
//   var posts = <PostModel>[].obs;
//
//   // Controllers for TextFields
//   final commentController = TextEditingController();
//   final postContentController = TextEditingController();
//
//   @override
//   void onInit() {
//     super.onInit();
//     loadDummyData();
//   }
//
//   // Nayi Post Add karne ka Logic
//   void addPost() {
//     if (postContentController.text.trim().isNotEmpty) {
//       final newPost = PostModel(
//         id: DateTime.now().millisecondsSinceEpoch,
//         name: "Sample", // [2025-06-08] ke hisab se user ka naam
//         username: "@sample",
//         profilePic: "https://i.pravatar.cc/150?u=99",
//         content: postContentController.text,
//         likes: 0,
//         commentsCount: 0,
//         comments: [],
//         isLiked: false,
//         isCommentVisible: false,
//       );
//
//       posts.insert(0, newPost); // List ke top par add hogi
//       postContentController.clear(); // Input saaf karne ke liye
//
//       Get.snackbar("Post Published", "Your family feed is updated!",
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.green,
//           colorText: Colors.white);
//     }
//   }
//
//   void loadDummyData() {
//     posts.assignAll([
//       PostModel(
//         id: 1,
//         name: "Sam Guy",
//         username: "@samguy",
//         profilePic: "https://i.pravatar.cc/150?u=1",
//         content: "On a first-time visit to New Orleans, there's so much to see and do.",
//         likes: 110,
//         commentsCount: 32,
//         comments: ["Amazing view!", "Wish I was there!"],
//       ),
//       PostModel(
//         id: 2,
//         name: "Sam Guy",
//         username: "@samguy",
//         profilePic: "https://i.pravatar.cc/150?u=2",
//         content: "Travel and you will born for a second time",
//         postImage: "https://images.unsplash.com/photo-1469474968028-56623f02e42e",
//         likes: 110,
//         commentsCount: 32,
//         comments: ["Beautiful photography"],
//       ),
//     ]);
//   }
//
//   void toggleLike(int index) {
//     posts[index].isLiked = !posts[index].isLiked;
//     if (posts[index].isLiked) {
//       posts[index].likes++;
//     } else {
//       posts[index].likes--;
//     }
//     posts.refresh();
//   }
//
//   void toggleComments(int index) {
//     posts[index].isCommentVisible = !posts[index].isCommentVisible;
//     posts.refresh();
//   }
//
//   void addComment(int index) {
//     if (commentController.text.isNotEmpty) {
//       posts[index].comments.add(commentController.text);
//       posts[index].commentsCount++;
//       commentController.clear();
//       posts.refresh();
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/models/post_model.dart';

class FeedController extends GetxController {
  var posts = <PostModel>[].obs;

  // FIXED: Har post ke liye alag text store karne ke liye Map
  var commentTexts = <int, String>{}.obs;
  final postContentController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    loadDummyData();
  }

  void addPost() {
    if (postContentController.text.trim().isNotEmpty) {
      final newPost = PostModel(
        id: DateTime.now().millisecondsSinceEpoch,
        name: "user name",
        username: "@user_name",
        profilePic: "https://i.pravatar.cc/150?u=99",
        content: postContentController.text,
        likes: 0,
        commentsCount: 0,
        comments: [],
        isLiked: false,
        isCommentVisible: false,
      );
      posts.insert(0, newPost);
      postContentController.clear();
      posts.refresh();
    }
  }

  void loadDummyData() {
    posts.assignAll([
      PostModel(
        id: 1,
        name: "Sam Guy",
        username: "@samguy",
        profilePic: "https://i.pravatar.cc/150?u=1",
        content: "On a first-time visit to New Orleans, there's so much to see and do.",
        likes: 110,
        commentsCount: 2,
        comments: [
          {"text": "Amazing view!", "image": "https://i.pravatar.cc/150?u=10"},
          {"text": "Wish I was there!", "image": "https://i.pravatar.cc/150?u=11"},
        ],
      ),
      PostModel(
        id: 2,
        name: "Sam Guy",
        username: "@samguy",
        profilePic: "https://i.pravatar.cc/150?u=2",
        content: "Travel and you will born for a second time",
        postImage: "https://images.unsplash.com/photo-1469474968028-56623f02e42e",
        likes: 110,
        commentsCount: 1,
        comments: [
          {"text": "Beautiful photography", "image": "https://i.pravatar.cc/150?u=12"},
        ],
      ),
    ]);
  }

  void toggleLike(int index) {
    posts[index].isLiked = !posts[index].isLiked;
    posts[index].isLiked ? posts[index].likes++ : posts[index].likes--;
    posts.refresh();
  }

  void toggleComments(int index) {
    posts[index].isCommentVisible = !posts[index].isCommentVisible;
    posts.refresh();
  }

  // FIXED: Comment Add Logic
  void addComment(int index) {
    String? text = commentTexts[index];
    if (text != null && text.trim().isNotEmpty) {
      var newComment = {
        "text": text.trim(),
        "image": "https://i.pravatar.cc/150?u=99",
      };

      posts[index].comments.add(newComment);
      posts[index].commentsCount++;

      // Clear specific post's input
      commentTexts[index] = "";
      posts.refresh();
    }
  }
}