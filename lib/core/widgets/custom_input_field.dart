import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text.dart';
import '../../../core/utils/app_fonts.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final bool showCheck;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FontWeight? labelFontWeight;
  final int? maxLines; // <--- Max lines ka option add kiya
  final Function(String)? onChanged;

  const CustomInputField({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.showCheck = false,
    this.prefixIcon,
    this.suffixIcon,
    this.labelFontWeight,
    this.maxLines, // Constructor me add kiya (default null matlab 1 line)
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    // RESPONSIVE VARIABLES
    final double screenW = Get.width;
    final double screenH = Get.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label logic
        if (label.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(
                top: screenH * 0.02,
                bottom: screenH * 0.01
            ), // RESPONSIVE
            child: AppText(
                label,
                fontSize: 16, // FIXED
                fontWeight: labelFontWeight ?? AppFonts.bold
            ),
          ),
        TextField(
          controller: controller,
          onChanged: onChanged,
          // Agar maxLines 1 se zyada hai toh alignment top rakhenge taki text upar se start ho
          textAlignVertical: (maxLines != null && maxLines! > 1)
              ? TextAlignVertical.top
              : TextAlignVertical.center,
          maxLines: maxLines ?? 1, // Jitni lines pass karoge utna bada hoga
          minLines: maxLines != null ? 3 : 1, // Agar maxLines di hai toh minimum 3 line dikhegi
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: prefixIcon,
            hintStyle: TextStyle(
              color: AppColors.greyColor.withOpacity(0.5),
              fontSize: 14, // FIXED
            ),
            suffixIcon: suffixIcon ?? (showCheck
                ? const Icon(Icons.check, color: Colors.grey, size: 20)
                : null),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8), // FIXED RADIUS
              borderSide: BorderSide(color: AppColors.greyColor.withOpacity(0.3)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8), // FIXED RADIUS
              borderSide: BorderSide(color: AppColors.orangeColor),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: screenW * 0.04, // RESPONSIVE
              vertical: screenH * 0.018, // RESPONSIVE
            ),
          ),
        ),
      ],
    );
  }
}