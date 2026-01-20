import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/add_child_controller.dart';
import '../../../../core/utils/app_colors.dart';

class ChildGenderSelection extends StatelessWidget {
  final AddChildController controller;
  const ChildGenderSelection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
      children: [
        _buildGenderTab("Male"),
        const SizedBox(width: 10),
        _buildGenderTab("Female"),
        const SizedBox(width: 10),
        _buildGenderTab("Other"),
      ],
    ));
  }

  Widget _buildGenderTab(String gender) {
    bool isSelected = controller.selectedGender.value == gender;
    return GestureDetector(
      onTap: () => controller.toggleGender(gender),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.orangeColor : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: AppColors.orangeColor),
        ),
        child: Text(
          gender,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.orangeColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}