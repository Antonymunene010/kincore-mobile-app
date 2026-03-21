import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_button.dart';
import 'controller/draw_controller.dart';

class DrawWheelScreen extends StatelessWidget {
  const DrawWheelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DrawController());
    final colors = Theme.of(context).colorScheme;
    final double h = Get.height;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        backgroundColor: colors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: colors.onSurface, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText("gift.letsDraw".tr, fontWeight: AppFonts.bold, fontSize: 18),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator(color: AppColors.orangeColor));
        }

        return Column(
          children: [
            SizedBox(height: h * 0.05),
            AppText("gift.surpriseBegin".tr,
                fontSize: 24, fontWeight: AppFonts.bold, color: colors.onSurface),

            const Spacer(),

            // Spin Wheel Section
            SizedBox(
              height: h * 0.45,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  FortuneWheel(
                    selected: controller.selected.stream,
                    animateFirst: false,
                    duration: const Duration(seconds: 4), // 4 second tak ghumega
                    indicators: const [
                      FortuneIndicator(
                        alignment: Alignment.topCenter,
                        child: TriangleIndicator(color: AppColors.orangeColor),
                      ),
                    ],
                    items: [
                      for (var photo in controller.profileList)
                        FortuneItem(
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(photo),
                          ),
                          style: FortuneItemStyle(
                            color: Colors.primaries[controller.profileList.indexOf(photo) % Colors.primaries.length].withOpacity(0.8),
                            borderColor: Colors.white,
                            borderWidth: 2,
                          ),
                        ),
                    ],
                  ),
                  // Upper Pointing Icon (Image jaisa pin)
                  Positioned(
                    top: -10,
                    child: Icon(Icons.location_on, color: AppColors.orangeColor, size: 40),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Spin Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
                text: controller.isSpinning.value ? "gift.spinning".tr : "gift.spinWheel".tr,
                onPressed: () => controller.spinWheel(),
              ),
            ),

            SizedBox(height: h * 0.05),
          ],
        );
      }),
    );
  }
}
