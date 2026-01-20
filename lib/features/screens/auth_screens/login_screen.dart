import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_plus/otp_plus.dart'; // Name corrected
import 'package:otp_plus/utils/enum/otp_field_shape.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/phone_input_field.dart';
import '../../../core/widgets/custom_text_button.dart';
import 'controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // UI level controllers
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    // UI khatam hone par controllers dispose honge
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get.find se controller access kiya
    final LoginController controller = Get.find<LoginController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: Get.height * 0.03),

        // Phone Number Field (Controller pass kiya)
        PhoneInputField(controller: phoneController),

        SizedBox(height: Get.height * 0.02),

        Center(
          child: AppText(
            "Check your Mobile phone for OTP code",
            fontSize: 12,
            color: AppColors.greyColor,
          ),
        ),

        SizedBox(height: Get.height * 0.03),

        Center(
          child: AppText(
            "Enter OTP",
            fontSize: 16,
            fontWeight: AppFonts.semiBold,
          ),
        ),

        SizedBox(height: Get.height * 0.02),

        /// 6 Digits OTP boxes
        OtpPlusInputs(
          size: 45,
          shape: OtpFieldShape.square,
          length: 6,
          cursorColor: AppColors.orangeColor,
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: AppFonts.bold,
            color: AppColors.primaryColor,
          ),
          onChanged: (code) {
            controller.otpCode.value = code;
          },
          // FIX: Agar onCompleted nahi chal raha, toh 'onSubmit' use karo
          onSubmit: (code) {
            controller.otpCode.value = code;
          },
        ),

        SizedBox(height: Get.height * 0.02),

        CustomTextButton(
          text: "Resend OTP",
          alignment: Alignment.center,
          onPressed: () {
            // Resend logic here
          },
        ),

        SizedBox(height: Get.height * 0.1),

        /// LogIn Action Button
        CustomButton(
          text: "Log In",
          onPressed: () {
            // UI controller se data bhej rahe hain
            controller.performLogin(phoneNumber: phoneController.text);
          },
        ),
      ],
    );
  }
}