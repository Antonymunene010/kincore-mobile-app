import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/add_child_controller.dart';

class ChildGenderSelection extends StatelessWidget {
  final AddChildController controller;
  const ChildGenderSelection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
      children: [
        _buildGenderTab('addMember.male'.tr),
        const SizedBox(width: 10),
        _buildGenderTab('addMember.female'.tr),
        const SizedBox(width: 10),
        _buildGenderTab('addMember.other'.tr),
      ],
    ));
  }

  Widget _buildGenderTab(String gender) {
    final theme = Theme.of(Get.context!);
    final colors = theme.colorScheme;
    bool isSelected = controller.selectedGender.value == gender;

    return GestureDetector(
      onTap: () => controller.toggleGender(gender),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? colors.primary : colors.surface,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: colors.primary),
        ),
        child: Text(
          gender,
          style: TextStyle(
            color: isSelected ? colors.onPrimary : colors.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
