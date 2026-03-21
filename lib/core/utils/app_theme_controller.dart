import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final box = GetStorage();

  // By default 'system' set rahega
  var currentThemeMode = 'system'.obs;

  @override
  void onInit() {
    super.onInit();
    // App khulte hi storage se check karega ki pehle kya select kiya tha
    currentThemeMode.value = box.read('theme') ?? 'system';
  }

  // Ye getter main.dart ke liye hai, String ko ThemeMode (Enum) mein badalne ke liye
  ThemeMode get themeMode {
    if (currentThemeMode.value == 'light') return ThemeMode.light;
    if (currentThemeMode.value == 'dark') return ThemeMode.dark;
    return ThemeMode.system;
  }

  // Settings screen ke Radio Buttons ke liye function
  void setTheme(String mode) {
    currentThemeMode.value = mode;
    box.write('theme', mode); // Choice save kar li

    if (mode == 'light') {
      Get.changeThemeMode(ThemeMode.light);
    } else if (mode == 'dark') {
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      Get.changeThemeMode(ThemeMode.system);
    }
  }

  // Agar kahin sun/moon toggle button use kar rahe ho uske liye
  void toggleTheme() {
    if (currentThemeMode.value == 'dark') {
      setTheme('light');
    } else {
      setTheme('dark');
    }
  }

  // Agar kahin UI check karna ho ki currently dark hai ya nahi
  bool get isDark {
    if (currentThemeMode.value == 'system') {
      return Get.isPlatformDarkMode; // System setting read karega
    }
    return currentThemeMode.value == 'dark';
  }
}