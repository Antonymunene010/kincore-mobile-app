// class PostModel {
//   int id;
//   String name;
//   String username;
//   String profilePic;
//   String content;
//   String? postImage;
//   int likes;
//   int commentsCount;
//   bool isLiked;
//   List<String> comments;
//   bool isCommentVisible;
//
//   PostModel({
//     required this.id,
//     required this.name,
//     required this.username,
//     required this.profilePic,
//     required this.content,
//     this.postImage,
//     required this.likes,
//     required this.commentsCount,
//     this.isLiked = false,
//     required this.comments,
//     this.isCommentVisible = false,
//   });
// }

class PostModel {
  final int id;
  final String name;
  final String username;
  final String profilePic;
  final String content;
  final String? postImage;
  int likes;
  int commentsCount;
  List<dynamic> comments; // List<String> ko List<dynamic> kiya
  bool isLiked;
  bool isCommentVisible;

  PostModel({
    required this.id,
    required this.name,
    required this.username,
    required this.profilePic,
    required this.content,
    this.postImage,
    required this.likes,
    required this.commentsCount,
    required this.comments,
    this.isLiked = false,
    this.isCommentVisible = false,
  });
}