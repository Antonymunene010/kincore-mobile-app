import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/widgets/custom_button.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_network_image.dart';
import 'controller/security_controller.dart';
import 'widget/security_switch_tile.dart';

class ProfileSecurityScreen extends StatelessWidget {
  const ProfileSecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SecurityController());
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        backgroundColor: colors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, size: 20, color: colors.onSurface),
          onPressed: () => Get.back(),
        ),
        title: AppText("security.title".tr, fontWeight: AppFonts.bold, fontSize: 18),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator(color: AppColors.orangeColor));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomNetworkImage(
                      imageUrl: "https://i.pravatar.cc/150?u=alex",
                      height: 100,
                      width: 100,
                      borderRadius: 50,
                    ),
                    const SizedBox(height: 10),

                    AppText(
                      "Alex Johnson",
                      fontSize: 20,
                      fontWeight: AppFonts.bold,
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 5),

                    _buildCurrentRoleBadge(context, "role.currentRole".trParams({'role': 'Admin'})),
                    AppText(
                      "role.familySpace".tr,
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),
              SecuritySwitchTile(
                title: "security.lockProfile".tr,
                subtitle: "security.lockProfileSub".tr,
                value: controller.isProfileLocked.value,
                onChanged: (v) => controller.isProfileLocked.value = v,
              ),
              const SizedBox(height: 10),

              AppText("security.searchVisibility".tr, fontSize: 16, fontWeight: AppFonts.bold),
              const SizedBox(height: 15),
              buildRadioTile(controller, "security.visibility.everyone".tr,),
              buildRadioTile(controller, "security.visibility.friends".tr,),
              buildRadioTile(controller, "security.visibility.family".tr,),

              const SizedBox(height: 30),

              AppText("security.contactPrivacy".tr, fontSize: 16, fontWeight: AppFonts.bold),
              const SizedBox(height: 15),

              SecuritySwitchTile(
                title: "security.hideEmail".tr,
                subtitle: "security.hideEmailSub".tr,
                value: controller.hideEmail.value,
                onChanged: (v) => controller.hideEmail.value = v,
              ),

              SecuritySwitchTile(
                title: "security.hidePhone".tr,
                subtitle: "security.hidePhoneSub".tr,
                value: controller.hidePhoneNumber.value,
                onChanged: (v) => controller.hidePhoneNumber.value = v,
              ),

              const SizedBox(height: 20),

              CustomButton(text: 'security.saveChanges'.tr, onPressed: ()=>Get.back()),
              const SizedBox(height: 40),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildCurrentRoleBadge(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE8E0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: AppText(text, fontSize: 12, color: const Color(0xFFFF6B3C), fontWeight: AppFonts.semiBold),
    );
  }

  Widget buildRadioTile(SecurityController controller, String value) {
    return Obx(() {
      bool isSelected = controller.searchVisibility.value == value;
      return Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: AppColors.orangeColor),
        ),
        child: Row(
          children: [
            Expanded(child: AppText(value)),
            Radio<String>(
              value: value,
              groupValue: controller.searchVisibility.value,
              activeColor: AppColors.orangeColor,
              onChanged: (v) =>
              controller.searchVisibility.value = v!,
            ),
          ],
        ),
      );
    });
  }
}
