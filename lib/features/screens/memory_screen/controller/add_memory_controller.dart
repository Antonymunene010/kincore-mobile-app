import 'package:get/get.dart';

class AddMemoryController extends GetxController {
  var selectedTab = "Photos".obs;
  var selectedFiles = <String>[].obs; // Files ke paths yahan store honge

  void changeTab(String tab) {
    selectedTab.value = tab;
    selectedFiles.clear(); // Tab change hone par purani selection clear
  }

  // Frontend picking logic
  void pickFiles() async {
    // Yahan backend ke waqt FilePicker use karenge
    // Abhi dummy paths add kar rahe hain view dikhane ke liye
    selectedFiles.addAll([
      "https://picsum.photos/200/200?random=1",
      "https://picsum.photos/200/200?random=2",
      "https://picsum.photos/200/200?random=3",
    ]);
  }

  void removeFile(int index) {
    selectedFiles.removeAt(index);
  }

  void saveMemory() {
    // Backend API calling logic yahan aayega
    Get.back();
    Get.snackbar("Success", "${selectedTab.value} saved successfully!");
  }
}