import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateEventController extends GetxController {
  // Existing Observables
  var selectedTab = "Cover Photo".obs;
  var isLoading = false.obs;

  // New Observables for Date and Time
  var startDateText = "".obs;
  var endDateText = "".obs;
  var timeText = "".obs;

  // Family Members List (API data)
  var familyMembers = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchFamilyMembers();
  }

  // --- DATE PICKER LOGIC ---
  Future<void> pickStartDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      startDateText.value = "${picked.month}/${picked.day}/${picked.year}";
    }
  }

  Future<void> pickEndDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      endDateText.value = "${picked.month}/${picked.day}/${picked.year}";
    }
  }

  // --- TIME PICKER LOGIC ---
  Future<void> pickTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      timeText.value = picked.format(context);
    }
  }

  void fetchFamilyMembers() async {
    try {
      isLoading(true);
      await Future.delayed(const Duration(milliseconds: 500));
      var dummyData = [
        {"name": "Mary Rigby", "image": "https://i.pravatar.cc/150?u=1"},
        {"name": "John Rigby", "image": "https://i.pravatar.cc/150?u=2"},
        {"name": "Emily", "image": "https://i.pravatar.cc/150?u=3"},
        {"name": "Paul", "image": "https://i.pravatar.cc/150?u=4"},
      ];
      familyMembers.assignAll(dummyData);
    } finally {
      isLoading(false);
    }
  }

  void pickFiles() {
    print("Picking files...");
  }
}