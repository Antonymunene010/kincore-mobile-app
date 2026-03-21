import 'package:get/get.dart';
import '../../../../core/models/family_member_model.dart';
import 'package:flutter/material.dart'; // Upar check kar lena ki ye import ho

class ProfileController extends GetxController {
  // --- Naya Added Data (Header ke liye) ---
  var profileImageUrl = "https://picsum.photos/200/300".obs;
  var userName = "Arthur Pendragon".obs;
  var lifeSpan = "1920-1995".obs;
  var relationBadge = "GREAT AUNT".obs;
  // ProfileController ke andar add karein:
  var isPrivacyLocked = true.obs; // By default locked rahega

  // ProfileController ke andar:
  var userLevel = 3.obs; // Default 3, API se update hoga
  var levelTitle = 'Historian'.obs; // API se update hoga

  // --- Coin Balance for Wallet ---
  var coinBalance = "1,234".obs; // API se yahan value update hogi

  // --- Aapka Purana Data ---
  var familyMembers = <FamilyMember>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchFamilyMembers();
  }

  void fetchFamilyMembers() {
    var dummyData = [
      FamilyMember(name: "Mary Rigby", relation: "Mother", image: "assets/images/user_avatar.png"),
      FamilyMember(name: "John Doe", relation: "Father", image: "assets/images/user_avatar.png"),
      FamilyMember(name: "Sarah Parker", relation: "Sister", image: "assets/images/user_avatar.png"),
      FamilyMember(name: "Robert Fox", relation: "Brother", image: "assets/images/user_avatar.png"),
      FamilyMember(name: "Emily Blunt", relation: "Cousin", image: "assets/images/user_avatar.png"),
    ];
    familyMembers.assignAll(dummyData);
  }

  void updateProfile(String name, String life) {
    userName.value = name;
    lifeSpan.value = life;
  }

  void togglePrivacy() {
    isPrivacyLocked.value = !isPrivacyLocked.value;

    // Translation keys ko condition ke hisaab se use kiya
    String title = isPrivacyLocked.value
        ? 'profile.privacyLockedTitle'.tr
        : 'profile.privacyUnlockedTitle'.tr;

    String message = isPrivacyLocked.value
        ? 'profile.privacyLockedMsg'.tr
        : 'profile.privacyUnlockedMsg'.tr;

    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM, // Screen ke niche aayega
      duration: const Duration(milliseconds: 1500), // Exactly 1.5 seconds
      backgroundColor: isPrivacyLocked.value ? Colors.black87 : Colors.green.shade700,
      colorText: Colors.white,
      margin: const EdgeInsets.all(15),
      borderRadius: 10,
    );
  }
}