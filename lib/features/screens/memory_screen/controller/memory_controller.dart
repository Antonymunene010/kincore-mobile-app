import 'package:get/get.dart';
import '../../../../core/models/memory_model.dart';

class MemoryController extends GetxController {
  // Tab Selection logic
  var selectedTab = "All".obs;

  // Reactive Lists
  var photos = <MemoryModel>[].obs;
  var videos = <MemoryModel>[].obs;
  var allMemories = <MemoryModel>[].obs; // Dono ka combination
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMemories();
  }

  void fetchMemories() {
    isLoading.value = true;

    // API simulation logic
    Future.delayed(const Duration(seconds: 1), () {
      // 1. Load Dummy Photos
      var dummyPhotos = List.generate(6, (index) => MemoryModel(
        id: "p$index",
        url: "https://picsum.photos/400/400?random=$index",
        type: MemoryType.photo,
      ));

      // 2. Load Dummy Videos
      var dummyVideos = List.generate(6, (index) => MemoryModel(
        id: "v$index",
        url: "https://picsum.photos/400/400?random=${index + 50}", // Thumbnail URL
        type: MemoryType.video,
        thumbnail: "https://picsum.photos/400/400?random=${index + 50}",
      ));

      // 3. Assign to reactive lists
      photos.assignAll(dummyPhotos);
      videos.assignAll(dummyVideos);

      // 4. Combine for "All" Tab
      allMemories.assignAll([...dummyPhotos, ...dummyVideos]);

      isLoading.value = false;
    });
  }

  void changeTab(String tab) => selectedTab.value = tab;
}