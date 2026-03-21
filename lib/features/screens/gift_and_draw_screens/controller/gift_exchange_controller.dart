// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class GiftExchangeController extends GetxController {
//   // Input Controllers
//   final eventNameController = TextEditingController();
//   final festivalTypeController = TextEditingController();
//   final descriptionController = TextEditingController();
//   final scopeController = TextEditingController();
//   final giftTypeController = TextEditingController();
//
//   final signupDeadlineController = TextEditingController();
//   final drawDeadlineController = TextEditingController();
//   final giftDeadlineController = TextEditingController();
//
//   var budgetValue = 500.0.obs;
//   var isAnonymous = false.obs;
//
//   // Default Flutter Date Picker logic
//   Future<void> selectDate(BuildContext context, TextEditingController textController) async {
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2030),
//     );
//     if (picked != null) {
//       // By default jo yyyy-mm-dd aata hai wahi set kiya
//       textController.text = picked.toString().split(' ')[0];
//     }
//   }
//
//   void createEvent() {
//     debugPrint("Event Created: ${eventNameController.text}");
//     Get.snackbar("Success", "Event Created Successfully",
//         backgroundColor: Colors.green, colorText: Colors.white);
//   }
//
//   @override
//   void onClose() {
//     eventNameController.dispose();
//     festivalTypeController.dispose();
//     descriptionController.dispose();
//     scopeController.dispose();
//     giftTypeController.dispose();
//     signupDeadlineController.dispose();
//     drawDeadlineController.dispose();
//     giftDeadlineController.dispose();
//     super.onClose();
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GiftExchangeController extends GetxController {
  // Input Controllers
  final eventNameController = TextEditingController();
  final festivalTypeController = TextEditingController();
  final descriptionController = TextEditingController();
  final scopeController = TextEditingController();
  final giftTypeController = TextEditingController();

  final signupDeadlineController = TextEditingController();
  final drawDeadlineController = TextEditingController();
  final giftDeadlineController = TextEditingController();

  var budgetValue = 500.0.obs;
  var isAnonymous = false.obs;

  // Updated Date & Time Picker Logic
  Future<void> selectDate(BuildContext context, TextEditingController textController) async {
    // 1. Pick Date
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      // 2. Pick Time
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        // Combine Date and Time
        final DateTime finalDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        // Format: yyyy-mm-dd hh:mm
        // Aap chaho to intl package use karke format change kar sakte ho
        textController.text = "${finalDateTime.year}-${finalDateTime.month.toString().padLeft(2, '0')}-${finalDateTime.day.toString().padLeft(2, '0')} ${pickedTime.format(context)}";
      }
    }
  }

  void createEvent() {
    debugPrint("Event Created: ${eventNameController.text}");
    Get.snackbar("Success", "Event Created Successfully",
        backgroundColor: Colors.green, colorText: Colors.white);
  }

  @override
  void onClose() {
    eventNameController.dispose();
    festivalTypeController.dispose();
    descriptionController.dispose();
    scopeController.dispose();
    giftTypeController.dispose();
    signupDeadlineController.dispose();
    drawDeadlineController.dispose();
    giftDeadlineController.dispose();
    super.onClose();
  }
}