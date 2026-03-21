// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../core/models/approval_request_model.dart';
// import '../../../../core/utils/app_colors.dart';
// import '../../../../core/utils/app_fonts.dart';
// import '../../../../core/widgets/app_text.dart';
// import '../../../../core/widgets/custom_network_image.dart';
//
// class IdentityApprovalCard extends StatelessWidget {
//   final ApprovalRequest request;
//   final VoidCallback onApprove;
//   final VoidCallback onReject;
//
//   const IdentityApprovalCard({
//     super.key,
//     required this.request,
//     required this.onApprove,
//     required this.onReject,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//
//     return Material(
//       color: Colors.transparent,
//       child: Container(
//         margin: const EdgeInsets.only(bottom: 20),
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: theme.colorScheme.surface,
//           borderRadius: BorderRadius.circular(25),
//           border: Border.all(color: theme.dividerColor.withOpacity(0.1)),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 CustomNetworkImage(imageUrl: request.userImage, height: 50, width: 50, borderRadius: 25),
//                 const SizedBox(width: 12),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     AppText(request.userName, fontSize: 16, fontWeight: AppFonts.semiBold),
//                     AppText(request.requestTime, fontSize: 12, color: Colors.grey),
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(height: 15),
//             Container(
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: AppColors.orangeColor.withOpacity(0.08),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   AppText("identity.claiming".tr, fontSize: 13, fontWeight: AppFonts.bold),
//                   const SizedBox(height: 10),
//                   Row(
//                     children: [
//                       CircleAvatar(radius: 18, backgroundColor: AppColors.orangeColor.withOpacity(0.2),
//                           child: const Icon(Icons.person, size: 20, color: AppColors.orangeColor)),
//                       const SizedBox(width: 10),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           AppText(request.claimingName, fontSize: 14, fontWeight: AppFonts.semiBold),
//                           AppText(request.claimingDetails, fontSize: 11),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 12),
//                   Row(
//                     children: [
//                       _proofButton(Icons.image_outlined, "identity.proof.photo".tr),
//                       const SizedBox(width: 10),
//                       _proofButton(Icons.description_outlined, "identity.proof.birth".tr),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               children: [
//                 Expanded(
//                   child: OutlinedButton(
//                     onPressed: onReject,
//                     style: OutlinedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       side: const BorderSide(color: AppColors.orangeColor),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//                     ),
//                     child: AppText("identity.reject".tr, color: AppColors.orangeColor),
//                   ),
//                 ),
//                 const SizedBox(width: 15),
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: onApprove,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.orangeColor,
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//                       elevation: 0,
//                     ),
//                     child: AppText("identity.approve".tr, color: Colors.white),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _proofButton(IconData icon, String label) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//       decoration: BoxDecoration(color: const Color(0xFFFFD8CC), borderRadius: BorderRadius.circular(20)),
//       child: Row(children: [
//         Icon(icon, size: 14, color: Colors.black87),
//         const SizedBox(width: 5),
//         AppText(label.tr, fontSize: 11, fontWeight: AppFonts.medium),
//       ]),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/models/approval_request_model.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_network_image.dart';

class IdentityApprovalCard extends StatelessWidget {
  final ApprovalRequest request;
  final VoidCallback onApprove;
  final VoidCallback onReject;

  const IdentityApprovalCard({
    super.key,
    required this.request,
    required this.onApprove,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: theme.dividerColor.withOpacity(0.1)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- HEADER: Avatar, Name, Time & View Details ---
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomNetworkImage(imageUrl: request.userImage, height: 50, width: 50, borderRadius: 25),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(request.userName, fontSize: 16, fontWeight: AppFonts.semiBold),
                        AppText(request.requestTime, fontSize: 12, color: Colors.grey),
                      ],
                    ),
                  ],
                ),
                // ISSUE 3: View details button
                GestureDetector(
                  onTap: () {
                    // Yahan aap doosri profile view karne ka logic laga sakte hain
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: AppText(
                      "View details",
                      fontSize: 12,
                      fontWeight: AppFonts.semiBold,
                      color: AppColors.orangeColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),

            // --- CLAIMING IDENTITY BOX ---
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                // ISSUE 1: Even lighter orange background
                color: AppColors.orangeColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.orangeColor.withOpacity(0.15)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ISSUE 1: Orange text for "CLAIMING IDENTITY"
                  AppText(
                    "identity.claiming".tr.toUpperCase(), // Uppercase jaisa screenshot me hai
                    fontSize: 11,
                    fontWeight: AppFonts.bold,
                    color: AppColors.orangeColor,
                    letterSpacing: 0.5,
                  ),
                  const SizedBox(height: 12),

                  // Target Identity Details
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        child: Icon(Icons.person, size: 24, color: Colors.grey.shade600),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(request.claimingName, fontSize: 15, fontWeight: AppFonts.semiBold),
                          AppText(request.claimingDetails, fontSize: 12, color: Colors.grey.shade600),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // Proof Buttons Row (If applicable)
                  Row(
                    children: [
                      _proofButton(Icons.image_outlined, "identity.proof.photo".tr),
                      const SizedBox(width: 10),
                      _proofButton(Icons.description_outlined, "identity.proof.birth".tr),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // ISSUE 2: Message/Description for claiming identity
                  AppText(
                    '"Please check my attached ID. I am the daughter."', // Aap ise request.message se replace kar sakte ho agar model me hai
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // --- BOTTOM ACTIONS (Reject / Approve) ---
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onReject,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      side: const BorderSide(color: AppColors.orangeColor, width: 1.2),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    child: AppText("identity.reject".tr, color: AppColors.orangeColor, fontWeight: AppFonts.semiBold),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onApprove,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.orangeColor,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      elevation: 0,
                    ),
                    // BONUS: Added Checkmark Icon for Approve button based on screenshot
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.check, color: Colors.white, size: 18),
                        const SizedBox(width: 6),
                        AppText("identity.approve".tr, color: Colors.white, fontWeight: AppFonts.semiBold),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // Updated proof button to match the lighter pill style in the image
  Widget _proofButton(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(children: [
        Icon(icon, size: 13, color: Colors.grey.shade700),
        const SizedBox(width: 5),
        AppText(label.tr, fontSize: 11, fontWeight: AppFonts.medium, color: Colors.grey.shade700),
      ]),
    );
  }
}