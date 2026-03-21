// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class AuthController extends GetxController with GetSingleTickerProviderStateMixin {
//   late TabController tabController;
//
//   // --- Observable Variables ---
//   var tabIndex = 0.obs;
//   var isPasswordVisible = false.obs;
//   var isConfirmPasswordVisible = false.obs;
//   var isTermsAccepted = false.obs;
//
//   var isLoading = false.obs;
//
//   // --- Text Controllers ---
//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();
//
//   // [ADDED] Forgot Password ke liye alag controller
//   final forgotPasswordEmailController = TextEditingController();
//
//   @override
//   void onInit() {
//     super.onInit();
//     tabController = TabController(length: 2, vsync: this);
//
//     tabController.addListener(() {
//       if (tabController.indexIsChanging || tabController.index != tabIndex.value) {
//         tabIndex.value = tabController.index;
//       }
//     });
//   }
//
//   // --- Helper Methods ---
//   void togglePasswordVisibility() => isPasswordVisible.toggle();
//   void toggleConfirmPasswordVisibility() => isConfirmPasswordVisible.toggle();
//
//   void toggleTerms(bool? value) => isTermsAccepted.value = value ?? false;
//
//   // --- Validation Logic ---
//   bool validateSignUp() {
//     if (nameController.text.isEmpty) {
//       Get.snackbar("Error", "Please enter your name", snackPosition: SnackPosition.BOTTOM);
//       return false;
//     }
//     if (!GetUtils.isEmail(emailController.text)) {
//       Get.snackbar("Error", "Enter a valid email", snackPosition: SnackPosition.BOTTOM);
//       return false;
//     }
//     if (passwordController.text.length < 6) {
//       Get.snackbar("Error", "Password must be 6+ characters", snackPosition: SnackPosition.BOTTOM);
//       return false;
//     }
//     if (passwordController.text != confirmPasswordController.text) {
//       Get.snackbar("Error", "Passwords do not match", snackPosition: SnackPosition.BOTTOM);
//       return false;
//     }
//     return true;
//   }
//
//   // --- Authentication Actions ---
//   void login() async {
//     if (!GetUtils.isEmail(emailController.text)) {
//       Get.snackbar("Error", "Enter a valid email");
//       return;
//     }
//
//     isLoading.value = true;
//     try {
//       print("Login API calling with: ${emailController.text}");
//       // TODO: Implement your API call here
//       await Future.delayed(const Duration(seconds: 2));
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   void register() async {
//     if (validateSignUp()) {
//       isLoading.value = true;
//       try {
//         print("Register API calling for: ${nameController.text}");
//         // TODO: Implement your API call here
//         await Future.delayed(const Duration(seconds: 2));
//       } finally {
//         isLoading.value = false;
//       }
//     }
//   }
//
//   // [ADDED] Forgot Password Logic
//   void sendResetLink() async {
//     if (forgotPasswordEmailController.text.isEmpty || !GetUtils.isEmail(forgotPasswordEmailController.text)) {
//       Get.snackbar(
//         "Required",
//         "Please enter a valid email address",
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.red.withOpacity(0.1),
//         colorText: Colors.red,
//       );
//       return;
//     }
//
//     isLoading.value = true;
//     try {
//       // API Simulation
//       await Future.delayed(const Duration(seconds: 2));
//
//       Get.snackbar(
//         "Success",
//         "Reset link sent to ${forgotPasswordEmailController.text}",
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.green.withOpacity(0.1),
//         colorText: Colors.green,
//       );
//
//       // Optional: Clear field and go back
//       forgotPasswordEmailController.clear();
//       Get.back();
//
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   @override
//   void onClose() {
//     tabController.dispose();
//     nameController.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     // [ADDED] Dispose new controller
//     forgotPasswordEmailController.dispose();
//     super.onClose();
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/dashboard_screen.dart';
import '../../switch_space/choose_space_screen.dart';

class AuthController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  // --- Observable Variables ---
  var tabIndex = 0.obs;
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  var isTermsAccepted = false.obs;

  var isLoading = false.obs;

  // --- Text Controllers ---
  // [ISSUE 1 & 3]: Naye controllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final dobController = TextEditingController();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final forgotPasswordEmailController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);

    tabController.addListener(() {
      if (tabController.indexIsChanging || tabController.index != tabIndex.value) {
        tabIndex.value = tabController.index;
      }
    });
  }

  // --- Helper Methods ---
  void togglePasswordVisibility() => isPasswordVisible.toggle();
  void toggleConfirmPasswordVisibility() => isConfirmPasswordVisible.toggle();

  void toggleTerms(bool? value) => isTermsAccepted.value = value ?? false;

  // --- Validation Logic ---
  bool validateSignUp() {
    // [ISSUE 1]: First & Last Name validation
    if (firstNameController.text.isEmpty || lastNameController.text.isEmpty) {
      Get.snackbar("Error", "Please enter your First and Last name", snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    if (!GetUtils.isEmail(emailController.text)) {
      Get.snackbar("Error", "Enter a valid email", snackPosition: SnackPosition.BOTTOM);
      return false;
    }

    // [ISSUE 4]: Enhanced Password Security (At least 8 chars, 1 Upper, 1 Lower, 1 Number, 1 Special Char)
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);

    if (!regExp.hasMatch(passwordController.text)) {
      Get.snackbar(
        "Weak Password",
        "Password must be at least 8 characters long, include an uppercase letter, lowercase letter, number, and special character.",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 4), // Thoda lamba time taaki user padh sake
      );
      return false;
    }
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar("Error", "Passwords do not match", snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    return true;
  }

  // --- Authentication Actions ---
  void login() async {
    if (!GetUtils.isEmail(emailController.text)) {
      Get.snackbar("Error", "Enter a valid email");
      return;
    }

    isLoading.value = true;
    try {
      print("Login API calling with: ${emailController.text}");

      // API Call Simulation
      await Future.delayed(const Duration(seconds: 2));

      // [FIXED]: Login successful hone ke baad Dashboard par redirect karna
      // Get.offAll purani saari screens clear kar dega
      Get.offAll(() => const DashboardScreen());

    } finally {
      isLoading.value = false;
    }
  }

  void register() async {
    if (validateSignUp()) {
      isLoading.value = true;
      try {
        // [FIXED] Updated print statement to use first and last name
        print("Register API calling for: ${firstNameController.text} ${lastNameController.text}");

        // TODO: Implement your API call here
        await Future.delayed(const Duration(seconds: 2));

        // [FIXED]: Sign up success hone ke baad Choose Space Screen par bhej dein
        // Get.offAll use kiya hai taaki pichli sign up screen stack se clear ho jaye
        Get.offAll(() => const ChooseSpaceScreen());

      } finally {
        isLoading.value = false;
      }
    }
  }

  // [ADDED] Forgot Password Logic
  void sendResetLink() async {
    if (forgotPasswordEmailController.text.isEmpty || !GetUtils.isEmail(forgotPasswordEmailController.text)) {
      Get.snackbar(
        "Required",
        "Please enter a valid email address",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
      return;
    }

    isLoading.value = true;
    try {
      // API Simulation
      await Future.delayed(const Duration(seconds: 2));

      Get.snackbar(
        "Success",
        "Reset link sent to ${forgotPasswordEmailController.text}",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
      );

      // Optional: Clear field and go back
      forgotPasswordEmailController.clear();
      Get.back();

    } finally {
      isLoading.value = false;
    }
  }

  // [ISSUE 3]: Select DOB logic
  Future<void> selectDOB(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 365 * 18)), // Default 18 years ago
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      dobController.text = "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
    }
  }

  @override
  void onClose() {
    tabController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    dobController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    forgotPasswordEmailController.dispose();
    super.onClose();
  }
}