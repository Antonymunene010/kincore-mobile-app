import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/features/screens/role_selection_screen/role_selcetion_screen.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/custom_button.dart';
import 'widget/space_card.dart';

class SwitchSpaceScreen extends StatelessWidget {
  const SwitchSpaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Maan lijiye ye data API se aa raha hai
    final List<Map<String, dynamic>> dummySpaces = [
      {
        "name": "The Anderson Family",
        "members": "12",
        "online": true,
        "image": "assets/images/Ellipse.png",
      },
      {
        "name": "The Niva Family",
        "members": "10",
        "online": false,
        "image": "https://images.unsplash.com/photo-1511895426328-dc8714191300",
      },
      {
        "name": "The Saddon Family",
        "members": "8",
        "online": true,
        "image": "https://images.unsplash.com/photo-1544005313-94ddf0286df2",
      },
      {
        "name": "The Mahajan Family",
        "members": "6",
        "online": false,
        "image": "https://images.unsplash.com/photo-1529333166437-7750a6dd5a70",
      },
    ];

    var selectedIndex = 0.obs; // GetX variable for selection

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: AppText(
          "Switch Space",
          fontSize: 20,
          fontWeight: AppFonts.semiBold,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.to(RoleAccessScreen());
            },
            child: AppText(
              "Done",
              fontSize: 14,
              color: AppColors.orangeColor,
              fontWeight: AppFonts.semiBold,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            AppText(
              "Current Space",
              fontSize: 16,
              fontWeight: AppFonts.semiBold,
            ),
            const SizedBox(height: 15),

            // Current Active Space
            Obx(() => SpaceCard(
                name: dummySpaces[selectedIndex.value]['name'],
                members: dummySpaces[selectedIndex.value]['members'],
                imageUrl: dummySpaces[selectedIndex.value]['image'],
                isActive: true,
                isOnline: dummySpaces[selectedIndex.value]['online'],
                onTap: () {},
              ),
            ),

            const SizedBox(height: 10),
            AppText("Other Space", fontSize: 16, fontWeight: AppFonts.semiBold),
            const SizedBox(height: 15),

            // List of Other Spaces
            Expanded(
              child: ListView.builder(
                itemCount: dummySpaces.length,
                itemBuilder: (context, index) {
                  return Obx(
                    () => SpaceCard(
                      name: dummySpaces[index]['name'],
                      members: dummySpaces[index]['members'],
                      imageUrl: dummySpaces[index]['image'],
                      // imageUrl: "https://via.placeholder.com/150",
                      isActive: selectedIndex.value == index,
                      isOnline: false,
                      onTap: () => selectedIndex.value = index,
                    ),
                  );
                },
              ),
            ),

            // Bottom Action Button
            CustomButton(
              text: "Confirm Switch",
              onPressed: () {

                Get.snackbar(
                  "Space Switched",
                  "You are now in ${dummySpaces[selectedIndex.value]['name']}",
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
