import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/widgets/custom_input_field.dart';
import 'package:kincore_app/core/widgets/soft_gradient_bg.dart';
import 'package:kincore_app/features/routes/dashboard_screen.dart';
import 'package:kincore_app/features/screens/auth_flow/forgot_password_screen/forgot_password_screen.dart';
import 'package:kincore_app/features/screens/switch_space/create_family_space.dart';
import 'package:kincore_app/features/screens/switch_space/switch_space_screen.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/app_images_const.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_widgets.dart';
import '../../onboarding_screen/onboarding_screen.dart';
import 'auth_controller.dart';

class AuthScreen extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());

  AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SoftGradientBackground hata kar custom Container lagaya hai
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight, // Top Right corner pe yellow tone ke liye
            colors: [
              Color(0xFFFFFDF9), // Bottom-left: Ekdum light white background
              Color(0xFFFFF0B3), // Top-right: Soft yellow tone
            ],
            stops: [0.4, 1.0], // Gradient ka spread control karne ke liye
          ),
        ),
        child: SafeArea(
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: Theme.of(context).colorScheme.copyWith(
                onSurface: Colors.black,
                onSurfaceVariant: Colors.black54,
                outlineVariant: Colors.grey,
              ),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              // Baaki ka aapka Column aur UI ka code same rahega...
              child: Column(
                children: [
                  const SizedBox(height: 30),

                  // --- Logo & Header ---
                  CustomAssetImage(
                    imageName: AppImagesConst.onboardingLogo,
                    height: 150,
                    width: 150,
                  ),

                AppText(
                  'auth.kincore'.tr,
                  fontSize: 24,
                  fontWeight: AppFonts.bold,
                  gradient: LinearGradient(
                    colors: [AppColors.primaryColor, AppColors.yellowColor],
                  ),
                ),

                // Dynamic Header Text based on Tab (Reactive using Obx)
                Obx(() => Column(
                  children: [
                    AppText(
                      controller.tabIndex.value == 0
                          ? 'auth.connect'.tr
                          : 'auth.welcomeBack'.tr,
                      fontSize: 20,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 6),
                    AppText(
                      'auth.detailsPrompt'.tr,
                      fontSize: 14,
                      color: Colors.grey[600],
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),

                  const SizedBox(height: 15),

                // --- Custom Tab Bar ---
                TabBar(
                  controller: controller.tabController,
                  indicatorColor: AppColors.primaryColor,
                  labelColor: Colors.black,
                  dividerHeight: 0,
                  indicatorSize: TabBarIndicatorSize.tab,
                  // unselectedLabelColor: Colors.black54,
                  labelStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppFonts.poppins,
                  ),
                  onTap: (index) => controller.tabIndex.value = index,
                  tabs: [
                    Tab(text: 'auth.signUp'.tr),
                    Tab(text: 'auth.logIn'.tr),
                  ],
                ),

                  const SizedBox(height: 10),

                  // --- Dynamic Form Content ---
                  Obx(() => AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: controller.tabIndex.value == 0
                        ? _buildSignUpForm(controller)
                        : _buildLoginForm(controller),
                  )),

                  const SizedBox(height: 40), // Bottom padding
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // // --- Sign Up Form ---
  // Widget _buildSignUpForm(AuthController controller) {
  //   return Column(
  //     key: const ValueKey(0),
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       CustomInputField(
  //         label: 'auth.nameLabel'.tr,
  //         color: AppColors.blackColor,
  //         hint: 'auth.nameHint'.tr,
  //         controller: controller.nameController,
  //       ),
  //       CustomInputField(
  //         label: 'auth.emailLabel'.tr,
  //         hint: 'auth.emailHint'.tr,
  //         color: AppColors.blackColor,
  //
  //         controller: controller.emailController,
  //       ),
  //       CustomInputField(
  //         label: 'auth.passwordLabel'.tr,
  //         hint: 'auth.passwordHint'.tr,
  //         color: AppColors.blackColor,
  //
  //         isPassword: true,
  //         controller: controller.passwordController,
  //       ),
  //       CustomInputField(
  //         label: 'auth.confirmPasswordLabel'.tr,
  //         hint: 'auth.passwordHint'.tr,
  //         color: AppColors.blackColor,
  //
  //         isPassword: true,
  //         controller: controller.confirmPasswordController,
  //       ),
  //       const SizedBox(height: 25),
  //       CustomButton(
  //         text: 'auth.signUp'.tr,
  //         // onPressed: controller.register,
  //         onPressed: (){
  //           // Get.to(()=> ScannerScreen());
  //
  //         },
  //         backgroundColor: AppColors.orangeColor,
  //       ),
  //       const SizedBox(height: 12),
  //       CustomButton(
  //         text: 'auth.logIn'.tr,
  //         onPressed: () {
  //           controller.tabController.animateTo(1);
  //           controller.tabIndex.value = 1;
  //         },
  //         backgroundColor: Colors.transparent,
  //         borderColor: AppColors.orangeColor,
  //         textColor: AppColors.orangeColor,
  //       ),
  //     ],
  //   );
  // }

  // --- Sign Up Form ---
  Widget _buildSignUpForm(AuthController controller) {
    return Column(
      key: const ValueKey(0),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // [ISSUE 2]: Back button to go to previous language screen
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(
            onPressed: () {
              Get.offAll(() => const OnboardingScreen());
            },
            icon: const Icon(Icons.arrow_back_ios_new, size: 14, color: Colors.grey),
            label: AppText('auth.back'.tr, color: Colors.grey, fontSize: 13),
            style: TextButton.styleFrom(padding: EdgeInsets.zero, alignment: Alignment.centerLeft),
          ),
        ),
        const SizedBox(height: 5),

        // [ISSUE 1]: Split First Name and Last Name
        Row(
          children: [
            Expanded(
              child: CustomInputField(
                label: 'auth.firstName'.tr, // aap isko 'auth.firstName'.tr kar sakte ho
                color: AppColors.blackColor,
                hint: 'auth.firstNameHint'.tr,
                controller: controller.firstNameController,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CustomInputField(
                label: 'auth.lastName'.tr, // 'auth.lastName'.tr
                color: AppColors.blackColor,
                hint: 'auth.lastNameHint'.tr,
                controller: controller.lastNameController,
              ),
            ),
          ],
        ),

        // [ISSUE 3]: DOB Field (Optional for now to avoid iOS/Android age restrictions)
        GestureDetector(
          onTap: () => controller.selectDOB(Get.context!),
          child: AbsorbPointer(
            child: CustomInputField(
              label: 'auth.dob'.tr,
              hint: 'auth.dobHint'.tr,
              color: AppColors.blackColor,
              controller: controller.dobController,
              suffixIcon: const Icon(Icons.calendar_today, size: 18, color: Colors.grey),
            ),
          ),
        ),

        CustomInputField(
          label: 'auth.emailLabel'.tr,
          hint: 'auth.emailHint'.tr,
          color: AppColors.blackColor,
          controller: controller.emailController,
        ),
        CustomInputField(
          label: 'auth.passwordLabel'.tr,
          hint: 'auth.passwordHint'.tr,
          color: AppColors.blackColor,
          isPassword: true,
          controller: controller.passwordController,
        ),
        CustomInputField(
          label: 'auth.confirmPasswordLabel'.tr,
          hint: 'auth.passwordHint'.tr,
          color: AppColors.blackColor,
          isPassword: true,
          controller: controller.confirmPasswordController,
        ),
        const SizedBox(height: 25),
        CustomButton(
          text: 'auth.signUp'.tr,
          onPressed: () {
            // Calling controller register to check validation before moving
            controller.register();
          },
          backgroundColor: AppColors.orangeColor,
        ),
        const SizedBox(height: 12),
        CustomButton(
          text: 'auth.logIn'.tr,
          onPressed: () {
            controller.tabController.animateTo(1);
            controller.tabIndex.value = 1;
          },
          backgroundColor: Colors.transparent,
          borderColor: AppColors.orangeColor,
          textColor: AppColors.orangeColor,
        ),
      ],
    );
  }

  // --- Log In Form ---
  Widget _buildLoginForm(AuthController controller) {
    return Column(
      key: const ValueKey(1),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomInputField(
          label: 'auth.emailLabel'.tr,
          hint: 'auth.emailHint'.tr,
          color: AppColors.blackColor,

          controller: controller.emailController,
        ),
        CustomInputField(
          label: 'auth.passwordLabel'.tr,
          hint: 'auth.passwordHint'.tr,
          color: AppColors.blackColor,

          isPassword: true,
          controller: controller.passwordController,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () => Get.to(ForgotPasswordScreen()),
            child: AppText('auth.forgotPassword'.tr, color: AppColors.primaryColor),
          ),
        ),
        const SizedBox(height: 10),
         Row(
          children: [
            Expanded(child: Divider(color: Colors.grey)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: AppText('auth.continueWith'.tr, color: Colors.grey),
            ),
            Expanded(child: Divider(color: Colors.grey)),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            // Expanded(
            //   child: _socialButton(
            //     "Google",
            //     Icon(Icons.g_mobiledata, color: AppColors.greyColor, size: 35),
            //     const EdgeInsets.symmetric(vertical: 2),
            //   ),
            // ),
            // const SizedBox(width: 15),
            // Expanded(
            //   child: _socialButton(
            //     "Facebook",
            //     Icon(Icons.facebook, color: AppColors.greyColor),
            //     const EdgeInsets.symmetric(vertical: 8),
            //   ),
            // ),
            Expanded(
              child: _socialButton(
                'auth.google'.tr,
                "assets/icons/google.svg",
                const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: _socialButton(
                'auth.facebook'.tr,
                "assets/icons/facebook.svg",
                const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        CustomButton(
          text: 'auth.logIn'.tr,
          icon: Icons.arrow_forward,
          iconColor: Colors.white,
          isIconRight: true,
          onPressed: controller.login,
          // onPressed: (){
          //   Get.to(()=> DashboardScreen());
          // },
          backgroundColor: AppColors.orangeColor,
        ),
      ],
    );
  }

  // Widget _socialButton(String label, Icon icon, EdgeInsetsGeometry padding) {
  //   return Container(
  //     padding: padding,
  //     decoration: BoxDecoration(
  //       border: Border.all(color: AppColors.primaryColor.withOpacity(0.5)),
  //       borderRadius: BorderRadius.circular(30),
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         icon,
  //         const SizedBox(width: 8),
  //         AppText(label, fontWeight: FontWeight.w500, color: Colors.black),
  //       ],
  //     ),
  //   );
  // }
// 2. Updated _socialButton method
  Widget _socialButton(String label, String iconPath, EdgeInsetsGeometry padding) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon widget ki jagah SvgPicture.asset use kiya
          SvgPicture.asset(
            iconPath,
            height: 24, // Icon ka size adjust karein
            width: 24,
          ),
          const SizedBox(width: 10), // Gap thoda badha diya taaki clean dikhe
          AppText(
              label,
              fontWeight: FontWeight.w500,
              color: Colors.black
          ),
        ],
      ),
    );
  }
}
