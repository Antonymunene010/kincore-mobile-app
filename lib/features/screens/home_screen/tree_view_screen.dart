import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/widgets/custom_icon_button.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_text.dart';

class TreeScreen extends StatefulWidget {
  const TreeScreen({super.key});

  @override
  State<TreeScreen> createState() => _TreeScreenState();
}

class _TreeScreenState extends State<TreeScreen> {
  final TextEditingController searchController = TextEditingController();

  /// Logic to handle API search calls when text changes.
  void onSearchChanged(String query) {
    // API calling logic will go here
    debugPrint("Searching for member: $query");
  }

  @override
  Widget build(BuildContext context) {
    /// Responsive helper variables for dynamic spacing.
    final double screenWidth = Get.width;
    final double screenHeight = Get.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: AppText(
          "The Harrison Clan",
          fontSize: 20, // Fixed Font Size
          fontWeight: AppFonts.semiBold,
        ),
        actions: [
          CustomIconButton(iconName: 'bell.svg', onTap: (){},),
          SizedBox(width: screenWidth * 0.02), // Responsive Width
        ],
      ),
      body: Column(
        children: [
          /// 1. Responsive Search Bar Section
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.015,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey.shade200),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: TextField(
                controller: searchController,
                onChanged: onSearchChanged,
                decoration: const InputDecoration(
                  hintText: "Find Family Member",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  prefixIcon: Icon(Icons.search, color: Colors.black54),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
          ),

          /// 2. Responsive Generation Info Badge
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04,
              vertical: screenHeight * 0.008,
            ),
            decoration: BoxDecoration(
              color: AppColors.orangeColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: AppText(
              "4 Generation / 24 Member",
              color: AppColors.orangeColor,
              fontSize: 12, // Fixed Font Size
              fontWeight: AppFonts.semiBold,
            ),
          ),

          SizedBox(height: screenHeight * 0.015),

          /// 3. Middle Section: WebView / Tree Placeholder
          /// This area will hold the web-based family tree view.
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: const Center(
                    child: AppText(
                      "Web Tree View Content",
                      color: Colors.grey,
                      fontSize: 14, // Fixed Font Size
                    ),
                  ),
                ),

                /// Floating Zoom Controls positioned responsively.
                Positioned(
                  right: screenWidth * 0.05,
                  top: screenHeight * 0.02,
                  child: Column(
                    children: [
                      _buildZoomButton(Icons.add),
                      SizedBox(height: screenHeight * 0.012),
                      _buildZoomButton(Icons.remove),
                      SizedBox(height: screenHeight * 0.012),
                      _buildZoomButton(Icons.gps_fixed),
                    ],
                  ),
                ),
              ],
            ),
          ),

          /// 4. Responsive Add Member Button using CustomButton (Dotted Border)
          // Padding(
          //   padding: EdgeInsets.symmetric(
          //     horizontal: screenWidth * 0.05,
          //     vertical: screenHeight * 0.02,
          //   ),
          //   child: CustomButton(
          //     text: "Add Member",
          //     icon: Icons.add_circle_outline,
          //     onPressed: () {
          //       Get.to(AddParentsScreen());
          //     },
          //     isDotted: true, // Use the new dotted border property
          //     backgroundColor: Colors.white,
          //     foregroundColor: AppColors.orangeColor,
          //     borderColor: AppColors.orangeColor,
          //   ),
          // ),
          /// Spacer for floating Bottom Navigation Bar.
          SizedBox(height: screenHeight * 0.1),
        ],
      ),
    );
  }

  /// Helper widget to build responsive zoom control buttons.
  Widget _buildZoomButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.orangeColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: AppColors.orangeColor, size: 20),
    );
  }
}