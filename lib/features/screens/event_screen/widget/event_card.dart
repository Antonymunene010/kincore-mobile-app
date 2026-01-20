import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/app_text.dart';
import '../../../../core/widgets/custom_network_image.dart';
import 'package:get/get.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String date;
  final String location;
  final String status;
  final List<String> memberAvatars;
  final VoidCallback onTap;

  const EventCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.date,
    required this.location,
    required this.status,
    required this.memberAvatars,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double screenW = Get.width;
    final double screenH = Get.height;

    Color buttonColor = AppColors.orangeColor;
    if (status == "Attended") buttonColor = const Color(0xFFC05441);
    if (status == "Not Attended") buttonColor = const Color(0xFFFEB139);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: screenH * 0.02), // Responsive
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), // Fixed
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomNetworkImage(
              imageUrl: imageUrl,
              height: screenH * 0.22, // Responsive
              width: double.infinity,
              borderRadius: 16, // Fixed
            ),
            Padding(
              padding: EdgeInsets.all(screenW * 0.03), // Responsive
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(title, fontSize: 18, fontWeight: AppFonts.semiBold, maxLines: 1),
                  SizedBox(height: screenH * 0.01),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today_outlined, size: 16, color: AppColors.orangeColor),
                      const SizedBox(width: 4),
                      AppText(date, fontSize: 12, color: Colors.grey.shade600),
                      SizedBox(width: screenW * 0.03),
                      const Icon(Icons.location_on_outlined, size: 16, color: AppColors.orangeColor),
                      const SizedBox(width: 4),
                      Expanded(
                        child: AppText(location, fontSize: 12, color: Colors.grey.shade600, maxLines: 1, overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                  SizedBox(height: screenH * 0.015),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: screenW * 0.25,
                        height: 32,
                        child: Stack(
                          children: List.generate(
                            memberAvatars.length > 3 ? 4 : memberAvatars.length,
                                (index) {
                              if (index == 3) {
                                return Positioned(
                                  left: index * 22,
                                  child: CircleAvatar(radius: 16, backgroundColor: Colors.grey.shade300, child: AppText("+${memberAvatars.length - 3}", fontSize: 10)),
                                );
                              }
                              return Positioned(
                                left: index * 22,
                                child: Container(
                                  decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2)),
                                  child: CustomNetworkImage(imageUrl: memberAvatars[index], height: 28, width: 28, borderRadius: 50),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: onTap,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.symmetric(horizontal: screenW * 0.05),
                        ),
                        child: AppText(status, color: Colors.white, fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}