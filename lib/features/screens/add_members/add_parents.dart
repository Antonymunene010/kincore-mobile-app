import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import 'package:kincore_app/features/screens/add_members/add_child.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_text.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../../../core/widgets/custom_input_field.dart';
import '../../../core/widgets/custom_network_image.dart';
import 'controller/add_parents_controller.dart';
import 'widget/gender_selection.dart';
import 'widget/living_status_switch.dart';

class AddParentsScreen extends StatelessWidget {
  const AddParentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // UI Controllers
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final dobController = TextEditingController();
    final pobController = TextEditingController();
    final anniversaryController = TextEditingController();
    final locationController = TextEditingController();

    final controller = Get.put(AddParentsController());

    // RESPONSIVE VARIABLES
    final double screenW = Get.width;
    final double screenH = Get.height;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText(
          "Add Parents",
          fontSize: 20, // FIXED as per request
          fontWeight: AppFonts.semiBold,
        ),
        actions: [
          CustomIconButton(iconName: 'bell.svg', onTap: () {}),
          SizedBox(width: screenW * 0.04), // Responsive spacing
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: screenW * 0.05,
              ), // Responsive Padding
              child: Column(
                children: [
                  SizedBox(height: screenH * 0.01), // Responsive top spacing
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(
                      screenW * 0.04,
                    ), // Responsive inner padding
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), // FIXED Radius
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          "Basic Information",
                          fontSize: 16, // FIXED
                          fontWeight: AppFonts.semiBold,
                        ),
                        SizedBox(height: screenH * 0.02), // Responsive Gap
                        // Profile Image with Camera Icon
                        Center(
                          child: Stack(
                            children: [
                              Obx(() => CustomNetworkImage(
                                  imageUrl: controller.profileImage.value,
                                  height: screenW * 0.28, // Responsive size based on width
                                  width: screenW * 0.28,
                                  borderRadius: 50, // FIXED Radius
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
                                    size: 18, // FIXED Icon Size
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: screenH * 0.01), // Responsive Gap
                        CustomInputField(
                          label: "First Name",
                          hint: "Add",
                          labelFontWeight: AppFonts.medium,
                          controller: firstNameController,
                        ),
                        SizedBox(height: screenH * 0.01), // Responsive Spacing
                        CustomInputField(
                          label: "Last Name",
                          hint: "Add",
                          labelFontWeight: AppFonts.medium,
                          controller: lastNameController,
                        ),
                        SizedBox(height: screenH * 0.01),

                        AppText(
                          "Gender",
                          fontSize: 14, // FIXED
                          fontWeight: AppFonts.medium,
                        ),
                        SizedBox(height: screenH * 0.01),
                        GenderSelectionWidget(controller: controller),

                        SizedBox(height: screenH * 0.025),
                        LivingStatusWidget(livingStatus: controller.isAlive),

                        SizedBox(height: screenH * 0.025),
                        GestureDetector(onTap: () =>
                              controller.selectDate(context, dobController),
                          child: AbsorbPointer(
                            child: CustomInputField(
                              label: "Date Of Birth",
                              hint: "MM/DD/YYYY",
                              labelFontWeight: AppFonts.medium,
                              controller: dobController,
                              suffixIcon: const Icon(
                                Icons.calendar_month,
                                color: AppColors.orangeColor,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: screenH * 0.01),
                        CustomInputField(
                          label: "Place Of Birth",
                          hint: "Add location",
                          labelFontWeight: AppFonts.medium,
                          controller: pobController,
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
                              labelFontWeight: AppFonts.medium,
                              controller: anniversaryController,
                              suffixIcon: const Icon(
                                Icons.calendar_month,
                                color: AppColors.orangeColor,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: screenH * 0.01),
                        CustomInputField(
                          label: "Current Location",
                          hint: "Add",
                          labelFontWeight: AppFonts.medium,
                          controller: locationController,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenH * 0.02),
                ],
              ),
            ),
          ),

          // BOTTOM BUTTON
          Padding(
            padding: EdgeInsets.all(
              screenW * 0.05,
            ), // Responsive padding for button
            child: CustomButton(
              text: "Save & Add",
              onPressed: () {
                Get.to(AddChildScreen());
              },
              backgroundColor: AppColors.orangeColor,
            ),
          ),
        ],
      ),
    );
  }
}
