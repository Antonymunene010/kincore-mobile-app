import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_text.dart';
import '../../../core/widgets/custom_network_image.dart'; // Add caching image widget

class EventDetailScreen extends StatelessWidget {
  const EventDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // API ya list se jo data pass kiya tha wo yahan fetch hoga
    final event = Get.arguments;

    // RESPONSIVE VARIABLES
    final double screenW = Get.width;
    final double screenH = Get.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- TOP IMAGE WITH BACK BUTTON (RESPONSIVE HEIGHT) ---
            Stack(
              children: [
                CustomNetworkImage(
                  imageUrl: event.imageUrl, // Dynamic Image with Caching
                  width: double.infinity,
                  height: screenH * 0.45, // Responsive height (approx 350-400 on most phones)
                  borderRadius: 0, // No radius for top image
                ),
                Positioned(
                  top: screenH * 0.06, // Responsive top padding
                  left: screenW * 0.05, // Responsive left padding
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_back_ios_new, size: 20, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),

            // --- CONTENT SECTION (WHITE RADIUS BOX) ---
            Transform.translate(
              offset: const Offset(0, -30),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: screenW * 0.05, vertical: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)), // FIXED RADIUS
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Event Title
                    AppText(
                      event.title,
                      fontSize: 22, // FIXED
                      fontWeight: AppFonts.semiBold,
                    ),
                    SizedBox(height: screenH * 0.02), // RESPONSIVE

                    // HOSTED BY CARD
                    Container(
                      padding: EdgeInsets.all(screenW * 0.03), // RESPONSIVE
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.circular(15), // FIXED
                      ),
                      child: Row(
                        children: [
                          CustomNetworkImage(
                            imageUrl: 'https://i.pravatar.cc/150?u=a', // Host Image Caching
                            height: 50, // radius 25 * 2
                            width: 50,
                            borderRadius: 25, // FIXED Circle
                          ),
                          SizedBox(width: screenW * 0.04),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText("HOSTED BY", fontSize: 12, color: Colors.grey.shade600, fontWeight: AppFonts.bold),
                              AppText("Arthur Pendragon", fontSize: 16, fontWeight: AppFonts.medium),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenH * 0.03), // RESPONSIVE

                    // DATE ROW
                    _buildInfoRow(Icons.calendar_month_outlined, "${event.date} / 12:30 PM", screenW),
                    SizedBox(height: screenH * 0.02),

                    // LOCATION ROW
                    _buildInfoRow(Icons.location_on, event.location, screenW, isUnderline: true),
                    SizedBox(height: screenH * 0.04),

                    // ACTIONS SECTION
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText("Are You Going?", fontSize: 16, fontWeight: AppFonts.semiBold),
                        AppText("Response Required", fontSize: 12, color: Colors.grey),
                      ],
                    ),
                    SizedBox(height: screenH * 0.02),

                    // RSVP BUTTONS
                    Row(
                      children: [
                        _buildRSVPButton("Going", AppColors.orangeColor, true),
                        SizedBox(width: screenW * 0.02),
                        _buildRSVPButton("May Be", Colors.white, false),
                        SizedBox(width: screenW * 0.02),
                        _buildRSVPButton("No", Colors.white, false),
                      ],
                    ),
                    SizedBox(height: screenH * 0.05), // Bottom padding
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- HELPERS (Responsive gaps applied) ---
  Widget _buildInfoRow(IconData icon, String text, double screenW, {bool isUnderline = false}) {
    return Row(
      children: [
        Icon(icon, color: AppColors.orangeColor, size: 24),
        SizedBox(width: screenW * 0.04),
        Expanded(
          child: AppText(
            text,
            fontSize: 16, // FIXED
            fontWeight: AppFonts.medium,
          ),
        ),
      ],
    );
  }

  Widget _buildRSVPButton(String text, Color bgColor, bool isSelected) {
    return Expanded(
      child: Container(
        height: 45, // FIXED
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(25), // FIXED
          border: Border.all(color: isSelected ? bgColor : Colors.grey.shade300),
        ),
        child: AppText(
          text,
          color: isSelected ? Colors.white : Colors.black,
          fontSize: 14, // FIXED
          fontWeight: AppFonts.medium,
        ),
      ),
    );
  }
}