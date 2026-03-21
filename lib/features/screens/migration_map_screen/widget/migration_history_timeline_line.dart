import 'package:flutter/material.dart';
import 'package:kincore_app/core/utils/app_colors.dart';

class HistoryTimelineLine extends StatelessWidget {
  final String imageUrl;
  final bool isLast;
  const HistoryTimelineLine({super.key, required this.imageUrl, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: AppColors.orangeColor,
          child: CircleAvatar(radius: 20, backgroundImage: NetworkImage(imageUrl)),
        ),
        if (!isLast)
          Expanded(
            child: Container(
              width: 2,
              color: AppColors.orangeColor.withOpacity(0.5),
            ),
          ),
      ],
    );
  }
}