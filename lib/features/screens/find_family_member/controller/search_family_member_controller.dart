// import 'package:get/get.dart';
//
// import '../../../../core/models/family_member_model.dart';
// // Aapka model file import karein
//
// class FamilySearchController extends GetxController {
//   // Pure members ki list
//   var allMembers = <FamilyMember>[].obs;
//   // Filtered list
//   var foundMembers = <FamilyMember>[].obs;
//   // Last viewed list (Dummy data ke liye)
//   var lastViewed = <FamilyMember>[].obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     loadInitialData();
//   }
//
//   void loadInitialData() {
//     // API se data aane par yahan fill hoga
//     var data = [
//       FamilyMember(name: "Arthur Harrison", relation: "Father", image: "https://i.pravatar.cc/150?u=a1"),
//       FamilyMember(name: "Arthur Harrison", relation: "Brother", image: "https://i.pravatar.cc/150?u=a2"),
//       FamilyMember(name: "Billy William", relation: "Spouse", image: "https://i.pravatar.cc/150?u=b1"),
//     ];
//
//     allMembers.assignAll(data);
//     foundMembers.value = data;
//
//     // Last viewed dummy data
//     lastViewed.assignAll([
//       FamilyMember(name: "Billy William", relation: "Spouse", image: "https://i.pravatar.cc/150?u=b1"),
//     ]);
//   }
//
//   void filterMembers(String query) {
//     if (query.isEmpty) {
//       foundMembers.value = allMembers;
//     } else {
//       foundMembers.value = allMembers
//           .where((m) => m.name.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/models/family_member_model.dart'; // Aapka model import

class FamilySearchController extends GetxController {
  // ==========================================
  // 1. VARIABLES FOR "FIND YOURSELF" SCREEN
  // ==========================================
  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final dobCtrl = TextEditingController();

  final selectedGender = RxnString();
  final isYearOnly = false.obs;

  final hasSearched = false.obs;
  final selectedIndex = (-1).obs;

  // ==========================================
  // 2. VARIABLES FOR OTHER SCREENS (Global Lists)
  // ==========================================
  var allMembers = <FamilyMember>[].obs;
  var foundMembers = <FamilyMember>[].obs;
  var lastViewed = <FamilyMember>[].obs; // [FIXED]: Wapas add kar diya

  @override
  void onInit() {
    super.onInit();
    loadInitialData(); // [FIXED]: App start hote hi data load karega
  }

  @override
  void onClose() {
    firstNameCtrl.dispose();
    lastNameCtrl.dispose();
    dobCtrl.dispose();
    super.onClose();
  }

  // ==========================================
  // 3. COMMON LOGIC (Load Data & Simple Search)
  // ==========================================
  void loadInitialData() {
    // API se data aane par yahan fill hoga
    var data = [
      FamilyMember(name: "Arthur Harrison", relation: "Father", image: "https://i.pravatar.cc/150?u=a1"),
      FamilyMember(name: "Arthur Harrison", relation: "Brother", image: "https://i.pravatar.cc/150?u=a2"),
      FamilyMember(name: "Billy William", relation: "Spouse", image: "https://i.pravatar.cc/150?u=b1"),
    ];

    allMembers.assignAll(data);
    foundMembers.assignAll(data);

    // Last viewed dummy data
    lastViewed.assignAll([
      FamilyMember(name: "Billy William", relation: "Spouse", image: "https://i.pravatar.cc/150?u=b1"),
    ]);
  }

  // [FIXED]: Ye function wapas add kar diya migration map aur family list ke liye
  void filterMembers(String query) {
    if (query.isEmpty) {
      foundMembers.assignAll(allMembers);
    } else {
      foundMembers.assignAll(allMembers
          .where((m) => m.name.toLowerCase().contains(query.toLowerCase()))
          .toList());
    }
  }

  // ==========================================
  // 4. ADVANCED SEARCH LOGIC ("Find Yourself")
  // ==========================================

  Future<void> selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            // Current theme (light ya dark) ko copy karega, aur sirf primary color change karega
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: AppColors.orangeColor, // Calendar header aur selected date ka color
              onPrimary: Colors.white, // Selected date ke upar ka text color
            ),
            // Niche ke 'OK' aur 'Cancel' buttons ko bhi orange karne ke liye
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.orangeColor,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      dobCtrl.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
    }
  }

  void performSearch() {
    if (firstNameCtrl.text.isEmpty &&
        lastNameCtrl.text.isEmpty &&
        selectedGender.value == null &&
        dobCtrl.text.isEmpty) {
      Get.snackbar(
        'Error',
        'findYourself.validationMsg'.tr,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
      return;
    }

    hasSearched.value = true;
    selectedIndex.value = -1;

    // Advanced search dummy data logic
    String fullName = '${firstNameCtrl.text} ${lastNameCtrl.text}'.trim();
    if (fullName.isEmpty) fullName = "Demo User";

    var data = [
      FamilyMember(name: fullName, relation: "Self", image: "https://i.pravatar.cc/150?u=a1"),
      FamilyMember(name: "Billy William", relation: "Sibling", image: "https://i.pravatar.cc/150?u=b1"),
    ];

    foundMembers.assignAll(data);
  }

  void clearFilters() {
    firstNameCtrl.clear();
    lastNameCtrl.clear();
    dobCtrl.clear();
    selectedGender.value = null;
    isYearOnly.value = false;

    hasSearched.value = false;
    selectedIndex.value = -1;

    // Clear karne par wapas pura data dikha do
    foundMembers.assignAll(allMembers);
  }
}