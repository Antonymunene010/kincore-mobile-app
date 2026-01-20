import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_text.dart';
import 'widget/auth_tab_bar.dart';
import 'controller/login_controller.dart';
import 'controller/signup_controller.dart';
import 'signup_screen.dart';
import 'login_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {

    /// Controllers
    final signUpController = Get.put(SignUpController());
    Get.put(LoginController());

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      /// Keyboard aane par screen adjust hogi
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),

              AppText(
                "Kincore",
                fontSize: 28,
                fontWeight: AppFonts.bold,
                gradient: LinearGradient(
                  colors: [AppColors.primaryColor, AppColors.orangeColor],
                ),
              ),

              const SizedBox(height: 25),

              Center(
                child: Column(
                  children: [
                    AppText(
                      "Connect to your Roots!",
                      fontSize: 22,
                      fontWeight: AppFonts.semiBold,
                    ),
                    const SizedBox(height: 10),
                    AppText(
                      "Enter your Details to Log in or create an account.",
                      fontSize: 14,
                      textAlign: TextAlign.center,
                      color: AppColors.greyColor,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 35),

              /// Custom Tab Bar (Sign Up / Log In)
              const AuthTabBar(),

              const SizedBox(height: 10),

              /// Dynamic Content Area (SignUp or Login)
              Obx(() {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  /// Material wrap karna zaroori hai taaki koi render error na aaye
                  child: Material(
                    key: ValueKey(signUpController.selectedTab.value),
                    color: Colors.transparent,
                    child: signUpController.selectedTab.value == 0
                        ? const SignUpScreen()
                        : const LoginScreen(),
                  ),
                );
              }),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}