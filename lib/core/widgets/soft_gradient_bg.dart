import 'dart:ui';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class SoftGradientBackground extends StatelessWidget {
  final Widget child;
  final bool enableBlur;

  const SoftGradientBackground({
    super.key,
    required this.child,
    this.enableBlur = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// -------- Gradient Layer --------
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.orangeShadeColor,
                Colors.white,
                AppColors.greenShadeColor,
              ],
            ),
          ),
        ),

        /// -------- Optional Blur Layer --------
        if (enableBlur)
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 60,
              sigmaY: 60,
            ),
            child: Container(color: Colors.transparent),
          ),

        /// -------- Screen Content --------
        child,
      ],
    );
  }
}
