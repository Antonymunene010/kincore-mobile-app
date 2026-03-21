import 'package:get/get.dart';

class ReelsController extends GetxController {
  var isLoading = true.obs;
  var reels = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchReels();
  }

  void fetchReels() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));

    // [UPDATED]: Aapki di hui 4 working video links yahan add kar di hain
    reels.assignAll([
      {
        'id': 'v1',
        'videoUrl': 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        'user': 'Sarah Connor',
        'userPic': 'https://i.pravatar.cc/150?u=sarah',
        'likes': 12400,
        'isLiked': false,
        'comments': '342',
        'description': 'Enjoying the beautiful nature! 🐰 #nature #vibes',
        'audio': 'Original Audio - Sarah'
      },
      {
        'id': 'v2',
        'videoUrl': 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        'user': 'John Wick',
        'userPic': 'https://i.pravatar.cc/150?u=john',
        'likes': 890000,
        'isLiked': false,
        'comments': '12K',
        'description': 'Dreaming big! 🐘 #animation #art',
        'audio': 'Trending Track 01'
      },
    ]);
    isLoading.value = false;
  }

  void toggleLike(int index) {
    var reel = reels[index];
    bool currentStatus = reel['isLiked'];

    reel['isLiked'] = !currentStatus;
    reel['likes'] = currentStatus ? (reel['likes'] - 1) : (reel['likes'] + 1);

    reels[index] = reel;
  }

  String formatLikes(int count) {
    if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}K';
    }
    return count.toString();
  }
}