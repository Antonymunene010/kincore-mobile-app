import 'package:flutter/material.dart';
import 'dart:ui';
import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';
import '../utils/app_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final bool isDotted;
  // Naye parameters add kiye hain
  final double? width;
  final double height;
  final double? fontSize; // Font size bhi customize karne ka option

  const CustomButton({
    required this.text,
    required this.onPressed,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.isDotted = false,
    this.width, // Optional: default full width lega
    this.height = 52, // Default height 52 rakhi hai
    this.fontSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity, // Agar width null hai to full width
      height: height,
      child: isDotted
          ? _buildDottedButton()
          : _buildNormalButton(),
    );
  }

  /// Builds the solid button with correct default text color (White).
  Widget _buildNormalButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.orangeColor,
        foregroundColor: foregroundColor ?? AppColors.whiteColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(height / 2), // Height ke hisab se perfect round
          side: BorderSide(
            color: borderColor ?? backgroundColor ?? AppColors.orangeColor,
            width: 1.5,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
      ),
      onPressed: onPressed,
      child: _buildButtonContent(foregroundColor ?? AppColors.whiteColor),
    );
  }

  /// Builds the dotted button with correct default text color (Orange).
  Widget _buildDottedButton() {
    return GestureDetector(
      onTap: onPressed,
      child: CustomPaint(
        painter: _DottedPainter(
          color: borderColor ?? AppColors.orangeColor,
          radius: height / 2, // Painter ko bhi dynamic radius diya
        ),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.transparent,
            borderRadius: BorderRadius.circular(height / 2),
          ),
          child: _buildButtonContent(foregroundColor ?? AppColors.orangeColor),
        ),
      ),
    );
  }

  /// Common content with dynamic [textColor] support.
  Widget _buildButtonContent(Color textColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min, // Chote button ke liye content center rakhega
      children: [
        if (icon != null) ...[
          Icon(icon, size: height * 0.38, color: textColor), // Icon size height ke hisab se scale hoga
          const SizedBox(width: 8),
        ],
        AppText(
          text,
          fontSize: fontSize ?? 16,
          fontWeight: AppFonts.semiBold,
          color: textColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

/// Painter updated with dynamic radius
class _DottedPainter extends CustomPainter {
  final Color color;
  final double radius;
  _DottedPainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 5, dashSpace = 3, startX = 0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    RRect rRect = RRect.fromLTRBR(0, 0, size.width, size.height, Radius.circular(radius));
    Path path = Path()..addRRect(rRect);

    for (PathMetric pathMetric in path.computeMetrics()) {
      startX = 0; // Reset for each metric
      while (startX < pathMetric.length) {
        canvas.drawPath(pathMetric.extractPath(startX, startX + dashWidth), paint);
        startX += dashWidth + dashSpace;
      }
    }
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true; // Re-paint on size change
}