// --- GENDER SELECTION WIDGET ---
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/add_parents_controller.dart';

class GenderSelectionWidget extends StatelessWidget {
  final AddParentsController controller;
  const GenderSelectionWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
      children: [
        _buildGenderButton("Father"),
        const SizedBox(width: 12),
        _buildGenderButton("Mother"),
      ],
    ));
  }

  Widget _buildGenderButton(String gender) {
    bool isSelected = controller.selectedGender.value == gender;
    return GestureDetector(
      onTap: () => controller.toggleGender(gender),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFF6F3C) : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: const Color(0xFFFF6F3C)),
        ),
        child: Text(
          gender,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFFFF6F3C),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

