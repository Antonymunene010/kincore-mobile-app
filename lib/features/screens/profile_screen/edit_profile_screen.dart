import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_text.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../../../core/widgets/custom_input_field.dart';
import '../../../core/widgets/custom_network_image.dart';
import 'controller/edit_profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // UI Controllers (Local to build method)
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final dateController = TextEditingController();
    final locationController = TextEditingController();
    final occupationController = TextEditingController();
    final designationController = TextEditingController();
    final companyController = TextEditingController();
    final websiteController = TextEditingController();
    final linkedInController = TextEditingController();
    final instagramController = TextEditingController();
    final facebookController = TextEditingController();
    final otherLinkController = TextEditingController();

    // GetX Controller for Logic
    final controller = Get.put(EditProfileController());

    final double screenW = Get.width;
    final double screenH = Get.height;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText("Edit Profile", fontSize: 20, fontWeight: AppFonts.semiBold),
        actions: [
          CustomIconButton(iconName: 'bell.svg', onTap: () {}),
          SizedBox(width: screenW * 0.02),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: screenW * 0.04,
          vertical: screenH * 0.015,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(screenW * 0.04),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey.shade300, width: 1),
              ),
              child: Column(
                children: [
                  /// Profile Photo Section
                  Center(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black87, width: 1.5),
                              ),
                              child: Obx(() => CustomNetworkImage(
                                imageUrl: controller.profileImageUrl.value,
                                height: 90,
                                width: 90,
                                borderRadius: 50,
                              )),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () => print("Pick Photo"),
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.black54, width: 1),
                                  ),
                                  child: const Icon(Icons.add_a_photo_outlined, size: 16, color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenH * 0.01),
                        AppText("Change Photos", fontSize: 14, fontWeight: AppFonts.semiBold),
                      ],
                    ),
                  ),

                  SizedBox(height: screenH * 0.015),

                  CustomInputField(
                    label: "First Name",
                    hint: "Enter First Line",
                    controller: firstNameController,
                    labelFontWeight: AppFonts.medium,
                  ),
                  SizedBox(height: screenH * 0.01),

                  CustomInputField(
                    label: "Last Name",
                    hint: "Enter Last Name",
                    controller: lastNameController,
                    labelFontWeight: AppFonts.medium,
                  ),
                  SizedBox(height: screenH * 0.01),

                  // DATE PICKER (Passing local controller to GetX function)
                  GestureDetector(
                    onTap: () => controller.selectDate(context, dateController),
                    child: AbsorbPointer(
                      child: CustomInputField(
                        label: "End Date",
                        hint: "MM/DD/YYYY",
                        controller: dateController,
                        labelFontWeight: AppFonts.medium,
                        suffixIcon: const Icon(Icons.calendar_today_outlined, color: AppColors.orangeColor, size: 20),
                      ),
                    ),
                  ),
                  SizedBox(height: screenH * 0.01),

                  CustomInputField(
                    label: "Location",
                    hint: "Enter Address Location",
                    controller: locationController,
                    labelFontWeight: AppFonts.medium,
                  ),
                  SizedBox(height: screenH * 0.01),

                  CustomInputField(
                    label: "Occupation",
                    hint: "Enter Occupation",
                    controller: occupationController,
                    labelFontWeight: AppFonts.medium,
                  ),
                  SizedBox(height: screenH * 0.01),

                  CustomInputField(
                    labelFontWeight: AppFonts.medium,
                    label: "Designation",
                    hint: "Enter Description",
                    maxLines: 3,
                    controller: designationController,
                  ),
                  SizedBox(height: screenH * 0.01),

                  CustomInputField(
                    label: "Company Name",
                    hint: "Enter Company Name",
                    controller: companyController,
                    labelFontWeight: AppFonts.medium,
                  ),
                  SizedBox(height: screenH * 0.01),

                  CustomInputField(
                    label: "Website",
                    hint: "Paste Your Website",
                    controller: websiteController,
                    labelFontWeight: AppFonts.medium,
                  ),
                  SizedBox(height: screenH * 0.01),

                  CustomInputField(
                    label: "Linked In",
                    hint: "Paste LinkedIn Link",
                    controller: linkedInController,
                    labelFontWeight: AppFonts.medium,
                  ),
                  SizedBox(height: screenH * 0.01),

                  CustomInputField(
                    label: "Instagram",
                    hint: "Paste Instagram Link",
                    controller: instagramController,
                    labelFontWeight: AppFonts.medium,
                  ),
                  SizedBox(height: screenH * 0.01),

                  CustomInputField(
                    label: "FaceBook",
                    hint: "Paste Facebook Link",
                    controller: facebookController,
                    labelFontWeight: AppFonts.medium,
                  ),
                  SizedBox(height: screenH * 0.01),

                  CustomInputField(
                    label: "Other Link",
                    hint: "Paste other Link",
                    controller: otherLinkController,
                    labelFontWeight: AppFonts.medium,
                  ),

                  SizedBox(height: screenH * 0.02),

                  CustomButton(
                    text: "Add Other Link",
                    onPressed: () {},
                    backgroundColor: AppColors.orangeColor.withOpacity(0.1),
                    foregroundColor: AppColors.orangeColor,
                    borderColor: Colors.transparent,
                  ),
                ],
              ),
            ),

            SizedBox(height: screenH * 0.03),

            CustomButton(
              text: "Claim Identity",
              onPressed: () => controller.updateProfile(firstNameController.text),
            ),
            SizedBox(height: screenH * 0.04),
          ],
        ),
      ),
    );
  }
}