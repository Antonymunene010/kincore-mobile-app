// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'app_text.dart';
// import '../../../core/utils/app_fonts.dart';
//
// class CustomInputField extends StatelessWidget {
//   final String label;
//   final String hint;
//   final TextEditingController? controller;
//   final bool showCheck;
//   final bool isFiiled;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;
//   final FontWeight? labelFontWeight;
//   final int? maxLines;
//   final Function(String)? onChanged;
//
//   const CustomInputField({
//     super.key,
//     required this.label,
//     required this.hint,
//     this.controller,
//     this.showCheck = false,
//     this.prefixIcon,
//     this.suffixIcon,
//     this.isFiiled = false,
//     this.labelFontWeight,
//     this.maxLines,
//     this.onChanged,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final colors = theme.colorScheme;
//
//     final double screenW = Get.width;
//     final double screenH = Get.height;
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (label.isNotEmpty)
//           Padding(
//             padding: EdgeInsets.only(
//               top: screenH * 0.02,
//               bottom: screenH * 0.01,
//             ),
//             child: AppText(
//               label,
//               fontSize: 14,
//               fontWeight: labelFontWeight ?? AppFonts.semiBold,
//               color: colors.onSurface,
//             ),
//           ),
//         TextField(
//           controller: controller,
//           onChanged: onChanged,
//           maxLines: maxLines ?? 1,
//           minLines: maxLines != null ? 3 : 1,
//           textAlignVertical: (maxLines != null && maxLines! > 1)
//               ? TextAlignVertical.top
//               : TextAlignVertical.center,
//           style: TextStyle(
//             color: colors.onSurface,
//             fontSize: 14,
//           ),
//           decoration: InputDecoration(
//             hintText: hint,
//             prefixIcon: prefixIcon,
//             hintStyle: TextStyle(
//               color: colors.onSurfaceVariant.withOpacity(0.6),
//               fontSize: 14,
//               fontFamily: AppFonts.poppins
//             ),
//             suffixIcon: suffixIcon ??
//                 (showCheck
//                     ? Icon(
//                   Icons.check,
//                   color: colors.onSurfaceVariant,
//                   size: 20,
//                 )
//                     : null),
//             filled: isFiiled,
//             fillColor: colors.surface,
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(18),
//               borderSide: BorderSide(
//                 color: colors.outlineVariant,
//               ),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(18),
//               borderSide: BorderSide(
//                 color: colors.primary,
//                 width: 1.5,
//               ),
//             ),
//             contentPadding: EdgeInsets.symmetric(
//               horizontal: screenW * 0.04,
//               vertical: screenH * 0.018,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_text.dart'; // Make sure path is correct
import '../../../core/utils/app_fonts.dart'; // Make sure path is correct

class CustomInputField extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final bool showCheck;
  final bool isFiiled; // Kept spelling as per your code
  final Widget? prefixIcon;
  final Color? color;
  final Widget? suffixIcon;
  final FontWeight? labelFontWeight;
  final int? maxLines;
  final Function(String)? onChanged;

  // [EXISTING] New properties from previous step
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  // [ADDED] Password property
  final bool isPassword;

  const CustomInputField({
    super.key,
    required this.label,
    required this.hint,
    this.color,
    this.controller,
    this.showCheck = false,
    this.prefixIcon,
    this.suffixIcon,
    this.isFiiled = false,
    this.labelFontWeight,
    this.maxLines,
    this.onChanged,
    this.keyboardType,
    this.textInputAction,
    // [ADDED] Default is false
    this.isPassword = false,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  // Variable to track visibility state
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final double screenW = Get.width;
    final double screenH = Get.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(
              top: screenH * 0.02,
              bottom: screenH * 0.01,
            ),
            child: AppText(
              widget.label,
              fontSize: 14,
              fontWeight: widget.labelFontWeight ?? AppFonts.semiBold,
              color: colors.onSurface,
            ),
          ),
        TextField(
          controller: widget.controller,
          onChanged: widget.onChanged,

          // [ADDED] Logic for password obscuring
          // If isPassword is true, use _obscureText state. Else, false.
          obscureText: widget.isPassword ? _obscureText : false,

          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,

          // Logic to prevent multi-line if it is a password field
          maxLines: widget.isPassword ? 1 : (widget.maxLines ?? 1),
          minLines: (widget.maxLines != null && !widget.isPassword) ? 3 : 1,

          textAlignVertical: (widget.maxLines != null && widget.maxLines! > 1)
              ? TextAlignVertical.top
              : TextAlignVertical.center,
          style: TextStyle(
            color: colors.onSurface,
            fontSize: 14,
            fontFamily: AppFonts.poppins,
          ),
          decoration: InputDecoration(
            hintText: widget.hint,
            prefixIcon: widget.prefixIcon,
            hintStyle: TextStyle(
                color: colors.onSurfaceVariant.withOpacity(0.6),
                fontSize: 14,
                fontFamily: AppFonts.poppins
            ),

            // [UPDATED] Suffix Icon Logic
            suffixIcon: widget.isPassword
                ? IconButton(
              icon: Icon(
                // Toggle icon based on state
                _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                color: colors.onSurfaceVariant,
                size: 20,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            )
                : widget.suffixIcon ??
                (widget.showCheck
                    ? Icon(
                  Icons.check,
                  color: colors.onSurfaceVariant,
                  size: 20,
                )
                    : null),

            filled: widget.isFiiled,
            fillColor: colors.surface,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(
                color: colors.outlineVariant,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(
                color: colors.primary,
                width: 1.5,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: screenW * 0.04,
              vertical: screenH * 0.018,
            ),
          ),
        ),
      ],
    );
  }
}
