import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/features/screens/feed_screen/post_setting_screen.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_text.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_network_image.dart'; // Path check kar lena bhai
import 'controller/create_post_controller.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreatePostController());
    final double screenW = Get.width;
    final double screenH = Get.height;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: screenW * 0.05,
          ),
          onPressed: () => Get.back(),
        ),
        title: AppText(
          "Create Post",
          fontSize: 20,
          fontWeight: AppFonts.semiBold,
        ),
        actions: [
          CustomIconButton(iconName: 'setting.svg', onTap: () {
            Get.to(PostSettingScreen());
          }),
          SizedBox(width: screenW * 0.02),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenW * 0.05),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(screenW * 0.04),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade200, width: 1.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- PROFILE SECTION ---
                  Row(
                    children: [
                      Obx(
                        () => Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.orangeColor,
                              width: 2,
                            ),
                          ),
                          child: CustomNetworkImage(
                            imageUrl: controller.userProfilePic.value,
                            height: screenW * 0.14,
                            width: screenW * 0.14,
                            borderRadius: 100, // Circle shape
                          ),
                        ),
                      ),
                      SizedBox(width: screenW * 0.03),
                      Obx(
                        () => AppText(
                          controller.userName.value,
                          fontSize: 20,
                          fontWeight: AppFonts.semiBold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenH * 0.02),

                  // TextArea Box
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: screenW * 0.03),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F9FA),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: TextField(
                      controller: controller.postController,
                      maxLines: 6,
                      style: const TextStyle(fontSize: 16),
                      decoration: const InputDecoration(
                        hintText: "Write your post or question here",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),

                  SizedBox(height: screenH * 0.025),

                  ElevatedButton.icon(
                    onPressed: () => controller.addMedia(),
                    icon: const Icon(
                      CupertinoIcons.photo,
                      color: Colors.black,
                      size: 20,
                    ),
                    label: AppText(
                      "Add media",
                      fontSize: 14,
                      fontWeight: AppFonts.medium,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEFF6FF),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  SizedBox(height: screenH * 0.02),

                  // --- MEDIA PREVIEW ---
                  Obx(
                    () => Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: controller.selectedMedia.asMap().entries.map((
                        entry,
                      ) {
                        return Stack(
                          children: [
                            CustomNetworkImage(
                              imageUrl: entry.value,
                              width: screenW * 0.18,
                              height: screenW * 0.18,
                              borderRadius: 10,
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: GestureDetector(
                                onTap: () => controller.removeMedia(entry.key),
                                child: const CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.cancel,
                                    size: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),

                  const Divider(height: 35, color: Color(0xFFEEEEEE)),

                  AppText(
                    "Tage Person",
                    fontWeight: AppFonts.semiBold,
                    fontSize: 16,
                  ),
                  SizedBox(height: screenH * 0.01),
                  GestureDetector(
                    onTap: () => controller.isMemberSelectorVisible.toggle(),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenW * 0.04,
                        vertical: screenH * 0.018,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        children: [
                          AppText("Select", color: Colors.grey, fontSize: 14),
                          const Spacer(),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // --- TAG PERSON SELECTION LIST ---
                  Obx(() {
                    // ignore: unused_local_variable
                    var trigger = controller.taggedPersons.length;
                    return controller.isMemberSelectorVisible.value
                        ? Container(
                            height: 110,
                            margin: const EdgeInsets.only(top: 15),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.members.length,
                              itemBuilder: (context, index) {
                                var member = controller.members[index];
                                bool isSelected = controller.taggedPersons.any(
                                  (e) => e['id'] == member['id'],
                                );

                                return GestureDetector(
                                  onTap: () => controller.toggleTag(member),
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 18),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            CustomNetworkImage(
                                              imageUrl: member['img']!,
                                              height: 56,
                                              width: 56,
                                              borderRadius: 100,
                                            ),
                                            if (isSelected)
                                              Positioned(
                                                right: 0,
                                                bottom: 0,
                                                child: Container(
                                                  padding: const EdgeInsets.all(
                                                    2,
                                                  ),
                                                  decoration:
                                                      const BoxDecoration(
                                                        color: Colors.white,
                                                        shape: BoxShape.circle,
                                                      ),
                                                  child: CircleAvatar(
                                                    radius: 9,
                                                    backgroundColor:
                                                        AppColors.orangeColor,
                                                    child: const Icon(
                                                      Icons.check,
                                                      color: Colors.white,
                                                      size: 12,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        AppText(member['name']!, fontSize: 12),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : const SizedBox.shrink();
                  }),

                  SizedBox(height: screenH * 0.02),

                  AppText(
                    "Add Location",
                    fontWeight: AppFonts.semiBold,
                    fontSize: 16,
                  ),
                  SizedBox(height: screenH * 0.01),
                  TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: "Select",
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      suffixIcon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: screenW * 0.04,
                        vertical: screenH * 0.018,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenH * 0.04),
            CustomButton(
              text: 'Post',
              onPressed: () => controller.submitPost(),
            ),
          ],
        ),
      ),
    );
  }
}
