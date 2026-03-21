import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_input_field.dart';
import 'controller/create_family_space_controller.dart'; // Controller ka path

class CreateFamilySpaceScreen extends StatelessWidget {
  const CreateFamilySpaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller initialize kiya
    final controller = Get.put(CreateFamilySpaceController());

    // Theme setup for Dark/Light mode
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final double screenW = Get.width;
    final double screenH = Get.height;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        backgroundColor: colors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: colors.onSurface, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText(
          'createSpace.appBarTitle'.tr,
          fontSize: 18,
          fontWeight: AppFonts.semiBold,
          color: colors.onSurface,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: screenW * 0.05, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Texts
              AppText(
                'createSpace.welcome'.tr,
                fontSize: 22,
                fontWeight: AppFonts.bold,
                color: colors.onSurface,
              ),
              const SizedBox(height: 8),
              AppText(
                'createSpace.subtitle'.tr,
                fontSize: 14,
                color: colors.onSurfaceVariant,
                height: 1.4,
              ),

              SizedBox(height: screenH * 0.04),

              // --- IMAGE PICKER AVATAR ---
              Center(
                child: GestureDetector(
                  onTap: controller.pickImage,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Obx(() => Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: colors.onInverseSurface.withOpacity(0.05),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: colors.outlineVariant.withOpacity(0.5),
                            width: 2,
                          ),
                        ),
                        child: controller.selectedImagePath.value.isEmpty
                            ? Icon(Icons.camera_alt_outlined, size: 40, color: colors.onSurfaceVariant)
                            : const ClipOval(
                          // Jab actual image hogi tab Image.file() ya CustomNetworkImage use karna
                          child: Icon(Icons.image, size: 40),
                        ),
                      )),

                      // Small plus icon container
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppColors.orangeColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: colors.surface, width: 2),
                        ),
                        child: const Icon(Icons.add, size: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: AppText(
                  'createSpace.uploadPhoto'.tr,
                  fontSize: 13,
                  fontWeight: AppFonts.medium,
                  color: AppColors.orangeColor,
                ),
              ),

              SizedBox(height: screenH * 0.04),

              // --- FORM FIELDS ---
              CustomInputField(
                label: 'createSpace.nameLabel'.tr,
                hint: 'createSpace.nameHint'.tr,
                controller: controller.familyNameController,
                prefixIcon: Icon(Icons.group_outlined, color: colors.onSurfaceVariant, size: 22),
              ),

              const SizedBox(height: 20),

              CustomInputField(
                label: 'createSpace.descLabel'.tr,
                hint: 'createSpace.descHint'.tr,
                controller: controller.descriptionController,
                prefixIcon: Icon(Icons.edit_note_rounded, color: colors.onSurfaceVariant, size: 22),
                // Agar aapke CustomInputField me maxLines support hai to use kar sakte ho
                // maxLines: 3,
              ),

              SizedBox(height: screenH * 0.06),

              // --- SUBMIT BUTTON ---
              CustomButton(
                text: 'createSpace.createBtn'.tr,
                onPressed: controller.createSpace,
                backgroundColor: AppColors.orangeColor,
                textColor: Colors.white,
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}