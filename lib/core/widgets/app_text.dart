import 'package:flutter/material.dart';
import '../utils/app_fonts.dart';

class AppText extends StatelessWidget {
  final String text;

  // Style
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final Gradient? gradient;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height;

  // Layout
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  // Behavior
  final bool underline;
  final bool strikeThrough;

  const AppText(
      this.text, {
        super.key,
        this.fontSize,
        this.fontWeight,
        this.color,
        this.gradient,
        this.letterSpacing,
        this.wordSpacing,
        this.height,
        this.textAlign,
        this.overflow,
        this.maxLines,
        this.underline = false,
        this.strikeThrough = false,
      });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final baseStyle = theme.textTheme.bodyMedium ?? const TextStyle();

    final textWidget = Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: baseStyle.copyWith(
        fontFamily: AppFonts.poppins,
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? baseStyle.fontWeight,
        color: gradient == null
            ? (color ?? baseStyle.color)
            : Colors.white, // required for ShaderMask
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        height: height,
        decoration: _decoration(),
      ),
    );

    /// ✅ Gradient Text
    if (gradient != null) {
      return ShaderMask(
        shaderCallback: (bounds) {
          return gradient!.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          );
        },
        blendMode: BlendMode.srcIn,
        child: textWidget,
      );
    }

    return textWidget;
  }

  TextDecoration? _decoration() {
    if (underline) return TextDecoration.underline;
    if (strikeThrough) return TextDecoration.lineThrough;
    return null;
  }
}
