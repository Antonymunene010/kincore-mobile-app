import 'dart:async';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';

class DrawController extends GetxController {
  var isLoading = true.obs;

  // Fortune Wheel ke liye stream
  StreamController<int> selected = StreamController<int>.broadcast();

  // API se aane wali profile list
  var profileList = <String>[].obs;
  var isSpinning = false.obs;

  @override
  void onInit() {
    fetchDrawMembers();
    super.onInit();
  }

  void fetchDrawMembers() async {
    try {
      isLoading(true);
      await Future.delayed(const Duration(seconds: 1)); // API Simulation

      // Image jaisi dummy profiles (Yahan teri real API aayegi)
      profileList.assignAll([
        "https://i.pravatar.cc/150?u=1",
        "https://i.pravatar.cc/150?u=2",
        "https://i.pravatar.cc/150?u=3",
        "https://i.pravatar.cc/150?u=4",
        "https://i.pravatar.cc/150?u=5",
        "https://i.pravatar.cc/150?u=6",
        "https://i.pravatar.cc/150?u=7",
        "https://i.pravatar.cc/150?u=8",
      ]);
    } finally {
      isLoading(false);
    }
  }

  void spinWheel() {
    if (!isSpinning.value) {
      isSpinning.value = true;
      // Random index select karna
      int winnerIndex = Fortune.randomInt(0, profileList.length);
      selected.add(winnerIndex);

      // 4 second baad result dikhana (as per your request)
      Future.delayed(const Duration(seconds: 4), () {
        isSpinning.value = false;
        Get.snackbar(
          "Winner Found!",
          "Draw lag gaya hai!",
          snackPosition: SnackPosition.BOTTOM,
        );
      });
    }
  }

  @override
  void onClose() {
    selected.close();
    super.onClose();
  }
}