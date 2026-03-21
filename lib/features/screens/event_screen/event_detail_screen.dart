// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../core/utils/app_fonts.dart';
// import '../../../core/widgets/app_text.dart';
// import '../../../core/widgets/custom_network_image.dart';
//
// class EventDetailScreen extends StatelessWidget {
//   const EventDetailScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final event = Get.arguments;
//     final theme = Theme.of(context);
//     final colors = theme.colorScheme;
//     final double screenW = Get.width;
//     final double screenH = Get.height;
//
//     return Scaffold(
//       backgroundColor: colors.surface,
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 CustomNetworkImage(
//                   imageUrl: event?.imageUrl ?? '',
//                   width: double.infinity,
//                   height: screenH * 0.40,
//                   borderRadius: 0,
//                 ),
//                 Positioned(
//                   top: MediaQuery.of(context).padding.top + 10,
//                   left: screenW * 0.05,
//                   child: GestureDetector(
//                     onTap: () => Get.back(),
//                     child: Container(
//                       padding: const EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         color: colors.surface.withOpacity(0.9),
//                         shape: BoxShape.circle,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.1),
//                             blurRadius: 8,
//                             offset: const Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Icon(Icons.arrow_back_ios_new, size: 18, color: colors.onSurface),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Transform.translate(
//               offset: const Offset(0, -30),
//               child: Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: colors.surface,
//                   borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: screenW * 0.06, vertical: 25),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       AppText(
//                         event?.title ?? 'event.detailTitle'.tr,
//                         fontSize: 24,
//                         fontWeight: AppFonts.bold,
//                         color: colors.onSurface,
//                       ),
//                       const SizedBox(height: 20),
//                       Container(
//                         padding: const EdgeInsets.all(12),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           border: Border.all(color: colors.outlineVariant.withOpacity(0.5)),
//                         ),
//                         child: Row(
//                           children: [
//                             const CustomNetworkImage(imageUrl: 'https://i.pravatar.cc/150?u=host', height: 45, width: 45, borderRadius: 25),
//                             const SizedBox(width: 15),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 AppText('event.hostedBy'.tr, fontSize: 10, fontWeight: AppFonts.bold, color: colors.onSurfaceVariant),
//                                 AppText("Arthur Pendragon", fontSize: 15, fontWeight: AppFonts.semiBold, color: colors.onSurface),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 25),
//                       _buildInfoRow(context, Icons.calendar_today_outlined, "${event?.date ?? ''} / 12:30 PM"),
//                       const SizedBox(height: 15),
//                       _buildInfoRow(context, Icons.location_on_outlined, event?.location ?? "No Location"),
//                       const SizedBox(height: 35),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           AppText('event.areYouGoing'.tr, fontSize: 17, fontWeight: AppFonts.bold),
//                           AppText('event.responseRequired'.tr, fontSize: 11, color: colors.primary),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       Row(
//                         children: [
//                           _buildRSVPButton(context, text: 'event.going'.tr, isSelected: true),
//                           const SizedBox(width: 10),
//                           _buildRSVPButton(context, text: 'common.maybe'.tr),
//                           const SizedBox(width: 10),
//                           _buildRSVPButton(context, text: 'common.no'.tr),
//                         ],
//                       ),
//                       const SizedBox(height: 40),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildInfoRow(BuildContext context, IconData icon, String text) {
//     final colors = Theme.of(context).colorScheme;
//     return Row(
//       children: [
//         Container(
//           padding: const EdgeInsets.all(8),
//           decoration: BoxDecoration(color: colors.primary.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
//           child: Icon(icon, color: colors.primary, size: 20),
//         ),
//         const SizedBox(width: 15),
//         Expanded(
//           child: AppText(text, fontSize: 15, fontWeight: AppFonts.medium, color: colors.onSurface),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildRSVPButton(BuildContext context, {required String text, bool isSelected = false}) {
//     final colors = Theme.of(context).colorScheme;
//     return Expanded(
//       child: GestureDetector(
//         onTap: () {},
//         child: Container(
//           height: 48,
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             color: isSelected ? colors.primary : colors.surface,
//             borderRadius: BorderRadius.circular(25),
//             border: Border.all(color: isSelected ? colors.primary : colors.outlineVariant),
//             boxShadow: isSelected ? [BoxShadow(color: colors.primary.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4))] : null,
//           ),
//           child: AppText(text.tr, fontSize: 14, fontWeight: AppFonts.semiBold, color: isSelected ? colors.onPrimary : colors.onSurface),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_network_image.dart';
import '../../../../core/models/event_model.dart';

class EventDetailScreen extends StatefulWidget {
  const EventDetailScreen({super.key});

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  // Selection state ko track karne ke liye variable
  String selectedResponse = "Going"; // Default ya Empty rakh sakte hain

  @override
  void initState() {
    super.initState();
    // Agar event me already status hai to usse init karo
    final EventModel? event = Get.arguments;
    if (event != null) {
      if (['Going', 'Maybe', 'No'].contains(event.status)) {
        selectedResponse = event.status;
      } else {
        selectedResponse = ""; // Default no selection
      }
    }
  }

  void _onResponseSelected(String response) {
    setState(() {
      selectedResponse = response;
    });
    // Future: Yahan API call kar sakte hain status update karne ke liye
    Get.snackbar("Response Updated", "You selected: $response", snackPosition: SnackPosition.BOTTOM);
  }

  @override
  Widget build(BuildContext context) {
    final EventModel? event = Get.arguments;
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final double screenW = Get.width;
    final double screenH = Get.height;

    return Scaffold(
      backgroundColor: colors.surface,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CustomNetworkImage(
                  imageUrl: event?.imageUrl ?? '',
                  width: double.infinity,
                  height: screenH * 0.40,
                  borderRadius: 0,
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top + 10,
                  left: screenW * 0.05,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: colors.surface.withOpacity(0.9),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(Icons.arrow_back_ios_new, size: 18, color: colors.onSurface),
                    ),
                  ),
                ),
              ],
            ),
            Transform.translate(
              offset: const Offset(0, -30),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: colors.surface,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenW * 0.06, vertical: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        event?.title ?? 'event.detailTitle'.tr,
                        fontSize: 24,
                        fontWeight: AppFonts.bold,
                        color: colors.onSurface,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: colors.outlineVariant.withOpacity(0.5)),
                        ),
                        child: Row(
                          children: [
                            const CustomNetworkImage(imageUrl: 'https://i.pravatar.cc/150?u=host', height: 45, width: 45, borderRadius: 25),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText('event.hostedBy'.tr, fontSize: 10, fontWeight: AppFonts.bold, color: colors.onSurfaceVariant),
                                AppText("Arthur Pendragon", fontSize: 15, fontWeight: AppFonts.semiBold, color: colors.onSurface),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      _buildInfoRow(context, Icons.calendar_today_outlined, event?.date ?? ''),
                      const SizedBox(height: 15),
                      _buildInfoRow(context, Icons.location_on_outlined, event?.location ?? "No Location"),
                      const SizedBox(height: 35),

                      // --- RSVP SECTION ---
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText('event.areYouGoing'.tr, fontSize: 17, fontWeight: AppFonts.bold),
                          AppText('event.responseRequired'.tr, fontSize: 11, color: colors.primary),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          _buildRSVPButton(context, text: 'Going', value: 'Going'),
                          const SizedBox(width: 10),
                          _buildRSVPButton(context, text: 'Maybe', value: 'Maybe'),
                          const SizedBox(width: 10),
                          _buildRSVPButton(context, text: 'No', value: 'No'),
                        ],
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, IconData icon, String text) {
    final colors = Theme.of(context).colorScheme;
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: colors.primary.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
          child: Icon(icon, color: colors.primary, size: 20),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: AppText(text, fontSize: 15, fontWeight: AppFonts.medium, color: colors.onSurface),
        ),
      ],
    );
  }

  Widget _buildRSVPButton(BuildContext context, {required String text, required String value}) {
    final colors = Theme.of(context).colorScheme;
    final isSelected = selectedResponse == value;

    return Expanded(
      child: GestureDetector(
        onTap: () => _onResponseSelected(value),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? colors.primary : colors.surface,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: isSelected ? colors.primary : colors.outlineVariant),
            boxShadow: isSelected ? [BoxShadow(color: colors.primary.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4))] : null,
          ),
          child: AppText(
              text.tr, // Ensure keys are in translation file
              fontSize: 14,
              fontWeight: AppFonts.semiBold,
              color: isSelected ? colors.onPrimary : colors.onSurface
          ),
        ),
      ),
    );
  }
}
