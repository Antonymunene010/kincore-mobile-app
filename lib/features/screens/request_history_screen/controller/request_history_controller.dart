import 'package:get/get.dart';

class RequestHistoryController extends GetxController {
  var selectedTab = "All".obs;
  // Index track karne ke liye ki kaunsa card open hai
  var expandedIndex = (-1).obs;

  void selectTab(String tab) {
    selectedTab.value = tab;
  }

  void toggleExpansion(int index) {
    if (expandedIndex.value == index) {
      expandedIndex.value = -1; // Close if already open
    } else {
      expandedIndex.value = index; // Open new
    }
  }
}