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
    required this.imageName, // "logo.png"
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.color,
    this.borderRadius = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
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
              color: colors.surfaceVariant,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Icon(
              Icons.image_not_supported_outlined,
              color: colors.onSurfaceVariant,
            ),
          );
        },
      ),
    );
  }
}
