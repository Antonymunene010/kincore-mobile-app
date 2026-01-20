import 'package:flutter/material.dart';
import '../../../core/utils/app_text.dart';
import '../../../core/utils/app_fonts.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Alignment alignment;

  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.alignment = Alignment.centerRight,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: const Size(0, 0),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: AppText(
          text,
          fontSize: 14,
          fontWeight: AppFonts.semiBold,
          underline: true,
        ),
      ),
    );
  }
}