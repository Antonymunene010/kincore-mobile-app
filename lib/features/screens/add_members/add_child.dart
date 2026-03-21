import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/features/screens/add_members/add_family_member.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../../../core/widgets/custom_input_field.dart';
import '../../../core/widgets/custom_network_image.dart';
import 'controller/add_child_controller.dart';
import 'widget/child_gender_selection.dart';
import 'widget/living_status_switch.dart';

class AddChildScreen extends StatelessWidget {
  const AddChildScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddChildController());
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final dobController = TextEditingController();
    final pobController = TextEditingController();
    final anniversaryController = TextEditingController();
    final locationController = TextEditingController();
    final schoolController = TextEditingController();
    final qualificationController = TextEditingController();
    final studyLocationController = TextEditingController();

    final double screenW = Get.width;
    final double screenH = Get.height;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        backgroundColor: colors.background,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: colors.onSurface, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText(
          'addMember.addChildTitle'.tr,
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
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(screenW * 0.04),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: colors.outlineVariant),
                      color: colors.surface,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          'addMember.basicInfo'.tr,
                          fontSize: 16,
                          fontWeight: AppFonts.semiBold,
                        ),
                        SizedBox(height: screenH * 0.02),
                        Center(
                          child: Stack(
                            children: [
                              Obx(() => CustomNetworkImage(
                                imageUrl: controller.profileImage.value,
                                height: screenW * 0.28,
                                width: screenW * 0.28,
                                borderRadius: 50,
                              )),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: colors.surface,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(blurRadius: 2, color: colors.shadow.withOpacity(0.1))
                                    ],
                                  ),
                                  child: Icon(Icons.add_a_photo_outlined, size: 18, color: colors.onSurface),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: screenH * 0.02),
                        CustomInputField(
                          label: 'addMember.firstName'.tr,
                          hint: 'common.add'.tr,
                          labelFontWeight: AppFonts.medium,
                          controller: firstNameController,
                        ),
                        SizedBox(height: screenH * 0.01),
                        CustomInputField(
                          label: 'addMember.lastName'.tr,
                          hint: 'common.add'.tr,
                          labelFontWeight: AppFonts.medium,
                          controller: lastNameController,
                        ),
                        SizedBox(height: screenH * 0.01),
                        AppText('addMember.gender'.tr, fontSize: 14, fontWeight: AppFonts.medium),
                        SizedBox(height: screenH * 0.01),
                        ChildGenderSelection(controller: controller),
                        SizedBox(height: screenH * 0.02),
                        LivingStatusWidget(livingStatus: controller.isAlive),
                        SizedBox(height: screenH * 0.01),
                        GestureDetector(
                          onTap: () => controller.selectDate(context, dobController),
                          child: AbsorbPointer(
                            child: CustomInputField(
                              label: 'addMember.dateOfBirth'.tr,
                              hint: 'addMember.dateFormatHint'.tr,
                              labelFontWeight: AppFonts.medium,
                              controller: dobController,
                              suffixIcon: Icon(Icons.calendar_month, color: colors.primary),
                            ),
                          ),
                        ),
                        SizedBox(height: screenH * 0.01),
                        CustomInputField(
                          label: 'addMember.placeOfBirth'.tr,
                          hint: 'addMember.addLocation'.tr,
                          labelFontWeight: AppFonts.medium,
                          controller: pobController,
                        ),
                        SizedBox(height: screenH * 0.01),
                        GestureDetector(
                          onTap: () => controller.selectDate(context, anniversaryController),
                          child: AbsorbPointer(
                            child: CustomInputField(
                              label: 'addMember.anniversaryDate'.tr,
                              hint: 'addMember.dateFormatHint'.tr,
                              labelFontWeight: AppFonts.medium,
                              controller: anniversaryController,
                              suffixIcon: Icon(Icons.calendar_month, color: colors.primary),
                            ),
                          ),
                        ),
                        SizedBox(height: screenH * 0.01),
                        CustomInputField(
                          label: 'addMember.currentLocation'.tr,
                          hint: 'common.add'.tr,
                          labelFontWeight: AppFonts.medium,
                          controller: locationController,
                        ),
                        SizedBox(height: screenH * 0.01),
                        CustomInputField(
                          label: 'addMember.schoolAndCollege'.tr,
                          hint: 'common.add'.tr,
                          labelFontWeight: AppFonts.medium,
                          controller: schoolController,
                        ),
                        SizedBox(height: screenH * 0.01),
                        CustomInputField(
                          label: 'addMember.qualification'.tr,
                          hint: 'common.add'.tr,
                          labelFontWeight: AppFonts.medium,
                          controller: qualificationController,
                        ),
                        SizedBox(height: screenH * 0.01),
                        CustomInputField(
                          label: 'addMember.studyLocation'.tr,
                          hint: 'common.add'.tr,
                          labelFontWeight: AppFonts.medium,
                          controller: studyLocationController,
                        ),
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
              text: 'common.saveAndAdd'.tr,
              onPressed: () {
                Get.to(() => const AddFamilyMemberScreen());
              },
              backgroundColor: colors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
