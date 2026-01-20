import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_fonts.dart';

class AppText extends StatelessWidget {
  final String text;

  // Style
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final Gradient? gradient; // Gradient support
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height;

  // Layout
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  // Behavior
  final bool isResponsive;
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
        this.isResponsive = true,
        this.underline = false,
        this.strikeThrough = false,
      });

  @override
  Widget build(BuildContext context) {
    final double finalFontSize = _fontSize();

    Paint? paint;
    if (gradient != null) {
      // Text ka exact size measure kar lo
      final textPainter = TextPainter(
        text: TextSpan(
          text: text,
          style: TextStyle(
            fontSize: finalFontSize,
            fontWeight: fontWeight ?? AppFonts.regular,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();

      final width = textPainter.width;
      final height = textPainter.height;

      paint = Paint()
        ..shader = gradient!.createShader(Rect.fromLTWH(0, 0, width, height));
    }

    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: AppFonts.poppins,
        fontSize: finalFontSize,
        fontWeight: fontWeight ?? AppFonts.regular,
        color: (gradient == null) ? (color ?? Colors.black) : null,
        foreground: paint,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        height: height,
        decoration: _decoration(),
      ),
    );
  }

  double _fontSize() {
    final double baseSize = fontSize ?? 14;
    if (!isResponsive) return baseSize;
    return baseSize * (Get.width / 375); // Responsive scaling
  }

  TextDecoration? _decoration() {
    if (underline) return TextDecoration.underline;
    if (strikeThrough) return TextDecoration.lineThrough;
    return null;
  }
}
