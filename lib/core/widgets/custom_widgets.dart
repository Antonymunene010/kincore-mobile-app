import 'package:flutter/material.dart';

class CustomAssetImage extends StatelessWidget {
  final String imageName;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Color? color;

  const CustomAssetImage({
    super.key,
    required this.imageName, // Sirf file ka naam pass karein
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageName, // Base path yahan set kar diya
      height: height,
      width: width,
      fit: fit,
      color: color,
      // Image load hote waqt agar koi error aaye toh ye handle karega
      errorBuilder: (context, error, stackTrace) {
        return Icon(
          Icons.image_not_supported,
          size: height ?? 40,
          color: Colors.grey,
        );
      },
    );
  }
}