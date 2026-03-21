// // import 'package:flutter/material.dart';
// // import 'package:flutter_svg/svg.dart';
// // import 'package:get/get.dart';
// // import 'package:kincore_app/features/screens/add_members/add_family_member.dart';
// // import 'package:kincore_app/features/screens/family_member/family_member_list_screen.dart';
// // import '../../../core/utils/app_fonts.dart';
// // import '../../../core/widgets/app_text.dart';
// // import '../../../core/widgets/custom_button.dart';
// // import '../../../core/widgets/custom_icon_button.dart';
// // import '../../../core/widgets/custom_input_field.dart';
// // import '../../../core/widgets/custom_network_image.dart';
// // import '../gift_and_draw_screens/add_gift_exchange_screen.dart';
// // import '../memory_screen/widget/dotted_container.dart';
// // import 'controller/create_event_controller.dart';
// //
// // class CreateEventScreen extends StatelessWidget {
// //   const CreateEventScreen({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final controller = Get.put(CreateEventController());
// //
// //     final theme = Theme.of(context);
// //     final colors = theme.colorScheme;
// //
// //     final double screenW = Get.width;
// //     final double screenH = Get.height;
// //
// //     final titleController = TextEditingController();
// //     final locationController = TextEditingController();
// //     final descriptionController = TextEditingController();
// //
// //     return Scaffold(
// //       backgroundColor: colors.surface, // Theme based background
// //       appBar: AppBar(
// //         backgroundColor: colors.surface,
// //         surfaceTintColor: Colors.transparent,
// //         elevation: 0,
// //         leading: IconButton(
// //           icon: Icon(Icons.arrow_back_ios, color: colors.onSurface),
// //           onPressed: () => Get.back(),
// //         ),
// //         title: AppText(
// //           "Create Event",
// //           fontSize: 20,
// //           fontWeight: AppFonts.semiBold,
// //           color: colors.onSurface,
// //         ),
// //         actions: [
// //           TextButton(
// //             onPressed: () {},
// //             child: AppText('Save', color: colors.primary), // Using primary color for action
// //           ),
// //           SizedBox(width: screenW * 0.02),
// //         ],
// //       ),
// //       body: SingleChildScrollView(
// //         padding: EdgeInsets.symmetric(horizontal: screenW * 0.05),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             SizedBox(height: screenH * 0.02),
// //
// //             /// --- IMAGE UPLOAD ---
// //             DottedContainer(
// //               color: colors.primary.withOpacity(0.5),
// //               borderRadius: 15,
// //               child: Container(
// //                 width: double.infinity,
// //                 padding: EdgeInsets.symmetric(vertical: screenH * 0.04),
// //                 decoration: BoxDecoration(
// //                   color: colors.primaryContainer.withOpacity(0.2), // Theme based container
// //                   borderRadius: BorderRadius.circular(15),
// //                 ),
// //                 child: Column(
// //                   children: [
// //                     SvgPicture.asset(
// //                       'assets/icons/add_memory.svg',
// //                       colorFilter: ColorFilter.mode(
// //                         colors.primary,
// //                         BlendMode.srcIn,
// //                       ),
// //                     ),
// //                     const SizedBox(height: 15),
// //                     Obx(
// //                           () => AppText(
// //                         "Add ${controller.selectedTab.value}",
// //                         fontSize: 20,
// //                         fontWeight: AppFonts.medium,
// //                         color: colors.onSurface,
// //                       ),
// //                     ),
// //                     AppText(
// //                       "Upload PNG, JPG File Support",
// //                       fontSize: 14,
// //                       color: colors.onSurfaceVariant,
// //                     ),
// //                     const SizedBox(height: 20),
// //                     SizedBox(
// //                       width: 150,
// //                       height: 46,
// //                       child: CustomButton(
// //                         text: "Upload",
// //                         onPressed: controller.pickFiles,
// //                         backgroundColor: colors.primary.withOpacity(0.1),
// //                         foregroundColor: colors.primary,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //
// //             SizedBox(height: screenH * 0.03),
// //             AppText(
// //               "Event Detail",
// //               fontSize: 18,
// //               fontWeight: AppFonts.semiBold,
// //               color: colors.onSurface,
// //             ),
// //             SizedBox(height: screenH * 0.02),
// //
// //             /// --- FORM CARD ---
// //             Container(
// //               padding: EdgeInsets.all(screenW * 0.04),
// //               decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.circular(20),
// //                 border: Border.all(color: colors.outlineVariant.withOpacity(0.5)),
// //                 color: colors.surface,
// //               ),
// //               child: Column(
// //                 children: [
// //                   CustomInputField(
// //                     hint: "Enter Title",
// //                     controller: titleController,
// //                     label: 'Event Title',
// //                     labelFontWeight: AppFonts.medium,
// //                   ),
// //                   SizedBox(height: screenH * 0.01),
// //
// //                   CustomInputField(
// //                     hint: "Enter Address Location",
// //                     controller: locationController,
// //                     label: 'Location',
// //                     labelFontWeight: AppFonts.medium,
// //                     suffixIcon: Icon(Icons.location_city, color: colors.primary),
// //                   ),
// //                   SizedBox(height: screenH * 0.01),
// //
// //                   CustomInputField(
// //                     hint: "Write here...",
// //                     controller: descriptionController,
// //                     label: 'Description',
// //                     labelFontWeight: AppFonts.medium,
// //                     maxLines: 4,
// //                   ),
// //                   SizedBox(height: screenH * 0.01),
// //
// //                   Obx(
// //                         () => GestureDetector(
// //                       onTap: () => controller.pickStartDate(context),
// //                       child: AbsorbPointer(
// //                         child: CustomInputField(
// //                           hint: "MM/DD/YYYY",
// //                           controller: TextEditingController(
// //                             text: controller.startDateText.value,
// //                           ),
// //                           label: 'Start Date',
// //                           labelFontWeight: AppFonts.medium,
// //                           suffixIcon: Icon(Icons.calendar_month, color: colors.primary),
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(height: screenH * 0.01),
// //
// //                   Obx(
// //                         () => GestureDetector(
// //                       onTap: () => controller.pickEndDate(context),
// //                       child: AbsorbPointer(
// //                         child: CustomInputField(
// //                           hint: "MM/DD/YYYY",
// //                           controller: TextEditingController(
// //                             text: controller.endDateText.value,
// //                           ),
// //                           label: 'End Date',
// //                           labelFontWeight: AppFonts.medium,
// //                           suffixIcon: Icon(Icons.calendar_month, color: colors.primary),
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(height: screenH * 0.01),
// //
// //                   Obx(
// //                         () => GestureDetector(
// //                       onTap: () => controller.pickTime(context),
// //                       child: AbsorbPointer(
// //                         child: CustomInputField(
// //                           hint: "Enter Time",
// //                           controller: TextEditingController(
// //                             text: controller.timeText.value,
// //                           ),
// //                           label: 'Time',
// //                           labelFontWeight: AppFonts.medium,
// //                           suffixIcon: Icon(Icons.watch_later_outlined, color: colors.primary),
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //
// //             SizedBox(height: screenH * 0.03),
// //
// //             /// --- INVITE MEMBERS ---
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 AppText(
// //                   "Invite Family Member",
// //                   fontSize: 16,
// //                   fontWeight: AppFonts.semiBold,
// //                   color: colors.onSurface,
// //                 ),
// //                 TextButton(
// //                   onPressed: () => Get.to(const FamilyMemberListScreen()),
// //                   child: AppText(
// //                     "View All",
// //                     fontSize: 12,
// //                     fontWeight: AppFonts.medium,
// //                     color: colors.primary,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //
// //             SizedBox(
// //               height: 110,
// //               child: Obx(
// //                     () => ListView.builder(
// //                   scrollDirection: Axis.horizontal,
// //                   physics: const BouncingScrollPhysics(),
// //                   itemCount: controller.familyMembers.length + 1,
// //                   itemBuilder: (context, index) {
// //                     if (index == 0) return _buildAddMemberCircle(context, screenW);
// //                     final member = controller.familyMembers[index - 1];
// //                     return _buildMemberCircle(
// //                       context,
// //                       member['name']!,
// //                       member['image']!,
// //                       screenW,
// //                     );
// //                   },
// //                 ),
// //               ),
// //             ),
// //
// //             SizedBox(height: screenH * 0.04),
// //
// //             CustomButton(text: 'Next & Add Gift', onPressed: ()=>Get.to(const AddGiftExchangeScreen()))
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildMemberCircle(
// //       BuildContext context,
// //       String name,
// //       String image,
// //       double screenW,
// //       ) {
// //     final colors = Theme.of(context).colorScheme;
// //
// //     return Container(
// //       width: screenW * 0.18,
// //       margin: const EdgeInsets.only(right: 12),
// //       child: Column(
// //         children: [
// //           CustomNetworkImage(
// //             imageUrl: image,
// //             height: 60,
// //             width: 60,
// //             borderRadius: 30,
// //           ),
// //           const SizedBox(height: 5),
// //           AppText(
// //             name,
// //             fontSize: 11,
// //             maxLines: 1,
// //             overflow: TextOverflow.ellipsis,
// //             textAlign: TextAlign.center,
// //             color: colors.onSurface,
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _buildAddMemberCircle(BuildContext context, double screenW) {
// //     final colors = Theme.of(context).colorScheme;
// //     const double avatarSize = 60;
// //
// //     return Container(
// //       width: screenW * 0.18,
// //       margin: const EdgeInsets.only(right: 12),
// //       child: Column(
// //         children: [
// //           SizedBox(
// //             height: avatarSize,
// //             width: avatarSize,
// //             child: CustomIconButton(
// //               iconData: Icons.add,
// //               onTap: () => Get.to(const AddFamilyMemberScreen()),
// //               size: 28,
// //               backgroundColor: colors.primary.withOpacity(0.1),
// //               iconColor: colors.primary,
// //               borderRadius: avatarSize / 2,
// //             ),
// //           ),
// //           const SizedBox(height: 5),
// //           AppText(
// //             "Add",
// //             fontSize: 11,
// //             textAlign: TextAlign.center,
// //             color: colors.onSurfaceVariant,
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:kincore_app/features/screens/add_members/add_family_member.dart';
// import 'package:kincore_app/features/screens/family_member/family_member_list_screen.dart';
// import '../../../core/utils/app_fonts.dart';
// import '../../../core/widgets/app_text.dart';
// import '../../../core/widgets/custom_button.dart';
// import '../../../core/widgets/custom_icon_button.dart';
// import '../../../core/widgets/custom_input_field.dart';
// import '../../../core/widgets/custom_network_image.dart';
// import '../gift_and_draw_screens/add_gift_exchange_screen.dart';
// import '../memory_screen/widget/dotted_container.dart';
// import 'controller/create_event_controller.dart';
//
// class CreateEventScreen extends StatelessWidget {
//   const CreateEventScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(CreateEventController());
//     final theme = Theme.of(context);
//     final colors = theme.colorScheme;
//     final double screenW = Get.width;
//     final double screenH = Get.height;
//
//     final titleController = TextEditingController();
//     final locationController = TextEditingController();
//     final descriptionController = TextEditingController();
//     // timeController ki zaroorat nahi kyunki hum controller.timeText use karenge
//
//     return Scaffold(
//       backgroundColor: colors.surface,
//       appBar: AppBar(
//         backgroundColor: colors.surface,
//         surfaceTintColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios, color: colors.onSurface),
//           onPressed: () => Get.back(),
//         ),
//         title: AppText(
//           'createEvent.title'.tr,
//           fontSize: 20,
//           fontWeight: AppFonts.semiBold,
//           color: colors.onSurface,
//         ),
//         // actions: [
//         //   TextButton(
//         //     onPressed: () {},
//         //     child: AppText('createEvent.saveDraft'.tr, color: colors.primary),
//         //   ),
//         //   SizedBox(width: screenW * 0.02),
//         // ],
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: screenW * 0.05),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: screenH * 0.02),
//             DottedContainer(
//               color: colors.primary.withOpacity(0.5),
//               borderRadius: 15,
//               child: Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.symmetric(vertical: screenH * 0.04),
//                 decoration: BoxDecoration(
//                   color: colors.primaryContainer.withOpacity(0.2),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Column(
//                   children: [
//                     SvgPicture.asset(
//                       'assets/icons/add_memory.svg',
//                       colorFilter: ColorFilter.mode(colors.primary, BlendMode.srcIn),
//                     ),
//                     const SizedBox(height: 15),
//                     AppText(
//                       'createEvent.addCoverPhoto'.tr,
//                       fontSize: 20,
//                       fontWeight: AppFonts.medium,
//                       color: colors.onSurface,
//                     ),
//                     AppText(
//                       'createEvent.uploadSupport'.tr,
//                       fontSize: 14,
//                       color: colors.onSurfaceVariant,
//                     ),
//                     const SizedBox(height: 20),
//                     SizedBox(
//                       width: 150,
//                       height: 46,
//                       child: CustomButton(
//                         text: 'common.upload'.tr,
//                         onPressed: controller.pickFiles,
//                         backgroundColor: colors.primary.withOpacity(0.1),
//                         foregroundColor: colors.primary,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: screenH * 0.03),
//             AppText(
//               'createEvent.detailTitle'.tr,
//               fontSize: 18,
//               fontWeight: AppFonts.semiBold,
//               color: colors.onSurface,
//             ),
//             SizedBox(height: screenH * 0.02),
//             Container(
//               padding: EdgeInsets.all(screenW * 0.04),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(color: colors.outlineVariant.withOpacity(0.5)),
//                 color: colors.surface,
//               ),
//               child: Column(
//                 children: [
//                   CustomInputField(
//                     hint: 'createEvent.eventTitleHint'.tr,
//                     controller: titleController,
//                     label: 'createEvent.eventTitleLabel'.tr,
//                     labelFontWeight: AppFonts.medium,
//                   ),
//                   SizedBox(height: screenH * 0.01),
//                   CustomInputField(
//                     hint: 'createEvent.locationHint'.tr,
//                     controller: locationController,
//                     label: 'createEvent.locationLabel'.tr,
//                     labelFontWeight: AppFonts.medium,
//                     suffixIcon: Icon(Icons.location_city, color: colors.primary),
//                   ),
//                   SizedBox(height: screenH * 0.01),
//
//                   // -------------------------------------------------
//                   // SAMPLE MAP (UI Only)
//                   // -------------------------------------------------
//                   SizedBox(height: screenH * 0.015),
//                   Container(
//                     height: 130,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(color: colors.outlineVariant.withOpacity(0.5)),
//                       image: const DecorationImage(
//                         image: NetworkImage("https://media.wired.com/photos/59269cd37034dc5f91becd80/master/pass/GoogleMapTA.jpg"),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     child: Center(
//                       child: Container(
//                         padding: const EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                           color: colors.surface.withOpacity(0.8),
//                           shape: BoxShape.circle,
//                         ),
//                         child: const Icon(
//                           Icons.location_on,
//                           color: Colors.red,
//                           size: 30,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: screenH * 0.015),
//                   // -------------------------------------------------
//
//                   CustomInputField(
//                     hint: 'createEvent.descriptionHint'.tr,
//                     controller: descriptionController,
//                     label: 'createEvent.descriptionLabel'.tr,
//                     labelFontWeight: AppFonts.medium,
//                     maxLines: 4,
//                   ),
//                   SizedBox(height: screenH * 0.01),
//
//                   // Start Date Picker
//                   Obx(
//                         () => GestureDetector(
//                       onTap: () => controller.pickStartDate(context),
//                       child: AbsorbPointer(
//                         child: CustomInputField(
//                           hint: 'addMember.dateFormatHint'.tr,
//                           controller: TextEditingController(text: controller.startDateText.value),
//                           label: 'createEvent.startDateLabel'.tr,
//                           labelFontWeight: AppFonts.medium,
//                           suffixIcon: Icon(Icons.calendar_month, color: colors.primary),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: screenH * 0.01),
//
//                   // End Date Picker
//                   Obx(
//                         () => GestureDetector(
//                       onTap: () => controller.pickEndDate(context),
//                       child: AbsorbPointer(
//                         child: CustomInputField(
//                           hint: 'addMember.dateFormatHint'.tr,
//                           controller: TextEditingController(text: controller.endDateText.value),
//                           label: 'createEvent.endDateLabel'.tr,
//                           labelFontWeight: AppFonts.medium,
//                           suffixIcon: Icon(Icons.calendar_month, color: colors.primary),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: screenH * 0.01),
//
//                   // [FIXED] Time Picker Logic Added Here
//                   Obx(
//                         () => GestureDetector(
//                       onTap: () => controller.pickTime(context),
//                       child: AbsorbPointer(
//                         child: CustomInputField(
//                           hint: 'createEvent.timeHint'.tr,
//                           // Use controller's timeText value
//                           controller: TextEditingController(text: controller.timeText.value),
//                           label: 'createEvent.timeLabel'.tr,
//                           labelFontWeight: AppFonts.medium,
//                           suffixIcon: Icon(Icons.watch_later_outlined, color: colors.primary),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: screenH * 0.03),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 AppText(
//                   'createEvent.inviteMemberTitle'.tr,
//                   fontSize: 16,
//                   fontWeight: AppFonts.semiBold,
//                   color: colors.onSurface,
//                 ),
//                 TextButton(
//                   onPressed: () => Get.to(() => const FamilyMemberListScreen()),
//                   child: AppText(
//                     'common.viewAll'.tr,
//                     fontSize: 12,
//                     fontWeight: AppFonts.medium,
//                     color: colors.primary,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 110,
//               child: Obx(
//                     () => ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   physics: const BouncingScrollPhysics(),
//                   itemCount: controller.familyMembers.length + 1,
//                   itemBuilder: (context, index) {
//                     if (index == 0) return _buildAddMemberCircle(context, screenW);
//                     final member = controller.familyMembers[index - 1];
//                     return _buildMemberCircle(context, member['name']!, member['image']!, screenW);
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(height: screenH * 0.04),
//
//             CustomButton(text: 'Next & Add Gift', onPressed: () => Get.to(const AddGiftExchangeScreen()))
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildMemberCircle(BuildContext context, String name, String image, double screenW) {
//     final colors = Theme.of(context).colorScheme;
//     return Container(
//       width: screenW * 0.18,
//       margin: const EdgeInsets.only(right: 12),
//       child: Column(
//         children: [
//           CustomNetworkImage(imageUrl: image, height: 60, width: 60, borderRadius: 30),
//           const SizedBox(height: 5),
//           AppText(name, fontSize: 11, maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, color: colors.onSurface),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildAddMemberCircle(BuildContext context, double screenW) {
//     final colors = Theme.of(context).colorScheme;
//     const double avatarSize = 60;
//     return Container(
//       width: screenW * 0.18,
//       margin: const EdgeInsets.only(right: 12),
//       child: Column(
//         children: [
//           SizedBox(
//             height: avatarSize,
//             width: avatarSize,
//             child: CustomIconButton(
//               iconData: Icons.add,
//               onTap: () => Get.to(() => const AddFamilyMemberScreen()),
//               size: 28,
//               backgroundColor: colors.primary.withOpacity(0.1),
//               iconColor: colors.primary,
//               borderRadius: avatarSize / 2,
//             ),
//           ),
//           const SizedBox(height: 5),
//           AppText('common.add'.tr, fontSize: 11, textAlign: TextAlign.center, color: colors.onSurfaceVariant),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:kincore_app/features/screens/add_members/add_family_member.dart';
// import 'package:kincore_app/features/screens/family_member/family_member_list_screen.dart';
// import '../../../core/utils/app_colors.dart'; // Ensure colors import is here
// import '../../../core/utils/app_fonts.dart';
// import '../../../core/widgets/app_text.dart';
// import '../../../core/widgets/custom_button.dart';
// import '../../../core/widgets/custom_icon_button.dart';
// import '../../../core/widgets/custom_input_field.dart';
// import '../../../core/widgets/custom_network_image.dart';
// import '../gift_and_draw_screens/add_gift_exchange_screen.dart';
// import '../memory_screen/widget/dotted_container.dart';
// import 'controller/create_event_controller.dart';
//
// class CreateEventScreen extends StatelessWidget {
//   const CreateEventScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(CreateEventController());
//     final theme = Theme.of(context);
//     final colors = theme.colorScheme;
//     final double screenW = Get.width;
//     final double screenH = Get.height;
//
//     final titleController = TextEditingController();
//     final locationController = TextEditingController();
//     final descriptionController = TextEditingController();
//
//     return Scaffold(
//       backgroundColor: colors.surface,
//       appBar: AppBar(
//         backgroundColor: colors.surface,
//         surfaceTintColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios, color: colors.onSurface),
//           onPressed: () => Get.back(),
//         ),
//         title: AppText(
//           'createEvent.title'.tr,
//           fontSize: 20,
//           fontWeight: AppFonts.semiBold,
//           color: colors.onSurface,
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: screenW * 0.05),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: screenH * 0.02),
//             DottedContainer(
//               color: colors.primary.withOpacity(0.5),
//               borderRadius: 15,
//               child: Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.symmetric(vertical: screenH * 0.04),
//                 decoration: BoxDecoration(
//                   color: colors.primaryContainer.withOpacity(0.2),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Column(
//                   children: [
//                     SvgPicture.asset(
//                       'assets/icons/add_memory.svg',
//                       colorFilter: ColorFilter.mode(colors.primary, BlendMode.srcIn),
//                     ),
//                     const SizedBox(height: 15),
//                     AppText(
//                       'createEvent.addCoverPhoto'.tr,
//                       fontSize: 20,
//                       fontWeight: AppFonts.medium,
//                       color: colors.onSurface,
//                     ),
//                     AppText(
//                       'createEvent.uploadSupport'.tr,
//                       fontSize: 14,
//                       color: colors.onSurfaceVariant,
//                     ),
//                     const SizedBox(height: 20),
//                     SizedBox(
//                       width: 150,
//                       height: 46,
//                       child: CustomButton(
//                         text: 'common.upload'.tr,
//                         onPressed: controller.pickFiles,
//                         backgroundColor: colors.primary.withOpacity(0.1),
//                         foregroundColor: colors.primary,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: screenH * 0.03),
//             AppText(
//               'createEvent.detailTitle'.tr,
//               fontSize: 18,
//               fontWeight: AppFonts.semiBold,
//               color: colors.onSurface,
//             ),
//             SizedBox(height: screenH * 0.02),
//             Container(
//               padding: EdgeInsets.all(screenW * 0.04),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(color: colors.outlineVariant.withOpacity(0.5)),
//                 color: colors.surface,
//               ),
//               child: Column(
//                 children: [
//                   CustomInputField(
//                     hint: 'createEvent.eventTitleHint'.tr,
//                     controller: titleController,
//                     label: 'createEvent.eventTitleLabel'.tr,
//                     labelFontWeight: AppFonts.medium,
//                   ),
//                   SizedBox(height: screenH * 0.01),
//                   CustomInputField(
//                     hint: 'createEvent.locationHint'.tr,
//                     controller: locationController,
//                     label: 'createEvent.locationLabel'.tr,
//                     labelFontWeight: AppFonts.medium,
//                     suffixIcon: Icon(Icons.location_city, color: colors.primary),
//                   ),
//                   SizedBox(height: screenH * 0.01),
//
//                   // Map Placeholder
//                   SizedBox(height: screenH * 0.015),
//                   Container(
//                     height: 130,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(color: colors.outlineVariant.withOpacity(0.5)),
//                       image: const DecorationImage(
//                         image: NetworkImage("https://media.wired.com/photos/59269cd37034dc5f91becd80/master/pass/GoogleMapTA.jpg"),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     child: Center(
//                       child: Container(
//                         padding: const EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                           color: colors.surface.withOpacity(0.8),
//                           shape: BoxShape.circle,
//                         ),
//                         child: const Icon(
//                           Icons.location_on,
//                           color: Colors.red,
//                           size: 30,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: screenH * 0.015),
//
//                   CustomInputField(
//                     hint: 'createEvent.descriptionHint'.tr,
//                     controller: descriptionController,
//                     label: 'createEvent.descriptionLabel'.tr,
//                     labelFontWeight: AppFonts.medium,
//                     maxLines: 4,
//                   ),
//                   SizedBox(height: screenH * 0.01),
//
//                   // ========================================================
//                   // [FIXED] Start Date & End Date in Single Row (Side by Side)
//                   // ========================================================
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Obx(
//                               () => GestureDetector(
//                             onTap: () => controller.pickStartDate(context),
//                             child: AbsorbPointer(
//                               child: CustomInputField(
//                                 hint: 'addMember.dateFormatHint'.tr,
//                                 controller: TextEditingController(text: controller.startDateText.value),
//                                 label: 'Starts', // Or 'createEvent.startDateLabel'.tr
//                                 labelFontWeight: AppFonts.medium,
//                                 suffixIcon: Icon(Icons.calendar_month, color: colors.primary),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 10), // Spacing between dates
//                       Expanded(
//                         child: Obx(
//                               () => GestureDetector(
//                             onTap: () => controller.pickEndDate(context),
//                             child: AbsorbPointer(
//                               child: CustomInputField(
//                                 hint: 'addMember.dateFormatHint'.tr,
//                                 controller: TextEditingController(text: controller.endDateText.value),
//                                 label: 'Ends', // Or 'createEvent.endDateLabel'.tr
//                                 labelFontWeight: AppFonts.medium,
//                                 suffixIcon: Icon(Icons.calendar_month, color: colors.primary),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   SizedBox(height: screenH * 0.01),
//
//                   Obx(
//                         () => GestureDetector(
//                       onTap: () => controller.pickTime(context),
//                       child: AbsorbPointer(
//                         child: CustomInputField(
//                           hint: 'createEvent.timeHint'.tr,
//                           controller: TextEditingController(text: controller.timeText.value),
//                           label: 'createEvent.timeLabel'.tr,
//                           labelFontWeight: AppFonts.medium,
//                           suffixIcon: Icon(Icons.watch_later_outlined, color: colors.primary),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: screenH * 0.03),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 AppText(
//                   'createEvent.inviteMemberTitle'.tr,
//                   fontSize: 16,
//                   fontWeight: AppFonts.semiBold,
//                   color: colors.onSurface,
//                 ),
//                 TextButton(
//                   onPressed: () => Get.to(() => const FamilyMemberListScreen()),
//                   child: AppText(
//                     'common.viewAll'.tr,
//                     fontSize: 12,
//                     fontWeight: AppFonts.medium,
//                     color: colors.primary,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 110,
//               child: Obx(
//                     () => ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   physics: const BouncingScrollPhysics(),
//                   itemCount: controller.familyMembers.length + 1,
//                   itemBuilder: (context, index) {
//                     if (index == 0) return _buildAddMemberCircle(context, screenW);
//                     final member = controller.familyMembers[index - 1];
//                     return _buildMemberCircle(context, member['name']!, member['image']!, screenW);
//                   },
//                 ),
//               ),
//             ),
//
//             // ========================================================
//             // [NEW] Request RSVP & Send Reminders Section
//             // ========================================================
//             SizedBox(height: screenH * 0.02),
//
//             Obx(() => _buildToggleCard(
//               context,
//               title: "Request RSVP",
//               subtitle: "Guests must confirm attendance",
//               value: controller.requestRSVP.value,
//               onChanged: (val) => controller.requestRSVP.value = val,
//               colors: colors,
//             )),
//
//             SizedBox(height: screenH * 0.015),
//
//             Obx(() => _buildToggleCard(
//               context,
//               title: "Send Reminders",
//               subtitle: "Notify guests 1 day before",
//               value: controller.sendReminders.value,
//               onChanged: (val) => controller.sendReminders.value = val,
//               colors: colors,
//             )),
//
//             SizedBox(height: screenH * 0.04),
//
//             CustomButton(
//                 text: 'Create Event',
//                 onPressed: () {
//                   Get.back(); // Pehle screen close karein
//                   Get.snackbar(
//                     'Event Created',
//                     'Your Event is Created',
//                     snackPosition: SnackPosition.BOTTOM, // Optional: Niche dikhane ke liye
//                     colorText: Colors.white,
//                   );
//                 }
//             ),
//             SizedBox(height: 10,),
//             CustomButton(text: 'Next & Add Gift', onPressed: () => Get.to(const AddGiftExchangeScreen()))
//           ],
//         ),
//       ),
//     );
//   }
//
//   // --- Helper Widget for Toggle Cards ---
//   Widget _buildToggleCard(BuildContext context, {
//     required String title,
//     required String subtitle,
//     required bool value,
//     required Function(bool) onChanged,
//     required ColorScheme colors,
//   }) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       decoration: BoxDecoration(
//         color: colors.surface,
//         borderRadius: BorderRadius.circular(15),
//         border: Border.all(color: colors.outlineVariant.withOpacity(0.5)),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 AppText(title, fontSize: 16, fontWeight: AppFonts.semiBold, color: colors.onSurface),
//                 const SizedBox(height: 2),
//                 AppText(subtitle, fontSize: 12, color: colors.onSurfaceVariant),
//               ],
//             ),
//           ),
//           Switch(
//             value: value,
//             onChanged: onChanged,
//             activeColor: colors.primary, // Orange Color
//             activeTrackColor: colors.primary.withOpacity(0.2),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _buildMemberCircle(BuildContext context, String name, String image, double screenW) {
//     final colors = Theme.of(context).colorScheme;
//     return Container(
//       width: screenW * 0.18,
//       margin: const EdgeInsets.only(right: 12),
//       child: Column(
//         children: [
//           CustomNetworkImage(imageUrl: image, height: 60, width: 60, borderRadius: 30),
//           const SizedBox(height: 5),
//           AppText(name, fontSize: 11, maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, color: colors.onSurface),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildAddMemberCircle(BuildContext context, double screenW) {
//     final colors = Theme.of(context).colorScheme;
//     const double avatarSize = 60;
//     return Container(
//       width: screenW * 0.18,
//       margin: const EdgeInsets.only(right: 12),
//       child: Column(
//         children: [
//           SizedBox(
//             height: avatarSize,
//             width: avatarSize,
//             child: CustomIconButton(
//               iconData: Icons.add,
//               onTap: () => Get.to(() => const AddFamilyMemberScreen()),
//               size: 28,
//               backgroundColor: colors.primary.withOpacity(0.1),
//               iconColor: colors.primary,
//               borderRadius: avatarSize / 2,
//             ),
//           ),
//           const SizedBox(height: 5),
//           AppText('common.add'.tr, fontSize: 11, textAlign: TextAlign.center, color: colors.onSurfaceVariant),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kincore_app/features/screens/add_members/add_family_member.dart';
import 'package:kincore_app/features/screens/family_member/family_member_list_screen.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../../../core/widgets/custom_input_field.dart';
import '../../../core/widgets/custom_network_image.dart';
import '../gift_and_draw_screens/add_gift_exchange_screen.dart';
import '../memory_screen/widget/dotted_container.dart';
import 'controller/create_event_controller.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateEventController());
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final double screenW = Get.width;
    final double screenH = Get.height;

    final titleController = TextEditingController();
    final locationController = TextEditingController();
    final descriptionController = TextEditingController();

    // [FIX]: Local reactive variable for Gift Exchange Toggle
    final RxBool isGiftExchangeEnabled = false.obs;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        backgroundColor: colors.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: colors.onSurface),
          onPressed: () => Get.back(),
        ),
        title: AppText(
          'createEvent.title'.tr,
          fontSize: 20,
          fontWeight: AppFonts.semiBold,
          color: colors.onSurface,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenW * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenH * 0.02),
            DottedContainer(
              color: AppColors.orangeColor.withOpacity(0.5),
              borderRadius: 15,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: screenH * 0.04),
                decoration: BoxDecoration(
                  color: colors.primaryContainer.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/add_memory.svg',
                      colorFilter: ColorFilter.mode(AppColors.orangeColor, BlendMode.srcIn),
                    ),
                    const SizedBox(height: 15),
                    AppText(
                      'createEvent.addCoverPhoto'.tr,
                      fontSize: 20,
                      fontWeight: AppFonts.medium,
                      color: colors.onSurface,
                    ),
                    AppText(
                      'createEvent.uploadSupport'.tr,
                      fontSize: 14,
                      color: colors.onSurfaceVariant,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 150,
                      height: 46,
                      child: CustomButton(
                        text: 'common.upload'.tr,
                        onPressed: controller.pickFiles,
                        backgroundColor: colors.primary.withOpacity(0.1),
                        foregroundColor: colors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenH * 0.03),
            AppText(
              'createEvent.detailTitle'.tr,
              fontSize: 18,
              fontWeight: AppFonts.semiBold,
              color: colors.onSurface,
            ),
            SizedBox(height: screenH * 0.02),
            Container(
              padding: EdgeInsets.all(screenW * 0.04),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: colors.outlineVariant.withOpacity(0.5)),
                color: colors.surface,
              ),
              child: Column(
                children: [
                  CustomInputField(
                    hint: 'createEvent.eventTitleHint'.tr,
                    controller: titleController,
                    label: 'createEvent.eventTitleLabel'.tr,
                    labelFontWeight: AppFonts.medium,
                  ),
                  SizedBox(height: screenH * 0.01),
                  CustomInputField(
                    hint: 'createEvent.locationHint'.tr,
                    controller: locationController,
                    label: 'createEvent.locationLabel'.tr,
                    labelFontWeight: AppFonts.medium,
                    suffixIcon: Icon(Icons.location_city, color: AppColors.orangeColor),
                  ),
                  SizedBox(height: screenH * 0.01),

                  // Map Placeholder
                  SizedBox(height: screenH * 0.015),
                  Container(
                    height: 130,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: colors.outlineVariant.withOpacity(0.5)),
                    ),
                    child: Stack(
                      alignment: Alignment.center, // Icon ekdum center me aayega
                      children: [
                        // 1. Background Dummy Map Image (CustomNetworkImage use karke)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(11), // Border se bahar na nikle isliye clip kiya
                          child: const CustomNetworkImage(
                            imageUrl: "https://images.unsplash.com/photo-1524661135-423995f22d0b?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80",
                            height: 130,
                            width: double.infinity,
                          ),
                        ),

                        // 2. Center Location Icon
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: colors.surface.withOpacity(0.8),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.location_on,
                            color: AppColors.orangeColor,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenH * 0.015),

                  CustomInputField(
                    hint: 'createEvent.descriptionHint'.tr,
                    controller: descriptionController,
                    label: 'createEvent.descriptionLabel'.tr,
                    labelFontWeight: AppFonts.medium,
                    maxLines: 4,
                  ),
                  SizedBox(height: screenH * 0.01),

                  // Start Date & End Date
                  Row(
                    children: [
                      Expanded(
                        child: Obx(
                              () => GestureDetector(
                            onTap: () => controller.pickStartDate(context),
                            child: AbsorbPointer(
                              child: CustomInputField(
                                hint: 'addMember.dateFormatHint'.tr,
                                controller: TextEditingController(text: controller.startDateText.value),
                                label: 'createEvent.starts'.tr, // [FIX] Translated
                                labelFontWeight: AppFonts.medium,
                                suffixIcon: Icon(Icons.calendar_month, color: AppColors.orangeColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Obx(
                              () => GestureDetector(
                            onTap: () => controller.pickEndDate(context),
                            child: AbsorbPointer(
                              child: CustomInputField(
                                hint: 'addMember.dateFormatHint'.tr,
                                controller: TextEditingController(text: controller.endDateText.value),
                                label: 'createEvent.ends'.tr, // [FIX] Translated
                                labelFontWeight: AppFonts.medium,
                                suffixIcon: Icon(Icons.calendar_month, color: AppColors.orangeColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: screenH * 0.01),

                  Obx(
                        () => GestureDetector(
                      onTap: () => controller.pickTime(context),
                      child: AbsorbPointer(
                        child: CustomInputField(
                          hint: 'createEvent.timeHint'.tr,
                          controller: TextEditingController(text: controller.timeText.value),
                          label: 'createEvent.timeLabel'.tr,
                          labelFontWeight: AppFonts.medium,
                          suffixIcon: Icon(Icons.watch_later_outlined, color: AppColors.orangeColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenH * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  'createEvent.inviteMemberTitle'.tr,
                  fontSize: 16,
                  fontWeight: AppFonts.semiBold,
                  color: colors.onSurface,
                ),
                TextButton(
                  onPressed: () => Get.to(() => const FamilyMemberListScreen()),
                  child: AppText(
                    'common.viewAll'.tr,
                    fontSize: 12,
                    fontWeight: AppFonts.medium,
                    color: AppColors.orangeColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 110,
              child: Obx(
                    () => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.familyMembers.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) return _buildAddMemberCircle(context, screenW);
                    final member = controller.familyMembers[index - 1];
                    return _buildMemberCircle(context, member['name']!, member['image']!, screenW);
                  },
                ),
              ),
            ),

            SizedBox(height: screenH * 0.02),

            // [FIX] Translated Request RSVP Toggle
            Obx(() => _buildToggleCard(
              context,
              title: 'createEvent.requestRSVP'.tr,
              subtitle: 'createEvent.requestRSVPSub'.tr,
              value: controller.requestRSVP.value,
              onChanged: (val) => controller.requestRSVP.value = val,
              colors: colors,
            )),

            SizedBox(height: screenH * 0.015),

            // [FIX] Translated Send Reminders Toggle
            Obx(() => _buildToggleCard(
              context,
              title: 'createEvent.sendReminders'.tr,
              subtitle: 'createEvent.sendRemindersSub'.tr,
              value: controller.sendReminders.value,
              onChanged: (val) => controller.sendReminders.value = val,
              colors: colors,
            )),

            SizedBox(height: screenH * 0.015),

            // [FIX] Translated Include Gift Exchange Toggle
            Obx(() => _buildToggleCard(
              context,
              title: 'createEvent.includeGiftExchange'.tr,
              subtitle: 'createEvent.includeGiftExchangeSub'.tr,
              value: isGiftExchangeEnabled.value,
              onChanged: (val) => isGiftExchangeEnabled.value = val,
              colors: colors,
            )),

            SizedBox(height: screenH * 0.04),

            // [FIX] Translated Dynamic Buttons & Snackbars
            Obx(() => isGiftExchangeEnabled.value
                ? CustomButton(
                text: 'createEvent.nextAddGift'.tr,
                onPressed: () => Get.to(() => const AddGiftExchangeScreen())
            )
                : CustomButton(
                text: 'createEvent.createEventBtn'.tr,
                onPressed: () {
                  Get.back();
                  Get.snackbar(
                    'createEvent.eventCreatedTitle'.tr,
                    'createEvent.eventCreatedMsg'.tr,
                    colorText: Colors.white,
                  );
                }
            )
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // --- Helper Widget for Toggle Cards ---
  Widget _buildToggleCard(BuildContext context, {
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
    required ColorScheme colors,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: colors.outlineVariant.withOpacity(0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(title, fontSize: 16, fontWeight: AppFonts.semiBold, color: colors.onSurface),
                const SizedBox(height: 2),
                AppText(subtitle, fontSize: 12, color: colors.onSurfaceVariant),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.orangeColor, // Orange Color
            activeTrackColor: colors.primary.withOpacity(0.2),
          )
        ],
      ),
    );
  }

  Widget _buildMemberCircle(BuildContext context, String name, String image, double screenW) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      width: screenW * 0.18,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          CustomNetworkImage(imageUrl: image, height: 60, width: 60, borderRadius: 30),
          const SizedBox(height: 5),
          AppText(name, fontSize: 11, maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, color: colors.onSurface),
        ],
      ),
    );
  }

  Widget _buildAddMemberCircle(BuildContext context, double screenW) {
    final colors = Theme.of(context).colorScheme;
    const double avatarSize = 60;
    return Container(
      width: screenW * 0.18,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          SizedBox(
            height: avatarSize,
            width: avatarSize,
            child: CustomIconButton(
              iconData: Icons.add,
              onTap: () => Get.to(() => const AddFamilyMemberScreen()),
              size: 28,
              backgroundColor: colors.primary.withOpacity(0.1),
              iconColor: colors.primary,
              borderRadius: avatarSize / 2,
            ),
          ),
          const SizedBox(height: 5),
          AppText('common.add'.tr, fontSize: 11, textAlign: TextAlign.center, color: colors.onSurfaceVariant),
        ],
      ),
    );
  }
}