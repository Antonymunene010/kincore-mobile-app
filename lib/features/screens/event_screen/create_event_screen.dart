import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kincore_app/features/screens/add_members/add_family_member.dart';
import 'package:kincore_app/features/screens/family_member/family_member_list_screen.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_text.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../../../core/widgets/custom_input_field.dart';
import '../../../core/widgets/custom_network_image.dart';
import '../memory_screen/widget/dotted_container.dart';
import 'controller/create_event_controller.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // GetX Controller Initialize
    final controller = Get.put(CreateEventController());

    final double screenW = Get.width;
    final double screenH = Get.height;

    // Local Controllers for fields that don't need to be in GetX Controller
    final titleController = TextEditingController();
    final locationController = TextEditingController();
    final descriptionController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // --- YE LINES ADD KI HAIN COLOR FIX KARNE KE LIYE ---
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText(
          "Create Event",
          fontSize: 20,
          fontWeight: AppFonts.semiBold,
        ),
        actions: [
          CustomIconButton(iconName: 'bell.svg', onTap: () {}),
          SizedBox(width: screenW * 0.02),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenW * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenH * 0.02),

            // --- IMAGE UPLOAD SECTION ---
            DottedContainer(
              color: AppColors.orangeColor.withOpacity(0.5),
              borderRadius: 15,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: screenH * 0.04),
                decoration: BoxDecoration(
                  color: AppColors.orangeColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    SvgPicture.asset('assets/icons/add_memory.svg'),
                    const SizedBox(height: 15),
                    Obx(() => AppText(
                      "Add ${controller.selectedTab.value}",
                      fontSize: 20,
                      fontWeight: AppFonts.medium,
                    )),
                    AppText(
                      "Upload PNG, JPG File Support",
                      fontSize: 14,
                      fontWeight: AppFonts.regular,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 150,
                      height: 46,
                      child: CustomButton(
                        text: "Upload",
                        onPressed: () => controller.pickFiles(),
                        backgroundColor: AppColors.orangeColor.withOpacity(0.15),
                        foregroundColor: AppColors.orangeColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: screenH * 0.03),
            AppText("Event Detail", fontSize: 18, fontWeight: AppFonts.semiBold),
            SizedBox(height: screenH * 0.02),

            // --- INPUT FIELDS SECTION ---
            Container(
              padding: EdgeInsets.all(screenW * 0.04),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomInputField(
                    hint: "Enter Title",
                    controller: titleController,
                    label: 'Event Title',
                    labelFontWeight: AppFonts.medium,
                  ),
                  SizedBox(height: screenH * 0.01),

                  CustomInputField(
                    hint: "Enter Address Location",
                    suffixIcon: const Icon(Icons.location_city, color: AppColors.orangeColor),
                    controller: locationController,
                    labelFontWeight: AppFonts.medium,
                    label: 'Location',
                  ),
                  SizedBox(height: screenH * 0.01),

                  CustomInputField(
                    hint: "Write here...",
                    controller: descriptionController,
                    label: 'Description',
                    labelFontWeight: AppFonts.medium,
                    maxLines: 4,
                  ),
                  SizedBox(height: screenH * 0.01),

                  // START DATE
                  Obx(() => GestureDetector(
                    onTap: () => controller.pickStartDate(context),
                    child: AbsorbPointer(
                      child: CustomInputField(
                        hint: "MM/DD/YYYY",
                        controller: TextEditingController(text: controller.startDateText.value),
                        label: 'Start Date',
                        labelFontWeight: AppFonts.medium,
                        suffixIcon: const Icon(Icons.calendar_month, color: AppColors.orangeColor),
                      ),
                    ),
                  )),
                  SizedBox(height: screenH * 0.01),

                  // END DATE
                  Obx(() => GestureDetector(
                    onTap: () => controller.pickEndDate(context),
                    child: AbsorbPointer(
                      child: CustomInputField(
                        hint: "MM/DD/YYYY",
                        controller: TextEditingController(text: controller.endDateText.value),
                        label: 'End Date',
                        labelFontWeight: AppFonts.medium,
                        suffixIcon: const Icon(Icons.calendar_month, color: AppColors.orangeColor),
                      ),
                    ),
                  )),
                  SizedBox(height: screenH * 0.01),

                  // TIME
                  Obx(() => GestureDetector(
                    onTap: () => controller.pickTime(context),
                    child: AbsorbPointer(
                      child: CustomInputField(
                        labelFontWeight: AppFonts.medium,
                        hint: "Enter Time",
                        controller: TextEditingController(text: controller.timeText.value),
                        label: 'Time',
                        suffixIcon: const Icon(Icons.watch_later_outlined, color: AppColors.orangeColor),
                      ),
                    ),
                  )),
                ],
              ),
            ),

            SizedBox(height: screenH * 0.03),

            // --- INVITE FAMILY SECTION ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText("Invite Family Member", fontSize: 16, fontWeight: AppFonts.semiBold),
                TextButton(
                  onPressed: () => Get.to(const FamilyMemberListScreen()),
                  child: AppText("View All", color: AppColors.orangeColor, fontWeight: AppFonts.medium, fontSize: 12),
                ),
              ],
            ),

            SizedBox(
              height: 110,
              child: Obx(
                    () => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.familyMembers.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) return _buildAddMemberCircle(screenW);
                    final member = controller.familyMembers[index - 1];
                    return _buildMemberCircle(member['name']!, member['image']!, screenW);
                  },
                ),
              ),
            ),
            SizedBox(height: screenH * 0.04),
          ],
        ),
      ),
    );
  }

  Widget _buildMemberCircle(String name, String image, double screenW) {
    return Container(
      width: screenW * 0.18,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          CustomNetworkImage(imageUrl: image, height: 60, width: 60, borderRadius: 30),
          const SizedBox(height: 5),
          AppText(name, fontSize: 11, maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildAddMemberCircle(double screenW) {
    // Family member image ki size 60 hai, isliye hum button ko bhi vahi size denge
    double avatarSize = 60.0;

    return Container(
      width: screenW * 0.18,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          SizedBox(
            height: avatarSize,
            width: avatarSize,
            child: CustomIconButton(
              iconData: Icons.add,
              onTap: () => Get.to(const AddFamilyMemberScreen()),
              size: 28,
              backgroundColor: AppColors.orangeColor.withOpacity(0.1),
              borderRadius: avatarSize / 2, // Perfect circle banane ke liye
              iconColor: AppColors.orangeColor,
            ),
          ),
          const SizedBox(height: 5),
          AppText("Add", fontSize: 11, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}