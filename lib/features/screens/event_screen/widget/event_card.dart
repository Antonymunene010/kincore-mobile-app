// import 'package:flutter/material.dart';
// import '../../../../core/utils/app_fonts.dart';
// import '../../../../core/widgets/app_text.dart';
// import '../../../../core/widgets/custom_network_image.dart';
//
// class EventCard extends StatelessWidget {
//   final String title;
//   final String imageUrl;
//   final String date;
//   final String location;
//   final String status;
//   final List<String> memberAvatars;
//   final VoidCallback onTap;
//
//   const EventCard({
//     super.key,
//     required this.title,
//     required this.imageUrl,
//     required this.date,
//     required this.location,
//     required this.status,
//     required this.memberAvatars,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final colors = theme.colorScheme;
//
//     // Button colors based on status and theme
//     Color buttonBg = colors.primary;
//     Color buttonText = colors.onPrimary;
//
//     if (status == "Attended") {
//       buttonBg = const Color(0xFFC05441);
//     } else if (status == "Not Attended") {
//       buttonBg = const Color(0xFFFEB139);
//     }
//
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 5),
//       child: InkWell(
//         onTap: onTap, // Ab pure card pe tap kaam karega
//         borderRadius: BorderRadius.circular(20),
//         child: Container(
//           decoration: BoxDecoration(
//             color: colors.surface,
//             borderRadius: BorderRadius.circular(20),
//             border: Border.all(color: colors.outlineVariant.withOpacity(0.5)),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.04),
//                 blurRadius: 10,
//                 offset: const Offset(0, 4),
//               ),
//             ],
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               /// ---------- IMAGE SECTION ----------
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(16),
//                   child: AspectRatio(
//                     aspectRatio: 16 / 8,
//                     child: CustomNetworkImage(
//                       imageUrl: imageUrl,
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//
//               /// ---------- CONTENT SECTION ----------
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(14, 2, 14, 14),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     AppText(
//                       title,
//                       fontSize: 16,
//                       fontWeight: AppFonts.bold,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       color: colors.onSurface,
//                     ),
//                     const SizedBox(height: 6),
//
//                     /// Date + Location Row
//                     Row(
//                       children: [
//                         Icon(Icons.calendar_today_outlined, size: 13, color: colors.primary),
//                         const SizedBox(width: 4),
//                         AppText(date, fontSize: 12, color: colors.onSurfaceVariant),
//                         const SizedBox(width: 12),
//                         Icon(Icons.location_on_outlined, size: 15, color: colors.primary),
//                         const SizedBox(width: 2),
//                         Expanded(
//                           child: AppText(
//                             location,
//                             fontSize: 12,
//                             color: colors.onSurfaceVariant,
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ),
//
//                     const SizedBox(height: 12),
//
//                     /// Avatars + Status Button
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         _MemberAvatars(memberAvatars: memberAvatars),
//
//                         // Button logic
//                         SizedBox(
//                           height: 32,
//                           child: ElevatedButton(
//                             onPressed: onTap, // Same as card tap
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: buttonBg,
//                               padding: const EdgeInsets.symmetric(horizontal: 16),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(18),
//                               ),
//                               elevation: 0,
//                             ),
//                             child: AppText(
//                               status,
//                               fontSize: 12,
//                               fontWeight: AppFonts.medium,
//                               color: buttonText,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// /// ---------- MEMBER AVATARS ----------
// class _MemberAvatars extends StatelessWidget {
//   final List<String> memberAvatars;
//   const _MemberAvatars({required this.memberAvatars});
//
//   @override
//   Widget build(BuildContext context) {
//     final colors = Theme.of(context).colorScheme;
//     final int visibleCount = memberAvatars.length > 3 ? 4 : memberAvatars.length;
//
//     return SizedBox(
//       height: 30,
//       width: 85,
//       child: Stack(
//         children: List.generate(visibleCount, (index) {
//           if (index == 3) {
//             return Positioned(
//               left: index * 18.0,
//               child: CircleAvatar(
//                 radius: 14,
//                 backgroundColor: colors.surfaceVariant,
//                 child: AppText(
//                   "+${memberAvatars.length - 3}",
//                   fontSize: 9,
//                   fontWeight: AppFonts.bold,
//                   color: colors.onSurfaceVariant,
//                 ),
//               ),
//             );
//           }
//
//           return Positioned(
//             left: index * 18.0,
//             child: Container(
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(color: colors.surface, width: 2),
//               ),
//               child: CustomNetworkImage(
//                 imageUrl: memberAvatars[index],
//                 height: 25,
//                 width: 25,
//                 borderRadius: 15,
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_network_image.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String date;
  final String location;
  final String status; // Values: "RSVP", "Going", "Attended", "Not Attended"
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
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    // --- COLOR LOGIC ---
    Color buttonBg = colors.primary; // Default (RSVP)
    Color buttonText = colors.onPrimary;

    if (status == "Going") {
      buttonBg = const Color(0xFF2E7D32); // Green
    } else if (status == "Attended") {
      buttonBg = const Color(0xFFC05441); // Red
    } else if (status == "Not Attended") {
      buttonBg = const Color(0xFFFEB139); // Yellow
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: colors.outlineVariant.withOpacity(0.5)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: AspectRatio(
                    aspectRatio: 16 / 8,
                    child: CustomNetworkImage(
                      imageUrl: imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // Content
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 2, 14, 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      title,
                      fontSize: 16,
                      fontWeight: AppFonts.bold,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      color: colors.onSurface,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.calendar_today_outlined, size: 13, color: colors.primary),
                        const SizedBox(width: 4),
                        AppText(date, fontSize: 12, color: colors.onSurfaceVariant),
                        const SizedBox(width: 12),
                        Icon(Icons.location_on_outlined, size: 15, color: colors.primary),
                        const SizedBox(width: 2),
                        Expanded(
                          child: AppText(
                            location,
                            fontSize: 12,
                            color: colors.onSurfaceVariant,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _MemberAvatars(memberAvatars: memberAvatars),
                        SizedBox(
                          height: 32,
                          child: ElevatedButton(
                            onPressed: onTap,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: buttonBg,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              elevation: 0,
                            ),
                            child: AppText(
                              status, // "RSVP", "Going", etc.
                              fontSize: 12,
                              fontWeight: AppFonts.medium,
                              color: buttonText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MemberAvatars extends StatelessWidget {
  final List<String> memberAvatars;
  const _MemberAvatars({required this.memberAvatars});
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final int visibleCount = memberAvatars.length > 3 ? 4 : memberAvatars.length;
    return SizedBox(
      height: 30,
      width: 85,
      child: Stack(
        children: List.generate(visibleCount, (index) {
          if (index == 3) {
            return Positioned(
              left: index * 18.0,
              child: CircleAvatar(
                radius: 14,
                backgroundColor: colors.surfaceVariant,
                child: AppText("+${memberAvatars.length - 3}", fontSize: 9, fontWeight: AppFonts.bold, color: colors.onSurfaceVariant),
              ),
            );
          }
          return Positioned(
            left: index * 18.0,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: colors.surface, width: 2),
              ),
              child: CustomNetworkImage(imageUrl: memberAvatars[index], height: 25, width: 25, borderRadius: 15),
            ),
          );
        }),
      ),
    );
  }
}