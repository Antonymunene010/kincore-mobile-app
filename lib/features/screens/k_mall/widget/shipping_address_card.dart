import 'package:flutter/material.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
import 'package:get/get.dart';
class ShippingAddressCard extends StatelessWidget {
  final String title;
  final String address;
  final VoidCallback onEdit;

  const ShippingAddressCard({
    super.key,
    required this.title,
    required this.address,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFFFF7043).withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFFF7043).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.location_on, color: Color(0xFFFF7043), size: 24),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(title, fontSize: 16, fontWeight: AppFonts.bold),
                AppText(address, fontSize: 13, color: Colors.grey, maxLines: 2),
              ],
            ),
          ),
          TextButton(
            onPressed: onEdit,
            child:  AppText('common.edit'.tr, color: Color(0xFFFF7043), fontWeight: AppFonts.bold),
          ),
        ],
      ),
    );
  }
}