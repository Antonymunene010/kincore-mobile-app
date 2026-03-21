import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/features/screens/kinship_screens/relationship_path_screen.dart';
import 'package:kincore_app/features/screens/kinship_screens/widget/kinship_widgets.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_button.dart';
import 'controller/kinship_result_controller.dart';

class KinshipResultScreen extends StatelessWidget {
  const KinshipResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(KinshipResultController());
    final colors = Theme.of(context).colorScheme;
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
        title: AppText("kinship.resultTitle".tr, fontWeight: AppFonts.bold, fontSize: 18, color: colors.onSurface),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenW * 0.05, vertical: screenH * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KinshipSectionHeader(text: "kinship.path".tr, color: colors.onSurface),
            SizedBox(height: screenH * 0.015),

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.kinshipPath.length,
              separatorBuilder: (context, index) => SizedBox(height: screenH * 0.01),
              itemBuilder: (context, index) => KinshipPathCard(item: controller.kinshipPath[index]),
            ),

            SizedBox(height: screenH * 0.035),
            KinshipSectionHeader(text: "kinship.details".tr, color: colors.onSurface),
            SizedBox(height: screenH * 0.015),

            KinshipDetailsCard(title: "kinship.meaning".tr, subtitle: "kinship.meaningSub".tr),
            SizedBox(height: screenH * 0.015),
            KinshipDetailsCard(title: "kinship.englishTerm".tr, subtitle: "kinship.englishTermSub".tr),

            SizedBox(height: screenH * 0.05),

            CustomButton(text: "kinship.newCalculation".tr, onPressed: controller.newCalculation),
            SizedBox(height: screenH * 0.015),

            CustomButton(
              text: 'kinship.editPath'.tr,
              onPressed: controller.editPath,
              textColor: AppColors.orangeColor,
              backgroundColor: Colors.transparent,
              borderColor: AppColors.orangeColor,
            ),
            SizedBox(height: screenH * 0.03),
          ],
        ),
      ),
    );
  }
}
