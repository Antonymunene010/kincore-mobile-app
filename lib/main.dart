// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:kincore_app/core/utils/fetch_pixels.dart';
// // import 'package:kincore_app/core/utils/app_theme.dart';
// // import 'core/localization/app_translations.dart';
// // import 'features/screens/splash_screen/splash_screen.dart';
// //
// // void main() {
// //   runApp(const MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     FetchPixels.init(context);
// //     return GetMaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       theme: AppTheme.lightTheme,
// //       darkTheme: AppTheme.darkTheme,
// //       themeMode: ThemeMode.dark,
// //       // 🌍 Localization setup
// //       translations: AppTranslations(),
// //       locale: const Locale('en', 'US'), // default
// //       fallbackLocale: const Locale('en', 'US'),
// //       home: const SplashScreen(),
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kincore_app/core/utils/fetch_pixels.dart';
// import 'package:kincore_app/core/utils/app_theme.dart';
// import 'core/localization/app_translations.dart';
// import 'core/utils/app_theme_controller.dart';
// import 'features/screens/splash_screen/splash_screen.dart';
//
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   Get.put(ThemeController());
//
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     FetchPixels.init(context);
//
//     final themeController = Get.find<ThemeController>();
//
//     return Obx(
//           () => GetMaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: AppTheme.lightTheme,
//         darkTheme: AppTheme.darkTheme,
//         themeMode: themeController.currentTheme.value,
//
//         /// 🌍 Localization setup
//         translations: AppTranslations(),
//         // locale: const Locale('en', 'US'),
//         fallbackLocale: const Locale('en', 'US'),
//
//         home: const SplashScreen(),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart'; // GetStorage import karein
import 'package:kincore_app/core/utils/fetch_pixels.dart';
import 'package:kincore_app/core/utils/app_theme.dart';
import 'core/localization/app_translations.dart';
import 'core/utils/app_theme_controller.dart'; // Aapke naye ThemeController ka path
import 'features/screens/splash_screen/splash_screen.dart';

void main() async {
  // Binding aur Storage pehle initialize karna zaroori hai
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  // Controller ko yahi pe memory me daal do
  Get.put(ThemeController(), permanent: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FetchPixels.init(context);

    // Controller Get karein
    final themeController = Get.find<ThemeController>();

    return Obx(
          () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,

        // [FIX]: Yahan par hamne apna naya getter lagaya hai jo ThemeMode return karega
        themeMode: themeController.themeMode,

        /// 🌍 Localization setup
        translations: AppTranslations(),
        fallbackLocale: const Locale('en', 'US'),

        home: const SplashScreen(),
      ),
    );
  }
}