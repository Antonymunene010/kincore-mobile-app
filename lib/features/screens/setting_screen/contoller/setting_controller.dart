import 'package:get/get.dart';
import 'package:kincore_app/features/screens/auth_flow/auth/auth_screen.dart';

class SettingController extends GetxController {
  // Theme Toggle state
  var isDarkMode = false.obs;

  void toggleTheme(bool value) {
    isDarkMode.value = value;
    // Yahan aap apna actual theme switching logic call kar sakte hain
  }

  void logout() {
    // Logout logic here
    Get.snackbar('profile.logoutTitle'.tr, 'profile.logoutSuccessMsg'.tr);
    Get.offAll(() => AuthScreen());
  }
}