import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_input_field.dart';
import 'controller/add_familiybio_controller.dart';

class AddFamilyBioScreen extends StatelessWidget {
  const AddFamilyBioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddFamilyBioController());
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: colors.onSurface, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText('familyBio.addTitle'.tr, fontSize: 18, fontWeight: AppFonts.semiBold, color: colors.onSurface),
        centerTitle: true,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 900),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: theme.cardColor,
                    border: Border.all(color: colors.outlineVariant.withOpacity(0.5)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText('familyBio.addMedia'.tr, fontSize: 18, fontWeight: AppFonts.semiBold, color: colors.onSurface),
                      AppText('familyBio.dragAndDrop'.tr, fontSize: 13, color: colors.onSurface.withOpacity(0.5)),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(backgroundColor: colors.surfaceVariant, elevation: 0),
                        child: AppText('common.addFile'.tr, color: colors.onSurface),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                AppText('familyBio.basicInfo'.tr, fontSize: 18, fontWeight: AppFonts.bold, color: colors.onSurface),
                CustomInputField(label: 'familyBio.storyName'.tr, hint: 'common.add'.tr, controller: controller.nameController),
                CustomInputField(label: 'familyBio.location'.tr, hint: 'common.add'.tr, controller: controller.locationController),
                GestureDetector(
                  onTap: () => controller.selectDate(context),
                  child: AbsorbPointer(
                    child: CustomInputField(
                      label: 'familyBio.birthDate'.tr,
                      hint: 'familyBio.selectDate'.tr,
                      controller: controller.dateController,
                      suffixIcon: Icon(Icons.calendar_month_outlined, color: colors.onSurface.withOpacity(0.5)),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                AppText('familyBio.storyBio'.tr, fontSize: 16, fontWeight: AppFonts.semiBold, color: colors.onSurface),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Obx(() => _toolBtn(Icons.format_bold, () => controller.toggleBold(), controller.isBold.value, colors)),
                      Obx(() => _toolBtn(Icons.format_italic, () => controller.toggleItalic(), controller.isItalic.value, colors)),
                      _toolBtn(Icons.link, () {}, false, colors),
                      _toolBtn(Icons.format_list_bulleted, () => controller.addBullet(), false, colors),
                      _toolBtn(Icons.format_list_numbered, () {}, false, colors),
                      const Spacer(),
                      Obx(() => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: colors.outlineVariant),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton<double>(
                          value: controller.selectedFontSize.value,
                          dropdownColor: theme.cardColor,
                          underline: const SizedBox(),
                          style: TextStyle(color: colors.onSurface),
                          items: controller.fontSizes
                              .map((val) => DropdownMenuItem(
                            value: val,
                            child: AppText(val.toInt().toString(), fontSize: 12, color: colors.onSurface),
                          ))
                              .toList(),
                          onChanged: (v) => controller.selectedFontSize.value = v!,
                        ),
                      )),
                    ],
                  ),
                ),
                Obx(() => TextField(
                  controller: controller.bioController,
                  maxLines: 12,
                  style: TextStyle(
                    fontSize: controller.selectedFontSize.value,
                    color: colors.onSurface,
                    fontWeight: controller.isBold.value ? FontWeight.bold : FontWeight.normal,
                    fontStyle: controller.isItalic.value ? FontStyle.italic : FontStyle.normal,
                  ),
                  decoration: InputDecoration(
                    hintText: 'familyBio.addBioHint'.tr,
                    hintStyle: TextStyle(color: colors.onSurface.withOpacity(0.3)),
                    filled: true,
                    fillColor: theme.cardColor,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: colors.outlineVariant)),
                  ),
                )),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () => controller.publishBio(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF6433),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    child: AppText('familyBio.publishBio'.tr, color: Colors.white, fontWeight: AppFonts.bold),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _toolBtn(IconData icon, VoidCallback onTap, bool isActive, ColorScheme colors) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Icon(icon, size: 22, color: isActive ? const Color(0xFFFF6433) : colors.onSurface.withOpacity(0.7)),
      ),
    );
  }
}
