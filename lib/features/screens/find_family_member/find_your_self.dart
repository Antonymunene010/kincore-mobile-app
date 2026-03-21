// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kincore_app/core/utils/app_colors.dart';
// import 'package:kincore_app/features/screens/claim_identity_screens/claim_identity_screen.dart';
// import '../../../../core/utils/app_fonts.dart';
// import '../../../core/widgets/app_text.dart';
// import '../../../core/widgets/custom_button.dart';
// import 'controller/search_family_member_controller.dart';
//
// class FindYourselfScreen extends StatelessWidget {
//   const FindYourselfScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(FamilySearchController());
//     final colors = Theme.of(context).colorScheme;
//     final isDarkMode = Theme.of(context).brightness == Brightness.dark;
//
//     // Selection track karne ke liye reactive variable
//     final selectedIndex = (-1).obs;
//
//     return Scaffold(
//       backgroundColor: isDarkMode ? colors.surface : const Color(0xFFFAFAFA), // Screenshot jaisa light off-white background
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         scrolledUnderElevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios_new, color: colors.onSurface, size: 20),
//           onPressed: () => Get.back(),
//         ),
//         title: AppText('findYourself.title'.tr, fontSize: 18, fontWeight: AppFonts.semiBold), // Hardcoded or use .tr
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 10),
//
//               // --- Subtitle Text ---
//               Center(
//                 child: AppText(
//                   'findYourself.subtitle'.tr,
//                   fontSize: 13,
//                   color: colors.onSurfaceVariant,
//                   textAlign: TextAlign.center,
//                   height: 1.4,
//                 ),
//               ),
//               const SizedBox(height: 20),
//
//               // --- Search Bar & Filter Icon Row ---
//               Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30),
//                         boxShadow: [
//                           if (!isDarkMode)
//                             BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 8, offset: const Offset(0, 2)),
//                         ],
//                       ),
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: 'findYourself.searchHint'.tr,
//                           hintStyle: TextStyle(color: colors.outline, fontSize: 14),
//                           prefixIcon: const Icon(Icons.search, color: AppColors.orangeColor), // Orange search icon
//                           // suffixIcon: const Icon(Icons.mic_none, color: Colors.grey), // Mic icon inside
//                           filled: true,
//                           fillColor: colors.surface,
//                           contentPadding: const EdgeInsets.symmetric(vertical: 15),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30),
//                             borderSide: BorderSide(color: colors.outlineVariant.withOpacity(0.3)),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30),
//                             borderSide: BorderSide(color: colors.outlineVariant.withOpacity(0.3)),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30),
//                             borderSide: const BorderSide(color: AppColors.orangeColor),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   // // Filter Button (For Country, Age, etc.)
//                   // GestureDetector(
//                   //   onTap: () {
//                   //     // Filter bottom sheet open karne ka logic
//                   //     Get.snackbar("Filters", "Open filter options (Age, Country, etc.)");
//                   //   },
//                   //   child: Container(
//                   //     padding: const EdgeInsets.all(12),
//                   //     decoration: BoxDecoration(
//                   //       color: colors.surface,
//                   //       shape: BoxShape.circle,
//                   //       border: Border.all(color: colors.outlineVariant.withOpacity(0.3)),
//                   //     ),
//                   //     child: const Icon(Icons.tune, color: AppColors.orangeColor, size: 24),
//                   //   ),
//                   // )
//                 ],
//               ),
//               const SizedBox(height: 30),
//
//               // --- Section Title ---
//               AppText('findYourself.possibleMatches'.tr, fontSize: 16, fontWeight: AppFonts.bold),
//               const SizedBox(height: 15),
//
//               // --- Results List ---
//               Expanded(
//                 child: Obx(() => ListView.builder(
//                   physics: const BouncingScrollPhysics(),
//                   itemCount: controller.foundMembers.length,
//                   itemBuilder: (context, index) {
//                     final member = controller.foundMembers[index];
//
//                     return Obx(() {
//                       bool isSelected = selectedIndex.value == index;
//                       return _buildMatchCard(
//                         member: member,
//                         isSelected: isSelected,
//                         onTap: () => selectedIndex.value = index,
//                         colors: colors,
//                       );
//                     });
//                   },
//                 )),
//               ),
//
//               // --- Bottom Actions ---
//               Center(
//                 child: TextButton(
//                   onPressed: () {},
//                   style: TextButton.styleFrom(foregroundColor: AppColors.orangeColor),
//                   child: AppText('findYourself.notListed'.tr, color: AppColors.orangeColor, fontSize: 13, fontWeight: AppFonts.semiBold),
//                 ),
//               ),
//               const SizedBox(height: 10),
//
//               CustomButton(
//                 text: 'findYourself.thisIsMe'.tr,
//                 icon: Icons.fingerprint, // Or use a custom SVG for identity
//                 isIconRight: true,
//                 height: 55,
//                 backgroundColor: AppColors.orangeColor,
//                 textColor: Colors.white,
//                 iconColor: Colors.white,
//                 onPressed: () {
//                   if (selectedIndex.value != -1) {
//                     Get.to(() => ClaimIdentityScreen());
//                   } else {
//                     Get.snackbar(
//                       'findYourself.selectionReqTitle'.tr,
//                       'findYourself.selectionReqMsg'.tr,
//                       snackPosition: SnackPosition.BOTTOM,
//                       backgroundColor: Colors.redAccent.withOpacity(0.1),
//                       colorText: Colors.red,
//                     );
//                   }
//                 },
//               ),
//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Exact Match Card UI as per screenshot
//   Widget _buildMatchCard({
//     required dynamic member, // Aap chaho to isko 'required FamilyMember member' bhi likh sakte ho
//     required bool isSelected,
//     required VoidCallback onTap,
//     required ColorScheme colors,
//   }) {
//     // [FIXED]: Object properties ko dot (.) se access kiya hai. Dummy/API data se name le raha hai
//     String name = member.name ?? "Unknown";
//
//     // Name se automatically Initials nikalne ka logic (e.g., Alex Rivera -> AR)
//     String initials = "NA";
//     if (name.isNotEmpty) {
//       List<String> nameParts = name.trim().split(' ');
//       if (nameParts.length > 1) {
//         initials = "${nameParts[0][0]}${nameParts[1][0]}".toUpperCase();
//       } else {
//         initials = name.substring(0, 1).toUpperCase();
//       }
//     }
//
//     // Note: Agar aapke FamilyMember model mein 'details' aur 'location' jese fields nahi hain,
//     // toh abhi main dummy text rakh raha hu. Jab aap model me add kar loge tab 'member.location' kar dena.
//
//     // [FIXED]: Dummy data list me jo 'relation' aa raha hai (jaise "Father", "Spouse"), wo yahan print hoga.
//     String relationDetails = member.relation != null ? "Role: ${member.relation}" : "b. 1992 • Unknown";
//     String location = "San Francisco, CA"; // Future me isko member.location kar dena
//
//     // Dynamic color for avatar background based on selection
//     Color avatarBgColor = isSelected ? AppColors.orangeColor.withOpacity(0.1) : Colors.blueAccent.withOpacity(0.1);
//     Color avatarTextColor = isSelected ? AppColors.orangeColor : Colors.blueAccent;
//
//     return GestureDetector(
//       onTap: onTap,
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 200),
//         margin: const EdgeInsets.only(bottom: 12),
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//             color: colors.surface,
//             borderRadius: BorderRadius.circular(15),
//             border: Border.all(
//               // ORANGE FRAME WHEN SELECTED
//               color: isSelected ? AppColors.orangeColor : colors.outlineVariant.withOpacity(0.2),
//               width: isSelected ? 1.5 : 1,
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.02),
//                 blurRadius: 8,
//                 offset: const Offset(0, 2),
//               )
//             ]
//         ),
//         child: Row(
//           children: [
//             // Avatar with Initials (Ya future me member.image se NetworkImage laga sakte ho)
//             Container(
//               height: 50,
//               width: 50,
//               decoration: BoxDecoration(
//                 color: avatarBgColor,
//                 shape: BoxShape.circle,
//                 border: Border.all(color: Colors.white, width: 2),
//               ),
//               child: Center(
//                 child: AppText(
//                   initials,
//                   fontSize: 16,
//                   fontWeight: AppFonts.bold,
//                   color: avatarTextColor,
//                 ),
//               ),
//             ),
//             const SizedBox(width: 15),
//
//             // Details
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   AppText(name, fontSize: 15, fontWeight: AppFonts.bold, color: colors.onSurface),
//                   const SizedBox(height: 4),
//                   AppText(relationDetails, fontSize: 12, color: colors.onSurfaceVariant),
//                   const SizedBox(height: 2),
//                   // Location Text
//                   AppText(location, fontSize: 11, color: colors.outline),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import 'package:kincore_app/features/screens/claim_identity_screens/claim_identity_screen.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/models/family_member_model.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_input_field.dart';
import 'controller/search_family_member_controller.dart';

class FindYourselfScreen extends StatelessWidget {
  const FindYourselfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FamilySearchController());
    final colors = Theme.of(context).colorScheme;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? colors.surface : const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: colors.onSurface, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText('findYourself.title'.tr, fontSize: 18, fontWeight: AppFonts.semiBold),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ==========================================
              // 1. SEARCH FORM SECTION
              // ==========================================
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colors.surface,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: colors.outlineVariant.withOpacity(0.3)),
                  boxShadow: [
                    if (!isDarkMode)
                      BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 8, offset: const Offset(0, 2)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // First & Last Name
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomInputField(
                            label: 'findYourself.firstName'.tr,
                            hint: 'findYourself.firstNameHint'.tr,
                            controller: controller.firstNameCtrl,
                            color: colors.onSurface,
                            labelFontWeight: AppFonts.medium,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomInputField(
                            label: 'findYourself.lastName'.tr,
                            hint: 'findYourself.lastNameHint'.tr,
                            controller: controller.lastNameCtrl,
                            color: colors.onSurface,
                            labelFontWeight: AppFonts.medium,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Gender Dropdown
                    AppText('findYourself.gender'.tr, fontSize: 13, fontWeight: AppFonts.medium, color: colors.onSurface),
                    const SizedBox(height: 6),
                    Obx(() => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: colors.outlineVariant.withOpacity(0.3)),
                        color: colors.surface,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: controller.selectedGender.value,
                          hint: AppText('findYourself.selectGender'.tr, color: colors.outline, fontSize: 14),
                          dropdownColor: colors.surface,
                          items: [
                            DropdownMenuItem(value: 'Male', child: AppText('findYourself.male'.tr)),
                            DropdownMenuItem(value: 'Female', child: AppText('findYourself.female'.tr)),
                            DropdownMenuItem(value: 'Other', child: AppText('findYourself.other'.tr)),
                          ],
                          onChanged: (val) => controller.selectedGender.value = val,
                        ),
                      ),
                    )),
                    const SizedBox(height: 15),

                    // DOB Field
                    GestureDetector(
                      onTap: () => controller.selectDate(context),
                      child: AbsorbPointer(
                        child: CustomInputField(
                          label: 'findYourself.dob'.tr,
                          hint: 'findYourself.dobHint'.tr,
                          controller: controller.dobCtrl,
                          color: colors.onSurface,
                          suffixIcon: const Icon(Icons.calendar_month, color: AppColors.orangeColor),
                          labelFontWeight: AppFonts.medium,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),

                    // Year-Only Toggle
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Obx(() => Checkbox(
                          value: controller.isYearOnly.value,
                          onChanged: (val) => controller.isYearOnly.value = val ?? false,
                          activeColor: AppColors.orangeColor,
                        )),
                        AppText('findYourself.yearOnly'.tr, fontSize: 13, color: colors.onSurfaceVariant),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Clear & Search Buttons
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: controller.clearFilters,
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              side: BorderSide(color: colors.outlineVariant),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: AppText('findYourself.clearBtn'.tr, color: colors.onSurfaceVariant, fontWeight: AppFonts.semiBold),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: controller.performSearch,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.orangeColor,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: AppText('findYourself.searchBtn'.tr, color: Colors.white, fontWeight: AppFonts.semiBold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // ==========================================
              // 2. DYNAMIC UI STATES SECTION
              // ==========================================
              Obx(() {
                if (!controller.hasSearched.value) {
                  return _buildStateIllustration(colors: colors, icon: Icons.person_search_rounded, title: 'findYourself.initialMsg'.tr, subtitle: '');
                }

                if (controller.hasSearched.value && controller.foundMembers.isEmpty) {
                  return Column(
                    children: [
                      _buildStateIllustration(colors: colors, icon: Icons.search_off_rounded, title: 'findYourself.noResults'.tr, subtitle: 'findYourself.noResultsSub'.tr),
                      const SizedBox(height: 15),
                      TextButton(onPressed: controller.clearFilters, child: AppText('findYourself.clearBtn'.tr, color: AppColors.orangeColor, fontWeight: AppFonts.semiBold)),
                    ],
                  );
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText('findYourself.resultsCount'.trParams({'count': controller.foundMembers.length.toString()}), fontSize: 16, fontWeight: AppFonts.bold),
                    const SizedBox(height: 15),

                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.foundMembers.length,
                      itemBuilder: (context, index) {
                        final FamilyMember member = controller.foundMembers[index]; // Apne model ko strongly type kiya
                        return Obx(() {
                          bool isSelected = controller.selectedIndex.value == index;
                          return _buildMatchCard(
                              member: member,
                              isSelected: isSelected,
                              onTap: () => controller.selectedIndex.value = index,
                              colors: colors
                          );
                        });
                      },
                    ),
                    const SizedBox(height: 20),

                    Center(child: TextButton(onPressed: () {}, style: TextButton.styleFrom(foregroundColor: AppColors.orangeColor), child: AppText('findYourself.notListed'.tr, color: AppColors.orangeColor, fontSize: 13, fontWeight: AppFonts.semiBold))),
                    const SizedBox(height: 10),

                    CustomButton(
                      text: 'findYourself.thisIsMe'.tr,
                      icon: Icons.fingerprint,
                      isIconRight: true,
                      height: 55,
                      backgroundColor: AppColors.orangeColor,
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      onPressed: () {
                        if (controller.selectedIndex.value != -1) {
                          Get.to(() => ClaimIdentityScreen());
                        } else {
                          Get.snackbar('Warning', 'Please select your profile first.', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.redAccent.withOpacity(0.1), colorText: Colors.red);
                        }
                      },
                    ),
                  ],
                );
              }),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // --- Helper Widgets ---
  Widget _buildStateIllustration({required ColorScheme colors, required IconData icon, required String title, required String subtitle}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            Container(padding: const EdgeInsets.all(25), decoration: BoxDecoration(color: colors.primaryContainer.withOpacity(0.3), shape: BoxShape.circle), child: Icon(icon, size: 70, color: AppColors.orangeColor)),
            const SizedBox(height: 25),
            AppText(title, fontSize: 16, fontWeight: AppFonts.semiBold, color: colors.onSurface, textAlign: TextAlign.center),
            if (subtitle.isNotEmpty) ...[const SizedBox(height: 8), AppText(subtitle, fontSize: 13, color: colors.onSurfaceVariant, textAlign: TextAlign.center)]
          ],
        ),
      ),
    );
  }

  Widget _buildMatchCard({required FamilyMember member, required bool isSelected, required VoidCallback onTap, required ColorScheme colors}) {
    // Model se directly data access ho raha hai
    String name = member.name.isNotEmpty ? member.name : "Unknown";
    String initials = "NA";
    if (name.isNotEmpty) {
      List<String> nameParts = name.trim().split(' ');
      if (nameParts.length > 1) {
        initials = "${nameParts[0][0]}${nameParts[1][0]}".toUpperCase();
      } else {
        initials = name.substring(0, 1).toUpperCase();
      }
    }

    String relationDetails = member.relation.isNotEmpty ? "Role: ${member.relation}" : "b. Unknown";
    String location = "Location Details"; // Ye aap baad me apne model me add kar sakte ho

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: colors.surface, borderRadius: BorderRadius.circular(15), border: Border.all(color: isSelected ? AppColors.orangeColor : colors.outlineVariant.withOpacity(0.2), width: isSelected ? 1.5 : 1), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 8, offset: const Offset(0, 2))]),
        child: Row(
          children: [
            Container(height: 50, width: 50, decoration: BoxDecoration(color: isSelected ? AppColors.orangeColor.withOpacity(0.1) : Colors.blueAccent.withOpacity(0.1), shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2)), child: Center(child: AppText(initials, fontSize: 16, fontWeight: AppFonts.bold, color: isSelected ? AppColors.orangeColor : Colors.blueAccent))),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(name, fontSize: 15, fontWeight: AppFonts.bold, color: colors.onSurface),
                  const SizedBox(height: 4),
                  AppText(relationDetails, fontSize: 12, color: colors.onSurfaceVariant),
                  const SizedBox(height: 2),
                  AppText(location, fontSize: 11, color: colors.outline),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}