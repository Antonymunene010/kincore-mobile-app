import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/utils/app_fonts.dart';
import 'package:kincore_app/core/widgets/app_text.dart';
import 'package:kincore_app/core/widgets/custom_button.dart';
import 'package:kincore_app/core/widgets/custom_icon_button.dart';
import 'package:kincore_app/core/widgets/custom_input_field.dart';
import 'package:kincore_app/core/widgets/custom_network_image.dart';
import 'package:kincore_app/features/screens/add_members/add_child.dart';
import 'controller/add_parents_controller.dart';
import 'widget/gender_selection.dart';
import 'widget/living_status_switch.dart';

class AddParentsScreen extends StatelessWidget {
  const AddParentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddParentsController());
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final double screenW = Get.width;
    final double screenH = Get.height;

    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final dobController = TextEditingController();
    final pobController = TextEditingController();
    final anniversaryController = TextEditingController();
    final locationController = TextEditingController();

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.background,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: theme.iconTheme.color, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText(
          'addMember.addParentsTitle'.tr,
          fontSize: 20,
          fontWeight: AppFonts.semiBold,
          color: theme.textTheme.titleLarge?.color ?? Colors.black,
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
                      border: Border.all(color: theme.dividerColor),
                      color: theme.cardColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          'addMember.basicInfo'.tr,
                          fontSize: 16,
                          fontWeight: AppFonts.semiBold,
                          color: theme.textTheme.bodyMedium?.color,
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
                                child: GestureDetector(
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.surface,
                                      shape: BoxShape.circle,
                                      boxShadow: const [BoxShadow(blurRadius: 2, color: Colors.black26)],
                                    ),
                                    child: Icon(Icons.add_a_photo_outlined, size: 18, color: theme.iconTheme.color),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: screenH * 0.01),
                        CustomInputField(
                          label: 'addMember.firstName'.tr,
                          hint: 'common.add'.tr,
                          controller: firstNameController,
                          labelFontWeight: AppFonts.medium,
                        ),
                        SizedBox(height: screenH * 0.01),
                        CustomInputField(
                          label: 'addMember.lastName'.tr,
                          hint: 'common.add'.tr,
                          controller: lastNameController,
                          labelFontWeight: AppFonts.medium,
                        ),
                        SizedBox(height: screenH * 0.01),
                        AppText(
                          'addMember.gender'.tr,
                          fontSize: 14,
                          fontWeight: AppFonts.medium,
                          color: theme.textTheme.bodyMedium?.color,
                        ),
                        SizedBox(height: screenH * 0.01),
                        GenderSelectionWidget(controller: controller),
                        SizedBox(height: screenH * 0.025),
                        LivingStatusWidget(livingStatus: controller.isAlive),
                        SizedBox(height: screenH * 0.025),
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
              onPressed: () => Get.to(const AddChildScreen()),
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: theme.colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
