// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../core/utils/app_fonts.dart';
// import '../../../core/widgets/app_text.dart';
// import '../../../core/widgets/custom_button.dart';
// import '../../../core/widgets/custom_icon_button.dart';
// import '../../../core/widgets/custom_input_field.dart';
// import '../../../core/widgets/custom_network_image.dart';
// import 'controller/add_family_member_controller.dart';
// import 'widget/living_status_switch.dart';
//
// class AddFamilyMemberScreen extends StatelessWidget {
//   const AddFamilyMemberScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(AddFamilyMemberController());
//     final colors = Theme.of(context).colorScheme;
//
//     final double screenW = Get.width;
//     final double screenH = Get.height;
//
//     final firstNameController = TextEditingController();
//     final lastNameController = TextEditingController();
//     final dobController = TextEditingController();
//     final searchController = TextEditingController();
//     final spouseNameController = TextEditingController();
//     final anniversaryController = TextEditingController();
//     final occupationController = TextEditingController();
//     final bioController = TextEditingController();
//
//     return Scaffold(
//       appBar: AppBar(
//         surfaceTintColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios, color: colors.onBackground, size: 20),
//           onPressed: Get.back,
//         ),
//         title: AppText(
//           'addMember.title'.tr,
//           fontSize: 20,
//           fontWeight: AppFonts.semiBold,
//           color: colors.onBackground,
//         ),
//         // actions: [
//         //   CustomIconButton(iconName: 'bell.svg', onTap: () {}),
//         //   SizedBox(width: screenW * 0.04),
//         // ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               physics: const BouncingScrollPhysics(),
//               padding: EdgeInsets.symmetric(horizontal: screenW * 0.05),
//               child: Column(
//                 children: [
//                   SizedBox(height: screenH * 0.01),
//                   _section(
//                     context,
//                     title: 'addMember.basicInfo'.tr,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Center(
//                           child: Stack(
//                             children: [
//                               Obx(
//                                     () => CustomNetworkImage(
//                                   imageUrl: controller.profileImage.value,
//                                   height: screenW * 0.28,
//                                   width: screenW * 0.28,
//                                   borderRadius: 100,
//                                 ),
//                               ),
//                               Positioned(
//                                 bottom: 0,
//                                 right: 0,
//                                 child: Container(
//                                   padding: const EdgeInsets.all(6),
//                                   decoration: BoxDecoration(
//                                     color: colors.surface,
//                                     shape: BoxShape.circle,
//                                     boxShadow: const [
//                                       BoxShadow(blurRadius: 3, color: Colors.black26),
//                                     ],
//                                   ),
//                                   child: Icon(Icons.add_a_photo_outlined, size: 18, color: colors.primary),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: screenH * 0.015),
//                         CustomInputField(label: 'addMember.firstName'.tr, hint: 'addMember.firstName'.tr, controller: firstNameController),
//                         CustomInputField(label: 'addMember.lastName'.tr, hint: 'addMember.lastName'.tr, controller: lastNameController),
//                         SizedBox(height: screenH * 0.01),
//                         _label('addMember.gender'.tr),
//                         _genderSelection(controller, colors),
//                         SizedBox(height: screenH * 0.02),
//                         LivingStatusWidget(livingStatus: controller.isAlive),
//                         SizedBox(height: screenH * 0.01),
//                         _datePicker(
//                           context,
//                           label: 'addMember.dateOfBirth'.tr,
//                           controller: dobController,
//                           onTap: () => controller.selectDate(context, dobController),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: screenH * 0.02),
//                   _section(
//                     context,
//                     title: 'addMember.relationshipSetup'.tr,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         _label('addMember.relationshipType'.tr),
//                         _dropdown(controller.selectedRelationship, ["Spouse", "Sibling", "Parent"], colors),
//                         SizedBox(height: screenH * 0.01),
//                         CustomInputField(
//                           label: 'addMember.findFamilyMember'.tr,
//                           hint: 'common.search'.tr,
//                           controller: searchController,
//                           prefixIcon: const Icon(Icons.search),
//                           onChanged: controller.searchMember,
//                         ),
//                         Obx(() => _searchResult(controller, colors)),
//                         CustomInputField(label: 'addMember.spouseName'.tr, hint: 'addMember.spouseName'.tr, controller: spouseNameController),
//                         _datePicker(
//                           context,
//                           label: 'addMember.anniversaryDate'.tr,
//                           controller: anniversaryController,
//                           onTap: () => controller.selectDate(context, anniversaryController),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: screenH * 0.02),
//                   _section(
//                     context,
//                     title: 'addMember.additionalDetail'.tr,
//                     child: Column(
//                       children: [
//                         _dropdown("Add location".obs, ["Ahmedabad", "Mumbai", "Delhi"], colors),
//                         CustomInputField(label: 'addMember.occupation'.tr, hint: 'addMember.occupation'.tr, controller: occupationController),
//                         CustomInputField(label: 'addMember.bioNotes'.tr, hint: "Bio", controller: bioController, maxLines: 3),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: screenH * 0.02),
//                   _section(
//                     context,
//                     title: 'addMember.privacyVisibility'.tr,
//                     child: _privacySwitch(controller, colors),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(screenW * 0.05),
//             child: CustomButton(
//               text: 'common.saveAndAdd'.tr,
//               onPressed: controller.saveFamilyMember,
//               backgroundColor: colors.primary,
//               foregroundColor: colors.onPrimary,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _section(BuildContext context, {required String title, required Widget child}) {
//     final colors = Theme.of(context).colorScheme;
//     return Container(
//       padding: EdgeInsets.all(Get.width * 0.04),
//       decoration: BoxDecoration(
//         color: colors.surface,
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(color: colors.outlineVariant),
//       ),
//       child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//         AppText(title, fontSize: 16, fontWeight: AppFonts.semiBold),
//         const SizedBox(height: 12),
//         child,
//       ]),
//     );
//   }
//
//   Widget _label(String text) => Padding(padding: const EdgeInsets.only(bottom: 8), child: AppText(text.tr, fontSize: 14));
//
//   Widget _dropdown(RxString value, List<String> items, ColorScheme colors) {
//     return Obx(
//           () => DropdownButtonFormField<String>(
//         value: items.contains(value.value) ? value.value : items.first,
//         decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
//         items: items.map((e) => DropdownMenuItem(value: e, child: Text(e.tr))).toList(),
//         onChanged: (val) => value.value = val!,
//       ),
//     );
//   }
//
//   Widget _genderSelection(AddFamilyMemberController c, ColorScheme colors) {
//     return Obx(
//           () => Wrap(
//         spacing: 10,
//         children: ['addMember.female'.tr, 'addMember.male'.tr, 'addMember.other'.tr].map((g) {
//           final selected = c.selectedGender.value == g;
//           return ChoiceChip(
//             label: Text(g),
//             selected: selected,
//             selectedColor: colors.primary,
//             labelStyle: TextStyle(color: selected ? colors.onPrimary : colors.primary),
//             onSelected: (_) => c.selectedGender.value = g,
//           );
//         }).toList(),
//       ),
//     );
//   }
//
//   Widget _datePicker(BuildContext context, {required String label, required TextEditingController controller, required VoidCallback onTap}) {
//     final colors = Theme.of(context).colorScheme;
//     return GestureDetector(
//       onTap: onTap,
//       child: AbsorbPointer(
//         child: CustomInputField(
//           label: label.tr,
//           hint: 'addMember.dateFormatHint'.tr,
//           controller: controller,
//           suffixIcon: Icon(Icons.calendar_month, color: colors.primary),
//         ),
//       ),
//     );
//   }
//
//   Widget _searchResult(AddFamilyMemberController c, ColorScheme colors) {
//     if (c.selectedMember.value != null) {
//       final m = c.selectedMember.value!;
//       return Container(
//         margin: const EdgeInsets.only(top: 10),
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: colors.primary.withOpacity(0.1),
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Row(
//           children: [
//             CustomNetworkImage(imageUrl: m['image']!, height: 45, width: 45, borderRadius: 25),
//             const SizedBox(width: 12),
//             Expanded(child: AppText(m['name']!, fontWeight: AppFonts.semiBold)),
//             IconButton(
//               icon: Icon(Icons.close, color: colors.primary),
//               onPressed: c.removeSelectedMember,
//             ),
//           ],
//         ),
//       );
//     }
//     return const SizedBox();
//   }
//
//   Widget _privacySwitch(AddFamilyMemberController c, ColorScheme colors) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           AppText('addMember.privacyVisibility'.tr, fontSize: 14),
//           AppText('Visible to all members'.tr, fontSize: 12, color: colors.onSurface.withOpacity(0.6)),
//         ]),
//         Obx(() => Switch(
//           value: c.hideSensitiveDetail.value,
//           onChanged: (val) => c.hideSensitiveDetail.value = val,
//           activeColor: colors.primary,
//         )),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../../../core/widgets/custom_input_field.dart';
import '../../../core/widgets/custom_network_image.dart';
import 'controller/add_family_member_controller.dart';
import 'widget/living_status_switch.dart';

class AddFamilyMemberScreen extends StatelessWidget {
  const AddFamilyMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddFamilyMemberController());
    final colors = Theme.of(context).colorScheme;

    final double screenW = Get.width;
    final double screenH = Get.height;

    // Controllers
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final dobController = TextEditingController();
    final searchController = TextEditingController();
    final spouseNameController = TextEditingController();
    final anniversaryController = TextEditingController();
    final occupationController = TextEditingController();
    final bioController = TextEditingController();

    // Local state for visibility dropdown (since it wasn't in your controller code)
    final RxString profileVisibility = "Family Only".obs;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: colors.onSurface, size: 20),
          onPressed: Get.back,
        ),
        title: AppText(
          'addMember.title'.tr,
          fontSize: 20,
          fontWeight: AppFonts.semiBold,
          color: colors.onSurface,
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

                  // --- Basic Info ---
                  _section(
                    context,
                    title: 'addMember.basicInfo'.tr,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Stack(
                            children: [
                              Obx(() => CustomNetworkImage(
                                imageUrl: controller.profileImage.value,
                                height: screenW * 0.28,
                                width: screenW * 0.28,
                                borderRadius: 100,
                              ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: colors.surface,
                                    shape: BoxShape.circle,
                                    boxShadow: const [BoxShadow(blurRadius: 3, color: Colors.black26)],
                                  ),
                                  child: Icon(Icons.add_a_photo_outlined, size: 18, color: colors.primary),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: screenH * 0.015),
                        CustomInputField(label: 'addMember.firstName'.tr, hint: 'addMember.firstName'.tr, controller: firstNameController),
                        CustomInputField(label: 'addMember.lastName'.tr, hint: 'addMember.lastName'.tr, controller: lastNameController),
                        SizedBox(height: screenH * 0.01),
                        _label('addMember.gender'.tr),
                        _genderSelection(controller, colors),
                        SizedBox(height: screenH * 0.02),
                        LivingStatusWidget(livingStatus: controller.isAlive),
                        SizedBox(height: screenH * 0.01),
                        _datePicker(
                          context,
                          label: 'addMember.dateOfBirth'.tr,
                          controller: dobController,
                          onTap: () => controller.selectDate(context, dobController),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenH * 0.02),

                  // --- Relationship Setup ---
                  _section(
                    context,
                    title: 'addMember.relationshipSetup'.tr,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _label('addMember.relationshipType'.tr),
                        _dropdown(controller.selectedRelationship, ["Spouse", "Sibling", "Parent"], colors),
                        SizedBox(height: screenH * 0.01),
                        CustomInputField(
                          label: 'addMember.findFamilyMember'.tr,
                          hint: 'common.search'.tr,
                          controller: searchController,
                          prefixIcon: const Icon(Icons.search),
                          onChanged: controller.searchMember,
                        ),
                        Obx(() => _searchResult(controller, colors)),
                        CustomInputField(label: 'addMember.spouseName'.tr, hint: 'addMember.spouseName'.tr, controller: spouseNameController),
                        _datePicker(
                          context,
                          label: 'addMember.anniversaryDate'.tr,
                          controller: anniversaryController,
                          onTap: () => controller.selectDate(context, anniversaryController),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenH * 0.02),

                  // --- Additional Detail ---
                  _section(
                    context,
                    title: 'addMember.additionalDetail'.tr,
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _label('Place Of Birth'),
                            _dropdown("Ahmedabad".obs, ["Ahmedabad", "Mumbai", "Delhi"], colors),
                          ],
                        ),
                        SizedBox(height: screenH * 0.01),
                        CustomInputField(label: 'addMember.occupation'.tr, hint: 'addMember.occupation'.tr, controller: occupationController),
                        CustomInputField(label: 'addMember.bioNotes'.tr, hint: "Bio", controller: bioController, maxLines: 3),
                      ],
                    ),
                  ),
                  SizedBox(height: screenH * 0.02),

                  // --- [FIXED] Privacy & Visibility ---
                  _section(
                    context,
                    title: 'addMember.privacyVisibility'.tr,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 1. Profile Visibility Dropdown
                        _label('Profile Visibility'),
                        _dropdown(profileVisibility, ["Family Only", "Public", "Private"], colors),

                        SizedBox(height: screenH * 0.02),

                        // 2. Hide Sensitive Detail Switch
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          decoration: BoxDecoration(
                            color: colors.surface,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: colors.outlineVariant.withOpacity(0.5)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText("Hide Sensitive Detail", fontSize: 14, fontWeight: AppFonts.bold, color: colors.onSurface),
                                  const SizedBox(height: 2),
                                  AppText("Mask DOB and Contact info", fontSize: 11, color: colors.onSurface.withOpacity(0.6)),
                                ],
                              ),
                              Obx(() => Switch(
                                value: controller.hideSensitiveDetail.value,
                                onChanged: (val) => controller.hideSensitiveDetail.value = val,
                                activeColor: colors.primary,
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              )),
                            ],
                          ),
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
              onPressed: controller.saveFamilyMember,
              backgroundColor: colors.primary,
              foregroundColor: colors.onPrimary,
            ),
          ),
        ],
      ),
    );
  }

  // --- Helper Widgets ---

  Widget _section(BuildContext context, {required String title, required Widget child}) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.all(Get.width * 0.04),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colors.outlineVariant.withOpacity(0.4)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        AppText(title, fontSize: 16, fontWeight: AppFonts.bold),
        const SizedBox(height: 15),
        child,
      ]),
    );
  }

  Widget _label(String text) => Padding(padding: const EdgeInsets.only(bottom: 8), child: AppText(text.tr, fontSize: 14, fontWeight: AppFonts.medium));

  Widget _dropdown(RxString value, List<String> items, ColorScheme colors) {
    return Obx(
          () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colors.outlineVariant.withOpacity(0.5)),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            value: items.contains(value.value) ? value.value : items.first,
            icon: Icon(Icons.keyboard_arrow_down_rounded, color: colors.onSurface),
            items: items.map((e) => DropdownMenuItem(value: e, child: AppText(e.tr, fontSize: 14))).toList(),
            onChanged: (val) => value.value = val!,
            dropdownColor: colors.surface,
          ),
        ),
      ),
    );
  }

  Widget _genderSelection(AddFamilyMemberController c, ColorScheme colors) {
    return Obx(
          () => Wrap(
        spacing: 10,
        children: ['addMember.female'.tr, 'addMember.male'.tr, 'addMember.other'.tr].map((g) {
          final selected = c.selectedGender.value == g;
          return ChoiceChip(
            label: Text(g),
            selected: selected,
            selectedColor: colors.primary,
            backgroundColor: colors.surface,
            labelStyle: TextStyle(
                color: selected ? colors.onPrimary : colors.onSurface,
                fontWeight: selected ? AppFonts.semiBold : AppFonts.regular
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: selected ? colors.primary : colors.outlineVariant.withOpacity(0.5))
            ),
            onSelected: (_) => c.selectedGender.value = g,
          );
        }).toList(),
      ),
    );
  }

  Widget _datePicker(BuildContext context, {required String label, required TextEditingController controller, required VoidCallback onTap}) {
    final colors = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        child: CustomInputField(
          label: label.tr,
          hint: 'addMember.dateFormatHint'.tr,
          controller: controller,
          suffixIcon: Icon(Icons.calendar_month, color: colors.primary),
        ),
      ),
    );
  }

  Widget _searchResult(AddFamilyMemberController c, ColorScheme colors) {
    if (c.selectedMember.value != null) {
      final m = c.selectedMember.value!;
      return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: colors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: colors.primary.withOpacity(0.3))
        ),
        child: Row(
          children: [
            CustomNetworkImage(imageUrl: m['image']!, height: 45, width: 45, borderRadius: 25),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(m['name']!, fontWeight: AppFonts.bold, fontSize: 14),
                  AppText("Existing Family Member", fontSize: 11, color: colors.onSurface.withOpacity(0.6)),
                ],
              ),
            ),
            IconButton(
              icon: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(color: Colors.redAccent, shape: BoxShape.circle),
                child: const Icon(Icons.close, color: Colors.white, size: 14),
              ),
              onPressed: c.removeSelectedMember,
            ),
          ],
        ),
      );
    }
    return const SizedBox();
  }
}