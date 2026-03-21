import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import 'package:kincore_app/features/screens/claim_identity_screens/claim_identity_screen.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_input_field.dart';
import '../memory_screen/widget/dotted_container.dart';

class ChangeRelationshipScreen extends StatefulWidget {
  const ChangeRelationshipScreen({super.key});

  @override
  State<ChangeRelationshipScreen> createState() =>
      _ChangeRelationshipScreenState();
}

class _ChangeRelationshipScreenState extends State<ChangeRelationshipScreen> {
  final TextEditingController relationshipTypeController = TextEditingController();
  final TextEditingController selectPersonController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();

  @override
  void dispose() {
    relationshipTypeController.dispose();
    selectPersonController.dispose();
    reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final double sw = Get.width;
    final double sh = Get.height;
    final double maxWidth = sw < 600 ? sw : 500.0;

    // Light mode check for forced black text
    final Color descriptiveTextColor = colors.onSurface.withOpacity(0.8);

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        title: AppText("changeRelationship.title".tr,
            fontSize: 18, fontWeight: AppFonts.semiBold),
        centerTitle: true,
        backgroundColor: colors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, size: 20, color: colors.onSurface),
          onPressed: () => Get.back(),
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// --- TOP TEXT (Forced to Black/Dark Grey for Light Mode) ---
                AppText(
                  "claim.description".tr,
                  fontSize: 12,
                  color: descriptiveTextColor, // Ab ye blackish dikhega
                  fontWeight: AppFonts.medium,
                ),

                const SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: "changeRelationship.add".tr,
                        onPressed: () {},
                        height: 42,
                        backgroundColor: AppColors.orangeColor,
                      ),
                    ),
                    const SizedBox(width: 16),
                    TextButton(
                      onPressed: () {},
                      child: AppText(
                        "changeRelationship.remove".tr,
                        fontSize: 14,
                        color: Colors.red,
                        fontWeight: AppFonts.semiBold,
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 24),

                AppText(
                  "changeRelationship.detailTitle".tr,
                  fontSize: 16,
                  fontWeight: AppFonts.bold,
                  color: colors.onSurface,
                ),

                const SizedBox(height: 12),

                CustomInputField(
                  label: "changeRelationship.typeHint".tr,
                  hint: "common.add".tr,
                  controller: relationshipTypeController,
                ),
                CustomInputField(
                  label: "changeRelationship.personHint".tr,
                  hint: "common.select".tr,
                  controller: selectPersonController,
                  suffixIcon: Icon(Icons.keyboard_arrow_down, color: colors.outline),
                ),
                CustomInputField(
                  label: "changeRelationship.reasonHint".tr,
                  hint: "common.add".tr,
                  controller: reasonController,
                  maxLines: 3,
                ),

                const SizedBox(height: 25),

                AppText(
                  "changeRelationship.supportDocs".tr,
                  fontSize: 14,
                  fontWeight: AppFonts.semiBold,
                  color: colors.onSurface,
                ),
                const SizedBox(height: 12),

                /// --- Dotted Upload Box (Light Mode Optimized) ---
                DottedContainer(
                  color: AppColors.orangeColor.withOpacity(0.7),
                  borderRadius: 15,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: sh * 0.03),
                    decoration: BoxDecoration(
                      color: AppColors.orangeColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        const Icon(Icons.add_a_photo_outlined,
                            color: AppColors.orangeColor,
                            size: 38
                        ),
                        const SizedBox(height: 12),
                        AppText(
                          "claim.addGovId".tr,
                          fontSize: 16,
                          fontWeight: AppFonts.bold,
                          color: colors.onSurface,
                        ),
                        const SizedBox(height: 4),
                        AppText(
                          "gift.uploadSupport".tr,
                          fontSize: 12,
                          color: colors.onSurface.withOpacity(0.7),
                        ),
                        const SizedBox(height: 18),
                        SizedBox(
                          width: 160,
                          height: 44,
                          child: CustomButton(
                            text: "common.upload".tr,
                            onPressed: () {},
                            backgroundColor: AppColors.orangeColor.withOpacity(0.2),
                            foregroundColor: AppColors.orangeColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                /// --- BOTTOM SECURITY TEXT (Black Color Fix) ---
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.lock_outline, size: 14, color: colors.onSurface),
                    const SizedBox(width: 6),
                    Expanded(
                      child: AppText(
                        "changeRelationship.security".tr,
                        fontSize: 11,
                        color: colors.onSurface.withOpacity(0.7), // Readable Black tone
                        fontWeight: AppFonts.regular,
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 35),

                CustomButton(
                  text: "changeRelationship.saveNext".tr,
                  onPressed: () => Get.to(()=>ClaimIdentityScreen()),
                  backgroundColor: AppColors.orangeColor,
                  width: double.infinity,
                  height: 52,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
