import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_button.dart';
import 'controller/relationship_controller.dart';
import 'widget/relation_card.dart';

class RelationshipPathScreen extends StatelessWidget {
  const RelationshipPathScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RelationshipController());
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final double screenW = Get.width;
    final double screenH = Get.height;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        backgroundColor: colors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: colors.onSurface, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText("kinship.pathTitle".tr, fontWeight: AppFonts.bold, fontSize: 18),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenW * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenH * 0.02),
            AppText("kinship.selectPath".tr, fontSize: 16, fontWeight: AppFonts.bold),
            SizedBox(height: screenH * 0.015),

            Obx(() => Wrap(
              spacing: 8.0,
              runSpacing: 10.0,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: controller.selectedPath.asMap().entries.map((entry) {
                int index = entry.key;
                String path = entry.value;
                bool isMe = path == "Me";

                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: screenW * 0.04, vertical: 8),
                      decoration: BoxDecoration(
                        color: isMe ? AppColors.orangeColor : colors.surface,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: isMe ? AppColors.orangeColor : AppColors.orangeColor.withOpacity(0.5)
                        ),
                      ),
                      child: AppText(path.tr,
                          color: isMe ? Colors.white : colors.onSurface,
                          fontWeight: AppFonts.medium),
                    ),
                    if (index != controller.selectedPath.length - 1)
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Icon(Icons.arrow_forward, size: 18, color: colors.onSurface.withOpacity(0.5)),
                      ),
                  ],
                );
              }).toList(),
            )),

            SizedBox(height: screenH * 0.035),
            AppText("kinship.addNextStep".tr, fontSize: 16, fontWeight: AppFonts.bold),
            SizedBox(height: screenH * 0.02),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: screenW > 400 ? 0.85 : 0.78,
              children: [
                RelationCard(title: "common.father".tr, icon: Icons.person, color: Colors.orange, countKey: "Father"),
                RelationCard(title: "common.mother".tr, icon: Icons.person_3, color: Colors.amber, countKey: "Mother"),
                RelationCard(title: 'common.brother'.tr, icon: Icons.person_2, color: Colors.green, countKey: "Brother"),
                RelationCard(title: 'common.sister'.tr, icon: Icons.person_4, color: Colors.red, countKey: "Sister"),
                RelationCard(title: "addMember.relationship.spouse".tr, icon: Icons.person_outline, color: Colors.yellow, countKey: "Spouse"),
                RelationCard(title: "addMember.addChildTitle".tr, icon: Icons.child_care, color: Colors.redAccent, countKey: "Child"),
              ],
            ),

            SizedBox(height: screenH * 0.04),
            CustomButton(
              text: "kinship.calculate".tr,
              onPressed: () => controller.calculate(),
            ),
            SizedBox(height: screenH * 0.04),
          ],
        ),
      ),
    );
  }
}
