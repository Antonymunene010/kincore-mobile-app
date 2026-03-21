import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddFamilyMemberController extends GetxController {
  // Observables for state management
  var selectedGender = "Female".obs;
  var isAlive = true.obs;
  var hideSensitiveDetail = true.obs;
  var selectedRelationship = "Spouse".obs;
  var profileVisibility = "Family Only".obs;
  var profileImage = "https://i.pravatar.cc/150?u=family".obs;

  // Search Results & Selected Member
  var searchQuery = "".obs;
  var searchResults = <Map<String, String>>[].obs;
  var selectedMember = Rxn<Map<String, String>>();

  // Fake API Search Logic
  void searchMember(String query) {
    searchQuery.value = query;
    if (query.isNotEmpty) {
      // Mocking API call result
      searchResults.value = [
        {"name": "Arthur Harrison", "relation": "Existing Family Member", "image": "https://i.pravatar.cc/150?u=arthur"},
      ];
    } else {
      searchResults.clear();
    }
  }

  void selectMember(Map<String, String> member) {
    selectedMember.value = member;
    searchResults.clear();
  }

  void removeSelectedMember() {
    selectedMember.value = null;
  }

  Future<void> selectDate(BuildContext context, TextEditingController dateController) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      dateController.text = "${picked.month}/${picked.day}/${picked.year}";
    }
  }

  void saveFamilyMember() {
    print("Saving Family Member Data...");
    Get.back();
  }
}