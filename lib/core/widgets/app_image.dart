import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  final String imageName;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;
  final double borderRadius;

  const AppImage({
    super.key,
    required this.imageName, // "logo.png" format
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.color,
    this.borderRadius = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    final String fullPath = "assets/images/$imageName";

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.asset(
        fullPath,
        width: width,
        height: height,
        fit: fit,
        color: color,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: const Icon(Icons.image_not_supported_outlined, color: Colors.grey),
          );
        },
      ),
    );
  }
}