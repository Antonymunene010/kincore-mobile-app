// // // import 'package:flutter/material.dart';
// // // import 'package:get/get.dart';
// // // import '../../../../core/models/post_model.dart';
// // //
// // // class FeedController extends GetxController {
// // //   var posts = <PostModel>[].obs;
// // //   final commentController = TextEditingController();
// // //
// // //   @override
// // //   void onInit() {
// // //     super.onInit();
// // //     loadDummyData();
// // //   }
// // //
// // //   void loadDummyData() {
// // //     posts.assignAll([
// // //       PostModel(
// // //         id: 1,
// // //         name: "Sam Guy",
// // //         username: "@samguy",
// // //         profilePic: "https://i.pravatar.cc/150?u=1",
// // //         content: "On a first-time visit to New Orleans, there's so much to see and do.",
// // //         likes: 110,
// // //         commentsCount: 32,
// // //         comments: ["Amazing view!", "Wish I was there!"],
// // //       ),
// // //       PostModel(
// // //         id: 2,
// // //         name: "Sam Guy",
// // //         username: "@samguy",
// // //         profilePic: "https://i.pravatar.cc/150?u=2",
// // //         content: "Travel and you will born for a second time",
// // //         postImage: "https://images.unsplash.com/photo-1469474968028-56623f02e42e",
// // //         likes: 110,
// // //         commentsCount: 32,
// // //         comments: ["Beautiful photography", "Which camera?"],
// // //       ),
// // //     ]);
// // //   }
// // //
// // //   void toggleLike(int index) {
// // //     var post = posts[index];
// // //     if (post.isLiked) {
// // //       post.likes--;
// // //     } else {
// // //       post.likes++;
// // //     }
// // //     post.isLiked = !post.isLiked;
// // //     posts[index] = post;
// // //   }
// // //
// // //   void toggleComments(int index) {
// // //     posts[index].isCommentVisible = !posts[index].isCommentVisible;
// // //     posts.refresh();
// // //   }
// // //
// // //   void addComment(int index) {
// // //     if (commentController.text.isNotEmpty) {
// // //       posts[index].comments.add(commentController.text);
// // //       posts[index].commentsCount++;
// // //       commentController.clear();
// // //       posts.refresh();
// // //     }
// // //   }
// // // }
// //
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import '../../../../core/models/post_model.dart';
// //
// // class FeedController extends GetxController {
// //   var posts = <PostModel>[].obs;
// //
// //   // Controllers for TextFields
// //   final commentController = TextEditingController();
// //   final postContentController = TextEditingController();
// //
// //   @override
// //   void onInit() {
// //     super.onInit();
// //     loadDummyData();
// //   }
// //
// //   // Nayi Post Add karne ka Logic
// //   void addPost() {
// //     if (postContentController.text.trim().isNotEmpty) {
// //       final newPost = PostModel(
// //         id: DateTime.now().millisecondsSinceEpoch,
// //         name: "Sample", // [2025-06-08] ke hisab se user ka naam
// //         username: "@sample",
// //         profilePic: "https://i.pravatar.cc/150?u=99",
// //         content: postContentController.text,
// //         likes: 0,
// //         commentsCount: 0,
// //         comments: [],
// //         isLiked: false,
// //         isCommentVisible: false,
// //       );
// //
// //       posts.insert(0, newPost); // List ke top par add hogi
// //       postContentController.clear(); // Input saaf karne ke liye
// //
// //       Get.snackbar("Post Published", "Your family feed is updated!",
// //           snackPosition: SnackPosition.BOTTOM,
// //           backgroundColor: Colors.green,
// //           colorText: Colors.white);
// //     }
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
// //         comments: ["Beautiful photography"],
// //       ),
// //     ]);
// //   }
// //
// //   void toggleLike(int index) {
// //     posts[index].isLiked = !posts[index].isLiked;
// //     if (posts[index].isLiked) {
// //       posts[index].likes++;
// //     } else {
// //       posts[index].likes--;
// //     }
// //     posts.refresh();
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
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import '../../../../core/models/post_model.dart';
// //
// // class FeedController extends GetxController {
// //   var posts = <PostModel>[].obs;
// //
// //   // FIXED: Har post ke liye alag text store karne ke liye Map
// //   var commentTexts = <int, String>{}.obs;
// //   final postContentController = TextEditingController();
// //
// //   @override
// //   void onInit() {
// //     super.onInit();
// //     loadDummyData();
// //   }
// //
// //   void addPost() {
// //     if (postContentController.text.trim().isNotEmpty) {
// //       final newPost = PostModel(
// //         id: DateTime.now().millisecondsSinceEpoch,
// //         name: "user name",
// //         username: "@user_name",
// //         profilePic: "https://i.pravatar.cc/150?u=99",
// //         content: postContentController.text,
// //         likes: 0,
// //         commentsCount: 0,
// //         comments: [],
// //         isLiked: false,
// //         isCommentVisible: false,
// //       );
// //       posts.insert(0, newPost);
// //       postContentController.clear();
// //       posts.refresh();
// //     }
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
// //         commentsCount: 2,
// //         comments: [
// //           {"text": "Amazing view!", "image": "https://i.pravatar.cc/150?u=10"},
// //           {"text": "Wish I was there!", "image": "https://i.pravatar.cc/150?u=11"},
// //         ],
// //       ),
// //       PostModel(
// //         id: 2,
// //         name: "Sam Guy",
// //         username: "@samguy",
// //         profilePic: "https://i.pravatar.cc/150?u=2",
// //         content: "Travel and you will born for a second time",
// //         postImage: "https://images.unsplash.com/photo-1469474968028-56623f02e42e",
// //         likes: 110,
// //         commentsCount: 1,
// //         comments: [
// //           {"text": "Beautiful photography", "image": "https://i.pravatar.cc/150?u=12"},
// //         ],
// //       ),
// //     ]);
// //   }
// //
// //   void toggleLike(int index) {
// //     posts[index].isLiked = !posts[index].isLiked;
// //     posts[index].isLiked ? posts[index].likes++ : posts[index].likes--;
// //     posts.refresh();
// //   }
// //
// //   void toggleComments(int index) {
// //     posts[index].isCommentVisible = !posts[index].isCommentVisible;
// //     posts.refresh();
// //   }
// //
// //   // FIXED: Comment Add Logic
// //   void addComment(int index) {
// //     String? text = commentTexts[index];
// //     if (text != null && text.trim().isNotEmpty) {
// //       var newComment = {
// //         "text": text.trim(),
// //         "image": "https://i.pravatar.cc/150?u=99",
// //       };
// //
// //       posts[index].comments.add(newComment);
// //       posts[index].commentsCount++;
// //
// //       // Clear specific post's input
// //       commentTexts[index] = "";
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
//   var members = <Map<String, String>>[].obs;
//   var commentTexts = <int, String>{}.obs;
//   var isLoading = false.obs;
//
//   // FIX: Yeh getter define kiya hai jo error de raha tha
//   final TextEditingController postContentController = TextEditingController();
//
//   @override
//   void onInit() {
//     super.onInit();
//     loadData();
//   }
//
//   void loadData() {
//     isLoading.value = true;
//     // Stories ke liye dummy members
//     members.assignAll([
//       {"name": "John", "image": "https://i.pravatar.cc/150?u=j1"},
//       {"name": "Lina", "image": "https://i.pravatar.cc/150?u=l1"},
//       {"name": "Janny", "image": "https://i.pravatar.cc/150?u=j2"},
//       {"name": "Sura", "image": "https://i.pravatar.cc/150?u=s1"},
//     ]);
//
//     // Dummy Posts loading
//     posts.assignAll([
//       PostModel(
//         id: 1,
//         name: "Sam Guy",
//         username: "@samguy",
//         profilePic: "https://i.pravatar.cc/150?u=1",
//         content: "On a first-time visit to New Orleans, there's so much to see and do.",
//         likes: 110,
//         commentsCount: 2,
//         isLiked: false,
//         isCommentVisible: false,
//         comments: [
//           {"text": "Amazing view!", "image": "https://i.pravatar.cc/150?u=10"},
//         ],
//       ),
//       PostModel(
//         id: 2,
//         name: "Sam Guy",
//         username: "@samguy",
//         profilePic: "https://i.pravatar.cc/150?u=2",
//         content: "Travel and you will born for a second time",
//         postImage: "https://images.unsplash.com/photo-1469474968028-56623f02e42e",
//         likes: 110,
//         commentsCount: 1,
//         isLiked: false,
//         isCommentVisible: false,
//         comments: [
//           {"text": "Beautiful photography", "image": "https://i.pravatar.cc/150?u=12"},
//         ],
//       ),
//     ]);
//     isLoading.value = false;
//   }
//
//   // FIX: Yeh method define kiya hai jo PostCard mein error de raha tha
//   void toggleComments(int index) {
//     posts[index].isCommentVisible = !posts[index].isCommentVisible;
//     posts.refresh();
//   }
//
//   void toggleLike(int index) {
//     posts[index].isLiked = !posts[index].isLiked;
//     posts[index].isLiked ? posts[index].likes++ : posts[index].likes--;
//     posts.refresh();
//   }
//
//   void addComment(int index) {
//     String? text = commentTexts[index];
//     if (text != null && text.trim().isNotEmpty) {
//       posts[index].comments.add({
//         "text": text.trim(),
//         "image": "https://i.pravatar.cc/150?u=me",
//       });
//       posts[index].commentsCount++;
//       commentTexts[index] = "";
//       posts.refresh();
//     }
//   }
//
//   void addPost() {
//     if (postContentController.text.trim().isNotEmpty) {
//       final newPost = PostModel(
//         id: DateTime.now().millisecondsSinceEpoch,
//         name: "Vishal Desai", // [2025-06-08] ke hisab se login name
//         username: "@vishal_desai",
//         profilePic: "https://i.pravatar.cc/150?u=99",
//         content: postContentController.text,
//         likes: 0,
//         commentsCount: 0,
//         comments: [],
//         isLiked: false,
//         isCommentVisible: false,
//       );
//       posts.insert(0, newPost);
//       postContentController.clear();
//       posts.refresh();
//     }
//   }
//
//   @override
//   void onClose() {
//     postContentController.dispose();
//     super.onClose();
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../core/models/post_model.dart';
//
// class FeedController extends GetxController {
//   var posts = <PostModel>[].obs;
//   var members = <Map<String, String>>[].obs;
//   var commentTexts = <int, String>{}.obs;
//   var isLoading = false.obs;
//
//   final TextEditingController postContentController = TextEditingController();
//
//   @override
//   void onInit() {
//     super.onInit();
//     loadData();
//   }
//
//   void loadData() {
//     isLoading.value = true;
//
//     // Stories ke liye dummy members
//     members.assignAll([
//       {"name": "John", "image": "https://i.pravatar.cc/150?u=j1"},
//       {"name": "Lina", "image": "https://i.pravatar.cc/150?u=l1"},
//       {"name": "Janny", "image": "https://i.pravatar.cc/150?u=j2"},
//       {"name": "Sura", "image": "https://i.pravatar.cc/150?u=s1"},
//       {"name": "Mike", "image": "https://i.pravatar.cc/150?u=m1"},
//     ]);
//
//     // Dummy Posts loading (5 Posts for Web/Mobile Testing)
//     posts.assignAll([
//       PostModel(
//         id: 1,
//         name: "Sam Guy",
//         username: "@samguy",
//         profilePic: "https://i.pravatar.cc/150?u=1",
//         content: "On a first-time visit to New Orleans, there's so much to see and do.",
//         likes: 110,
//         commentsCount: 2,
//         isLiked: false,
//         isCommentVisible: false,
//         comments: [
//           {"text": "Amazing view!", "image": "https://i.pravatar.cc/150?u=10"},
//         ],
//       ),
//       PostModel(
//         id: 2,
//         name: "Lina S.",
//         username: "@lina_s",
//         profilePic: "https://i.pravatar.cc/150?u=2",
//         content: "Travel and you will born for a second time. Nature is calling! 🌲",
//         postImage: "https://images.unsplash.com/photo-1469474968028-56623f02e42e",
//         likes: 245,
//         commentsCount: 5,
//         isLiked: true,
//         isCommentVisible: false,
//         comments: [
//           {"text": "Beautiful photography", "image": "https://i.pravatar.cc/150?u=12"},
//         ],
//       ),
//       PostModel(
//         id: 3,
//         name: "Janny",
//         username: "@janny_v",
//         profilePic: "https://i.pravatar.cc/150?u=j2",
//         content: "Family dinner was amazing last night! Can't wait for the next trip.",
//         postImage: "https://images.unsplash.com/photo-1517048676732-d65bc937f952",
//         likes: 89,
//         commentsCount: 1,
//         isLiked: false,
//         isCommentVisible: false,
//         comments: [
//           {"text": "Missing those days!", "image": "https://i.pravatar.cc/150?u=15"},
//         ],
//       ),
//       PostModel(
//         id: 4,
//         name: "Sura",
//         username: "@sura_official",
//         profilePic: "https://i.pravatar.cc/150?u=s1",
//         content: "Sometimes all you need is a little sunshine and a good book. 📖✨",
//         likes: 312,
//         commentsCount: 12,
//         isLiked: false,
//         isCommentVisible: false,
//         comments: [],
//       ),
//       PostModel(
//         id: 5,
//         name: "Mike Ross",
//         username: "@mike_r",
//         profilePic: "https://i.pravatar.cc/150?u=m1",
//         content: "The city looks so peaceful from here. #Skyline #Peace",
//         postImage: "https://images.unsplash.com/photo-1449824913935-59a10b8d2000",
//         likes: 156,
//         commentsCount: 8,
//         isLiked: false,
//         isCommentVisible: false,
//         comments: [],
//       ),
//     ]);
//     isLoading.value = false;
//   }
//
//   void toggleComments(int index) {
//     posts[index].isCommentVisible = !posts[index].isCommentVisible;
//     posts.refresh();
//   }
//
//   void toggleLike(int index) {
//     posts[index].isLiked = !posts[index].isLiked;
//     posts[index].isLiked ? posts[index].likes++ : posts[index].likes--;
//     posts.refresh();
//   }
//
//   void addComment(int index) {
//     String? text = commentTexts[index];
//     if (text != null && text.trim().isNotEmpty) {
//       posts[index].comments.add({
//         "text": text.trim(),
//         "image": "https://i.pravatar.cc/150?u=me",
//       });
//       posts[index].commentsCount++;
//       commentTexts[index] = "";
//       posts.refresh();
//     }
//   }
//
//   void addPost() {
//     if (postContentController.text.trim().isNotEmpty) {
//       final newPost = PostModel(
//         id: DateTime.now().millisecondsSinceEpoch,
//         name: "Vishal Desai",
//         username: "@vishal_desai",
//         profilePic: "https://i.pravatar.cc/150?u=99",
//         content: postContentController.text,
//         likes: 0,
//         commentsCount: 0,
//         comments: [],
//         isLiked: false,
//         isCommentVisible: false,
//       );
//       posts.insert(0, newPost);
//       postContentController.clear();
//       posts.refresh();
//
//       Get.snackbar(
//         "Success",
//         "Post added successfully!",
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.green.withOpacity(0.8),
//         colorText: Colors.white,
//       );
//     }
//   }
//
//   @override
//   void onClose() {
//     postContentController.dispose();
//     super.onClose();
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/models/post_model.dart';

class FeedController extends GetxController {
  var posts = <PostModel>[].obs;

  // [NEW] Saved Posts List (Feed Collection)
  var savedPosts = <PostModel>[].obs;

  var members = <Map<String, String>>[].obs;
  var commentTexts = <int, String>{}.obs;
  var isLoading = false.obs;

  final TextEditingController postContentController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() {
    isLoading.value = true;

    // Stories Dummy Data
    members.assignAll([
      {"name": "John", "image": "https://i.pravatar.cc/150?u=j1"},
      {"name": "Lina", "image": "https://i.pravatar.cc/150?u=l1"},
      {"name": "Janny", "image": "https://i.pravatar.cc/150?u=j2"},
      {"name": "Sura", "image": "https://i.pravatar.cc/150?u=s1"},
      {"name": "Mike", "image": "https://i.pravatar.cc/150?u=m1"},
    ]);

    // Posts Dummy Data
    posts.assignAll([
      PostModel(
        id: 1,
        name: "Sam Guy",
        username: "@samguy",
        profilePic: "https://i.pravatar.cc/150?u=1",
        content: "On a first-time visit to New Orleans, there's so much to see and do.",
        likes: 110,
        commentsCount: 2,
        isLiked: false,
        isCommentVisible: false,
        comments: [{"text": "Amazing view!", "image": "https://i.pravatar.cc/150?u=10"}],
      ),
      PostModel(
        id: 2,
        name: "Lina S.",
        username: "@lina_s",
        profilePic: "https://i.pravatar.cc/150?u=2",
        content: "Travel and you will born for a second time. Nature is calling! 🌲",
        postImage: "https://images.unsplash.com/photo-1469474968028-56623f02e42e",
        likes: 245,
        commentsCount: 5,
        isLiked: true,
        isCommentVisible: false,
        comments: [{"text": "Beautiful photography", "image": "https://i.pravatar.cc/150?u=12"}],
      ),
      PostModel(
        id: 3,
        name: "Janny",
        username: "@janny_v",
        profilePic: "https://i.pravatar.cc/150?u=j2",
        content: "Family dinner was amazing last night! Can't wait for the next trip.",
        postImage: "https://images.unsplash.com/photo-1517048676732-d65bc937f952",
        likes: 89,
        commentsCount: 1,
        isLiked: false,
        isCommentVisible: false,
        comments: [{"text": "Missing those days!", "image": "https://i.pravatar.cc/150?u=15"}],
      ),
    ]);
    isLoading.value = false;
  }

  // [NEW] Logic: Check if post is saved
  bool isSaved(PostModel post) {
    return savedPosts.contains(post);
  }

  // [NEW] Logic: Toggle Save (Add/Remove from Collection)
  void toggleSave(PostModel post) {
    if (isSaved(post)) {
      savedPosts.remove(post);
      // Localized Remove Snackbar
      Get.snackbar(
        'feed.removedTitle'.tr,
        'feed.removedMsg'.tr,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 1),
      );
    } else {
      savedPosts.add(post);
      // Localized Save Snackbar
      Get.snackbar(
        'feed.savedTitle'.tr,
        'feed.savedMsg'.tr,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 1),
      );
    }
    // UI update force karne ke liye (agar Obx immediate detect na kare)
    posts.refresh();
  }

  void toggleComments(int index) {
    posts[index].isCommentVisible = !posts[index].isCommentVisible;
    posts.refresh();
  }

  void toggleLike(int index) {
    posts[index].isLiked = !posts[index].isLiked;
    posts[index].isLiked ? posts[index].likes++ : posts[index].likes--;
    posts.refresh();
  }

  void addComment(int index) {
    String? text = commentTexts[index];
    if (text != null && text.trim().isNotEmpty) {
      posts[index].comments.add({
        "text": text.trim(),
        "image": "https://i.pravatar.cc/150?u=me",
      });
      posts[index].commentsCount++;
      commentTexts[index] = "";
      posts.refresh();
    }
  }

  void addPost() {
    if (postContentController.text.trim().isNotEmpty) {
      final newPost = PostModel(
        id: DateTime.now().millisecondsSinceEpoch,
        name: "Vishal Desai",
        username: "@vishal_desai",
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

  @override
  void onClose() {
    postContentController.dispose();
    super.onClose();
  }
}