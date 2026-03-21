// import 'package:flutter/material.dart';
// import 'package:kincore_app/core/utils/app_colors.dart';
//
// class TimelineLine extends StatelessWidget {
//   const TimelineLine({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CircleAvatar(radius: 7, backgroundColor: AppColors.orangeColor), // Node point
//         Expanded(
//           child: Container(
//             width: 2,
//             color: AppColors.orangeColor.withOpacity(0.4), // Connecting line
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:kincore_app/core/utils/app_colors.dart';

class TimelineLine extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isGenerationStart;
  final bool isDashed; // Agar ye true hai to dotted line banegi
  final double branchOffset; // Horizontal line ki height adjust karne ke liye

  const TimelineLine({
    super.key,
    required this.isFirst,
    required this.isLast,
    this.isGenerationStart = false,
    this.isDashed = false,
    this.branchOffset = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      child: CustomPaint(
        painter: _TreePainter(
          isFirst: isFirst,
          isLast: isLast,
          isGenerationStart: isGenerationStart,
          isDashed: isDashed,
          branchY: branchOffset,
          color: AppColors.orangeColor,
        ),
      ),
    );
  }
}

class _TreePainter extends CustomPainter {
  final bool isFirst;
  final bool isLast;
  final bool isGenerationStart;
  final bool isDashed;
  final double branchY;
  final Color color;

  _TreePainter({
    required this.isFirst,
    required this.isLast,
    required this.isGenerationStart,
    required this.isDashed,
    required this.branchY,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final Paint dotPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final double centerX = size.width / 2;

    /// 1. Draw Vertical Line (Main Line)

    // Upar se aane wali line
    if (!isFirst) {
      if (isDashed && !isGenerationStart) { // Sirf tab dotted karo jab ye child node ho aur generation start na ho
        _drawDashedLine(canvas, paint, Offset(centerX, 0), Offset(centerX, branchY));
      } else {
        canvas.drawLine(Offset(centerX, 0), Offset(centerX, branchY), paint);
      }
    }

    // Niche jaane wali line
    if (!isLast) {
      if (isDashed && !isGenerationStart) {
        _drawDashedLine(canvas, paint, Offset(centerX, branchY), Offset(centerX, size.height));
      } else {
        canvas.drawLine(Offset(centerX, branchY), Offset(centerX, size.height), paint);
      }
    }

    /// 2. Draw Horizontal Branch (To the Card)
    // Ye line hamesha solid rahegi taaki card connect ho sake
    canvas.drawLine(Offset(centerX, branchY), Offset(size.width, branchY), paint);

    /// 3. Draw Dots
    // Bada Dot tabhi banega jab Nayi Generation shuru ho ya First Item ho
    if (isGenerationStart || isFirst) {
      canvas.drawCircle(Offset(centerX, branchY), 6, dotPaint);
    }
  }

  // Helper: Dotted Line Draw karne ke liye
  void _drawDashedLine(Canvas canvas, Paint paint, Offset start, Offset end) {
    const double dashWidth = 4;
    const double dashSpace = 3;
    double startY = start.dy;

    bool drawingDown = end.dy > start.dy;

    while (drawingDown ? (startY < end.dy) : (startY > end.dy)) {
      canvas.drawLine(
        Offset(start.dx, startY),
        Offset(start.dx, startY + (drawingDown ? dashWidth : -dashWidth)),
        paint,
      );
      startY += (drawingDown ? (dashWidth + dashSpace) : -(dashWidth + dashSpace));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}