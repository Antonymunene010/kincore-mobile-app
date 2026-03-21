import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GiftDetailsController extends GetxController {
  final senderNameController = TextEditingController();
  final receiverNameController = TextEditingController();
  final exchangeNameController = TextEditingController();
  final dateController = TextEditingController();
  final budgetController = TextEditingController();
  final noteController = TextEditingController();

  // Date Picker logic (Default format)
  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      dateController.text = picked.toString().split(' ')[0];
    }
  }

  void sendGift() {
    debugPrint("Form submitted");
  }

  @override
  void onClose() {
    senderNameController.dispose();
    receiverNameController.dispose();
    exchangeNameController.dispose();
    dateController.dispose();
    budgetController.dispose();
    noteController.dispose();
    super.onClose();
  }
}