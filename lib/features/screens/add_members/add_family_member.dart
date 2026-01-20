import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_text.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../../../core/widgets/custom_input_field.dart';
import '../../../core/widgets/custom_network_image.dart';
import 'controller/add_family_member_controller.dart';
import 'widget/living_status_switch.dart'; // Using the reusable widget we fixed

class AddFamilyMemberScreen extends StatelessWidget {
  const AddFamilyMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // UI Controllers (Inside build for UI part)
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final dobController = TextEditingController();
    final searchController = TextEditingController();
    final spouseNameController = TextEditingController();
    final anniversaryController = TextEditingController();
    final occupationController = TextEditingController();
    final bioController = TextEditingController();

    final controller = Get.put(AddFamilyMemberController());
    final double screenW = Get.width;
    final double screenH = Get.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText(
          "Add Family Member",
          fontSize: 20,
          fontWeight: AppFonts.semiBold,
        ),
        actions: [
          CustomIconButton(iconName: 'bell.svg', onTap: () {}),
          SizedBox(width: screenW * 0.04),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: screenW * 0.05),
              child: Column(
                children: [
                  SizedBox(height: screenH * 0.01),

                  /// SECTION 1: Basic Information
                  _buildSectionBox(
                    screenW,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          "Basic Information",
                          fontSize: 16,
                          fontWeight: AppFonts.semiBold,
                        ),
                        SizedBox(height: screenH * 0.02),
                        Center(
                          child: Stack(
                            children: [
                              Obx(
                                () => CustomNetworkImage(
                                  imageUrl: controller.profileImage.value,
                                  height: screenW * 0.28,
                                  width: screenW * 0.28,
                                  borderRadius: 50,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 2,
                                        color: Colors.black26,
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.add_a_photo_outlined,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: screenH * 0.01),
                        CustomInputField(
                          label: "First Name",
                          hint: "First Name",
                          controller: firstNameController,
                          labelFontWeight: AppFonts.medium,
                        ),
                        SizedBox(height: screenH * 0.01),
                        CustomInputField(
                          label: "Last Name",
                          hint: "Last Name",
                          controller: lastNameController,
                          labelFontWeight: AppFonts.medium,
                        ),
                        SizedBox(height: screenH * 0.01),
                        AppText(
                          "Gender",
                          fontSize: 14,
                          fontWeight: AppFonts.medium,
                        ),
                        SizedBox(height: screenH * 0.01),
                        _buildGenderSelection(controller),
                        SizedBox(height: screenH * 0.02),
                        LivingStatusWidget(livingStatus: controller.isAlive),
                        SizedBox(height: screenH * 0.01),
                        GestureDetector(
                          onTap: () =>
                              controller.selectDate(context, dobController),
                          child: AbsorbPointer(
                            child: CustomInputField(
                              label: "Date Of Birth",
                              hint: "MM/DD/YYYY",
                              controller: dobController,
                              suffixIcon: const Icon(
                                Icons.calendar_month,
                                color: AppColors.orangeColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: screenH * 0.02),

                  /// SECTION 2: Relationship Setup
                  _buildSectionBox(
                    screenW,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          "Relationship Setup",
                          fontSize: 16,
                          fontWeight: AppFonts.semiBold,
                        ),
                        SizedBox(height: screenH * 0.01),
                        _buildLabel("Relationship Type"),
                        _buildDropdown(controller.selectedRelationship, [
                          "Spouse",
                          "Sibling",
                          "Parent",
                        ], screenW),
                        SizedBox(height: screenH * 0.01),
                        CustomInputField(
                          hint: "Find Family Member",
                          controller: searchController,
                          prefixIcon: const Icon(Icons.search),
                          onChanged: (val) => controller.searchMember(val),
                          label: 'Find Family Member',
                        ),

                        // Search Results Card Format
                        Obx(
                          () => _buildSearchAndSelectedMember(
                            controller,
                            screenW,
                          ),
                        ),

                        SizedBox(height: screenH * 0.01),
                        CustomInputField(
                          label: "Spouse Name",
                          hint: "Spouse Name",
                          controller: spouseNameController,
                          labelFontWeight: AppFonts.medium,
                        ),
                        SizedBox(height: screenH * 0.01),
                        GestureDetector(
                          onTap: () => controller.selectDate(
                            context,
                            anniversaryController,
                          ),
                          child: AbsorbPointer(
                            child: CustomInputField(
                              label: "Anniversary Date",
                              hint: "MM/DD/YYYY",
                              controller: anniversaryController,
                              suffixIcon: const Icon(
                                Icons.calendar_month,
                                color: AppColors.orangeColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: screenH * 0.02),

                  /// SECTION 3: Additional Detail
                  _buildSectionBox(
                    screenW,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          "Additional Detail",
                          fontSize: 16,
                          fontWeight: AppFonts.semiBold,
                        ),
                        SizedBox(height: screenH * 0.01),
                        _buildLabel("Place Of Birth"),
                        _buildDropdown("Add location".obs, [
                          "Ahmedabad",
                          "Mumbai",
                          "Delhi",
                        ], screenW),
                        SizedBox(height: screenH * 0.01),
                        CustomInputField(
                          label: "Occupation",
                          hint: "Occupation",
                          controller: occupationController,
                          labelFontWeight: AppFonts.medium,
                        ),
                        SizedBox(height: screenH * 0.01),
                        CustomInputField(
                          label: "Bio/ Notes",
                          hint: "Bio/ Notes",
                          controller: bioController,
                          maxLines: 3,
                          labelFontWeight: AppFonts.medium,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: screenH * 0.02),

                  /// SECTION 4: Privacy & Visibility
                  _buildSectionBox(
                    screenW,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          "Privacy & Visibility",
                          fontSize: 16,
                          fontWeight: AppFonts.semiBold,
                        ),
                        SizedBox(height: screenH * 0.015),
                        _buildLabel("Profile Visibility"),
                        _buildDropdown(controller.profileVisibility, [
                          "Family Only",
                          "Public",
                          "Private",
                        ], screenW),
                        SizedBox(height: screenH * 0.02),
                        _buildSensitiveDetailSwitch(controller),
                      ],
                    ),
                  ),
                  SizedBox(height: screenH * 0.02),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(screenW * 0.05),
            child: CustomButton(
              text: "Save & Add",
              onPressed: () => controller.saveFamilyMember(),
              backgroundColor: AppColors.orangeColor,
            ),
          ),
        ],
      ),
    );
  }

  // --- Helper Widgets based on Image Design ---

  Widget _buildSectionBox(double screenW, {required Widget child}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(screenW * 0.04),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: child,
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: AppText(text, fontSize: 14, fontWeight: AppFonts.medium),
    );
  }

  Widget _buildDropdown(RxString value, List<String> items, double screenW) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Obx(
        () => DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: items.contains(value.value) ? value.value : items.first,
            isExpanded: true,
            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
            items: items
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (val) => value.value = val!,
          ),
        ),
      ),
    );
  }

  Widget _buildGenderSelection(AddFamilyMemberController controller) {
    return Obx(
      () => Row(
        children: ["Female", "Male", "Other"].map((g) {
          bool isSelected = controller.selectedGender.value == g;
          return GestureDetector(
            onTap: () => controller.selectedGender.value = g,
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.orangeColor : Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: AppColors.orangeColor),
              ),
              child: Text(
                g,
                style: TextStyle(
                  color: isSelected ? Colors.white : AppColors.orangeColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSearchAndSelectedMember(
    AddFamilyMemberController controller,
    double screenW,
  ) {
    if (controller.selectedMember.value != null) {
      var member = controller.selectedMember.value!;
      return Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFFFE5DB),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            CustomNetworkImage(
              imageUrl: member['image']!,
              height: 45,
              width: 45,
              borderRadius: 25,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    member['name']!,
                    fontSize: 14,
                    fontWeight: AppFonts.semiBold,
                  ),
                  AppText(
                    member['relation']!,
                    fontSize: 12,
                    color: Colors.grey.shade700,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => controller.removeSelectedMember(),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Color(0xFFFF6F3C),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.close, color: Colors.white, size: 16),
              ),
            ),
          ],
        ),
      );
    } else if (controller.searchResults.isNotEmpty) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: controller.searchResults.length,
        itemBuilder: (context, index) {
          var item = controller.searchResults[index];
          return ListTile(
            leading: CustomNetworkImage(
              imageUrl: item['image']!,
              height: 40,
              width: 40,
              borderRadius: 20,
            ),
            title: Text(item['name']!),
            onTap: () => controller.selectMember(item),
          );
        },
      );
    }
    return const SizedBox();
  }

  Widget _buildSensitiveDetailSwitch(AddFamilyMemberController controller) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hide Sensitive Detail",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Text(
                "Mask DOB and Contact info",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
            ],
          ),
          Obx(
            () => Switch(
              value: controller.hideSensitiveDetail.value,
              activeTrackColor: AppColors.orangeColor,
              onChanged: (val) => controller.hideSensitiveDetail.value = val,
            ),
          ),
        ],
      ),
    );
  }
}
