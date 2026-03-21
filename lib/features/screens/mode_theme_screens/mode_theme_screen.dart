import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_theme_controller.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';

class ModeThemeScreen extends StatelessWidget {
  const ModeThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // main.dart me pehle hi Get.put kar diya hai, isliye sirf Get.find() chalega
    final themeController = Get.find<ThemeController>();
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: colors.onSurface),
          onPressed: () => Get.back(),
        ),
        // Translated Title
        title: AppText(
          'profile.display'.tr,
          fontSize: 20,
          fontWeight: AppFonts.bold,
          color: colors.onSurface,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Translated Subheading
            AppText(
              'profile.chooseAppearance'.tr,
              fontSize: 16,
              fontWeight: AppFonts.semiBold,
              color: colors.onSurface.withOpacity(0.7),
            ),
            const SizedBox(height: 15),

            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: colors.outlineVariant.withOpacity(0.3)),
              ),
              child: Obx(() => Column(
                children: [
                  _buildRadioTile(
                    context,
                    title: 'profile.lightMode'.tr,
                    value: 'light',
                    groupValue: themeController.currentThemeMode.value,
                    onChanged: (val) => themeController.setTheme(val!),
                  ),
                  Divider(height: 1, color: colors.outlineVariant.withOpacity(0.2)),
                  _buildRadioTile(
                    context,
                    title: 'profile.darkMode'.tr,
                    value: 'dark',
                    groupValue: themeController.currentThemeMode.value,
                    onChanged: (val) => themeController.setTheme(val!),
                  ),
                  Divider(height: 1, color: colors.outlineVariant.withOpacity(0.2)),
                  _buildRadioTile(
                    context,
                    title: 'profile.systemPref'.tr,
                    subtitle: 'profile.systemPrefSub'.tr,
                    value: 'system',
                    groupValue: themeController.currentThemeMode.value,
                    onChanged: (val) => themeController.setTheme(val!),
                  ),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioTile(BuildContext context, {
    required String title,
    String? subtitle,
    required String value,
    required String groupValue,
    required ValueChanged<String?> onChanged,
  }) {
    final colors = Theme.of(context).colorScheme;

    return RadioListTile<String>(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      activeColor: const Color(0xFFFF6433),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      title: AppText(
        title,
        fontSize: 16,
        fontWeight: AppFonts.medium,
        color: colors.onSurface,
      ),
      subtitle: subtitle != null
          ? AppText(subtitle, fontSize: 12, color: colors.onSurface.withOpacity(0.6))
          : null,
      controlAffinity: ListTileControlAffinity.trailing,
    );
  }
}