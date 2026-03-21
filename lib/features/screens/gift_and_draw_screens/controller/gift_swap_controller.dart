import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GiftSwapController extends GetxController {
  final yourNameController = TextEditingController();
  final friendNameController = TextEditingController();

  // List of pre-added friends (Jo chips mein dikh rahe hain)
  var friendsList = <String>["Liam", "Olivia", "Noah"].obs;

  void addFriend() {
    if (friendNameController.text.isNotEmpty) {
      friendsList.add(friendNameController.text);
      friendNameController.clear();
    }
  }

  void startDraw() {
    debugPrint("Drawing for: ${yourNameController.text}");
    debugPrint("Friends: $friendsList");
    Get.snackbar("Success", "Draw Started!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green, colorText: Colors.white);
  }

  @override
  void onClose() {
    yourNameController.dispose();
    friendNameController.dispose();
    super.onClose();
  }
}