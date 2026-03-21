import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import 'package:kincore_app/core/utils/app_images_const.dart';
import 'package:kincore_app/core/utils/fetch_pixels.dart';
import 'package:kincore_app/core/widgets/custom_widgets.dart';
import 'package:kincore_app/features/screens/switch_space/switch_space_screen.dart';
import '../../../core/widgets/app_text.dart';
import '../onboarding_screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _goNext();
  }

  void _goNext() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.off(() => OnboardingScreen());
    // Get.off(() => const SwitchSpaceScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Image ke hisab se background color orange hona chahiye
      backgroundColor: AppColors.orangeColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo Image
          // Image path check kar lena jo aapne rakha ho

          CustomAssetImage(imageName: AppImagesConst.splashLogo,color: Colors.white,height: FetchPixels.h(400),
            width: double.infinity,),

          // const SizedBox(height: 10), // Image aur Text ke beech gap

          // KinCore Text
          // AppText(
          //   "Kincore",
          //     fontSize: 45,
          //     fontWeight: FontWeight.bold,
          //     color: Colors.white,
          //     letterSpacing: 1.2,
          //   ),
        ],
      ),
    );
  }
}