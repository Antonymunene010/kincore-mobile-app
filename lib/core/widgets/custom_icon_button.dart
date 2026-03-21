import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

/// A reusable icon button with touch feedback (ripple effect).
class CustomIconButton extends StatelessWidget {
  final String? iconName; // Optional kar diya
  final IconData? iconData; // Naya parameter
  final VoidCallback onTap;
  final double? size;
  final Color? backgroundColor;
  final double borderRadius;
  final Color? iconColor;

  const CustomIconButton({
    super.key,
    this.iconName, // Ab ye mandatory nahi hai
    this.iconData, // Flutter icon ke liye
    required this.onTap,
    this.size,
    this.backgroundColor,
    this.borderRadius = 10.0,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = Get.width;

    // Icon decide karne ka logic
    Widget iconWidget;

    if (iconData != null) {
      // Agar Flutter Icon use karna ho
      iconWidget = Icon(
        iconData,
        size: size ?? 24,
        color: iconColor,
      );
    } else if (iconName != null) {
      // Purana SVG/Image logic
      final String fullPath = "assets/icons/$iconName";
      final bool isSvg = iconName!.toLowerCase().endsWith('.svg');

      iconWidget = isSvg
          ? SvgPicture.asset(
        fullPath,
        width: size ?? 24,
        height: size ?? 24,
        colorFilter: iconColor != null
            ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
            : null,
      )
          : Image.asset(
        fullPath,
        width: size ?? 24,
        height: size ?? 24,
        color: iconColor,
      );
    } else {
      iconWidget = const SizedBox.shrink();
    }

    return Material(
      color: backgroundColor ?? Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        splashColor: iconColor?.withOpacity(0.1) ?? Colors.black12,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: iconWidget,
        ),
      ),
    );
  }
}