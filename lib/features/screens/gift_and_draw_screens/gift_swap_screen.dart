import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/features/screens/gift_and_draw_screens/draw_wheel_screen.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_input_field.dart';
import '../../../core/widgets/custom_button.dart';
import 'controller/gift_swap_controller.dart';

class GiftSwapScreen extends StatelessWidget {
  const GiftSwapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GiftSwapController());
    final colors = Theme.of(context).colorScheme;
    final double w = Get.width;
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
        title: AppText("gift.swapTitle".tr, fontWeight: AppFonts.bold, fontSize: 18),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.05),
        child: Column(
          children: [
            // [FIXED]: Expanded + SingleChildScrollView lagaya hai taaki keyboard aane par error na aaye
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: h * 0.02),

                    // 1. Your Name Field
                    CustomInputField(
                      label: "",
                      hint: "gift.yourName".tr,
                      controller: controller.yourNameController,
                      isFiiled: true,
                    ),

                    SizedBox(height: h * 0.03),

                    // 2. Add Participants Section Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText("gift.addFriendName".tr,
                            fontSize: 18,
                            fontWeight: AppFonts.bold,
                            color: colors.onSurface
                        ),
                        // [FIXED]: Language Translation lagayi
                        TextButton.icon(
                          onPressed: () => _showParticipantSelectionSheet(context, colors, controller),
                          icon: const Icon(Icons.group_add, color: AppColors.orangeColor, size: 20),
                          label: AppText('gift.selectParticipant'.tr, color: AppColors.orangeColor, fontWeight: AppFonts.semiBold),
                        )
                      ],
                    ),

                    SizedBox(height: h * 0.01),

                    // Manual Entry Field with Add Button inside
                    CustomInputField(
                      label: "",
                      hint: "gift.friendName".tr,
                      controller: controller.friendNameController,
                      isFiiled: true,
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.add_circle, color: AppColors.orangeColor, size: 28),
                        onPressed: () => controller.addFriend(),
                      ),
                    ),

                    SizedBox(height: h * 0.02),

                    // 3. Dynamic Chips (Participants List)
                    Obx(() => Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: controller.friendsList.map((name) => Chip(
                        label: AppText(name, fontSize: 14, fontWeight: AppFonts.medium),
                        backgroundColor: colors.surface,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(color: colors.outlineVariant.withOpacity(0.5)),
                        ),
                        deleteIcon: const Icon(Icons.close, size: 16),
                        onDeleted: () {
                          controller.friendsList.remove(name);
                        },
                      )).toList(),
                    )),

                    SizedBox(height: h * 0.02), // Scroll ke liye thoda extra space
                  ],
                ),
              ),
            ),

            // 4. Final Draw Button (Hamesha keyboard ke upar ya screen ke bottom par rahega)
            CustomButton(
              text: "gift.draw".tr,
              onPressed: () => Get.to(() => const DrawWheelScreen()),
              backgroundColor: AppColors.orangeColor,
            ),
            SizedBox(height: h * 0.04), // Bottom Padding
          ],
        ),
      ),
    );
  }

  // Add Participant Popup/Screen
  void _showParticipantSelectionSheet(BuildContext context, ColorScheme colors, GiftSwapController controller) {
    // Dummy family members list (Aap ise API se replace kar lena)
    final familyMembers = ['Eleanor Rigby', 'Paul Mckenzie', 'John Rigby', 'Mary Rigby'];

    Get.bottomSheet(
      Container(
        height: Get.height * 0.7, // [FIXED]: Fixed height di hai taaki Expanded proper chale
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Column(
          children: [
            Container(width: 40, height: 5, decoration: BoxDecoration(color: colors.outlineVariant, borderRadius: BorderRadius.circular(10))),
            const SizedBox(height: 20),

            // [FIXED]: Translation lagayi
            AppText('gift.selectParticipantsTitle'.tr, fontSize: 18, fontWeight: AppFonts.bold),
            const SizedBox(height: 15),

            // Family Members List
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: familyMembers.length,
                itemBuilder: (context, index) {
                  final member = familyMembers[index];
                  return Obx(() {
                    final isSelected = controller.friendsList.contains(member);
                    return CheckboxListTile(
                      value: isSelected,
                      activeColor: AppColors.orangeColor,
                      title: AppText(member, fontWeight: AppFonts.medium),
                      secondary: CircleAvatar(
                        backgroundColor: AppColors.orangeColor.withOpacity(0.1),
                        child: const Icon(Icons.person, color: AppColors.orangeColor, size: 20),
                      ),
                      onChanged: (bool? val) {
                        if (val == true) {
                          if (!controller.friendsList.contains(member)) {
                            controller.friendsList.add(member);
                          }
                        } else {
                          controller.friendsList.remove(member);
                        }
                      },
                    );
                  });
                },
              ),
            ),

            const SizedBox(height: 15),
            // [FIXED]: Translation lagayi
            CustomButton(
              text: 'gift.done'.tr,
              onPressed: () => Get.back(),
              backgroundColor: AppColors.orangeColor,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }
}