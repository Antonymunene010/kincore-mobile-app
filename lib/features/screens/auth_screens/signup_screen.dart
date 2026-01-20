import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_plus/otp_plus.dart';
import 'package:otp_plus/utils/enum/otp_field_shape.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_input_field.dart';
import '../../../core/widgets/custom_text_button.dart';
import '../../../core/widgets/phone_input_field.dart';
import '../../../core/widgets/terms_check_box.dart';
import 'controller/signup_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // UI level controllers yahan rahenge
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Note: AuthScreen me Get.put ho chuka hai, isliye yahan Get.find use karein
    final controller = Get.find<SignUpController>();

    return Column( // Scaffold hataya kyunki AuthScreen me pehle se hai
      children: [
        const SizedBox(height: 30),
        CustomInputField(
          label: "Enter Your Name",
          hint: "First name last Name",
          controller: nameController,
        ),
        CustomInputField(
          label: "Email Address",
          hint: "abc@gmail.com",
          controller: emailController,
        ),

        // PhoneInputField ko hamne pehle hi update kiya tha controller lene ke liye
        PhoneInputField(controller: phoneController),

        const SizedBox(height: 10),
        CustomTextButton(text: "Get OTP", onPressed: () {}),
        const SizedBox(height: 10),

        OtpPlusInputs(
          size: 42,
          shape: OtpFieldShape.square,
          length: 6,
          cursorColor: AppColors.orangeColor,
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: AppFonts.bold,
            color: AppColors.primaryColor,
          ),
          onChanged: (code) => controller.otpCode.value = code,
          onComplete: (code) => controller.otpCode.value = code,
        ),

        const SizedBox(height: 20),
        const TermsCheckbox(),
        const SizedBox(height: 30),
        CustomButton(
          text: "Sign Up",
          onPressed: () {
            /// UI se data bhej rahe hain
            controller.performSignUp(
              name: nameController.text,
              email: emailController.text,
              phone: phoneController.text,
            );
          },
        ),
      ],
    );
  }
}