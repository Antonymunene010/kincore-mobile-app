import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePostController extends GetxController {
  final postController = TextEditingController();

  // API se aane wala data (Placeholders)
  var userProfilePic = "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?q=80&w=1887&auto=format&fit=crop".obs;
  var userName = "John Doe".obs;

  // Media list (Images)
  var selectedMedia = <String>[].obs;

  // --- Tagging & Selection Logic ---
  var members = [
    {"id": "1", "name": "Mary Rigby", "img": "https://i.pravatar.cc/150?u=10"},
    {"id": "2", "name": "John Rigby", "img": "https://i.pravatar.cc/150?u=11"},
    {"id": "3", "name": "Emily", "img": "https://i.pravatar.cc/150?u=12"},
    {"id": "4", "name": "Paul", "img": "https://i.pravatar.cc/150?u=13"},
  ].obs;

  var taggedPersons = <Map<String, String>>[].obs;
  var isMemberSelectorVisible = false.obs;

  // --- NEW: Post Settings Logic (For PostSettingScreen) ---
  // Default values set ki hain jaisa image mein tha
  var visibility = "any".obs;      // Options: 'any', 'followers', 'me'
  var commentPrivacy = "any".obs;  // Options: 'any', 'followers', 'nobody'

  // Location logic
  var selectedLocation = "Select Location".obs;

  // --- Functions ---

  // Tag person toggle
  void toggleTag(Map<String, String> member) {
    if (taggedPersons.any((element) => element['id'] == member['id'])) {
      taggedPersons.removeWhere((element) => element['id'] == member['id']);
    } else {
      taggedPersons.add(member);
    }
    taggedPersons.refresh(); // UI update trigger
  }

  void removeTag(String id) {
    taggedPersons.removeWhere((element) => element['id'] == id);
  }

  void addMedia() {
    selectedMedia.add("https://images.unsplash.com/photo-1469474968028-56623f02e42e");
  }

  void removeMedia(int index) {
    selectedMedia.removeAt(index);
  }

  void updateLocation(String location) {
    selectedLocation.value = location;
  }

  // Final Submit Logic
  void submitPost() {
    if (postController.text.isNotEmpty) {
      // API Payload simulation
      print("--- Final Post Data ---");
      print("Content: ${postController.text}");
      print("Tagged: ${taggedPersons.length} people");
      print("Media: ${selectedMedia.length} items");
      print("Visibility: ${visibility.value}");
      print("Comment Privacy: ${commentPrivacy.value}");

      Get.back();
      Get.snackbar(
          "Success",
          "Post created successfully!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white
      );
    } else {
      Get.snackbar(
          "Error",
          "Please write something before posting",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white
      );
    }
  }

  @override
  void onClose() {
    postController.dispose();
    super.onClose();
  }
}