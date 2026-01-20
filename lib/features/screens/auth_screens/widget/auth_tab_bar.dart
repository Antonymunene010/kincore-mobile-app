import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/signup_controller.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/app_text.dart';

class AuthTabBar extends StatelessWidget {
  const AuthTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.find();
    return Obx(() => Row(
      children: [
        _tabItem("Sign Up", 0, controller),
        _tabItem("Log In", 1, controller),
      ],
    ));
  }

  Widget _tabItem(String title, int index, SignUpController controller) {
    bool isSelected = controller.selectedTab.value == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.changeTab(index),
        child: Column(
          children: [
            AppText(
              title,
              fontSize: Get.width * 0.05,
              fontWeight: AppFonts.bold,
              color: isSelected ? AppColors.blackColor : AppColors.greyColor,
            ),
            SizedBox(height: Get.height * 0.01),
            Container(
              height: 3,
              width: Get.width * 0.4,
              color: isSelected ? AppColors.orangeColor : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}