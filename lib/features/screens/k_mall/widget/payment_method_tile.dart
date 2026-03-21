import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
import '../controller/k_mall_controller.dart';

class PaymentMethodTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final String value; // Required
  final KMallController ctrl; // Required
  final VoidCallback onTap; // Added back for flexibility

  const PaymentMethodTile({
    super.key,
    required this.title,
    required this.icon,
    required this.value,
    required this.ctrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      bool isSelected = ctrl.selectedPayment.value == value;
      return GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.orangeColor.withOpacity(0.1) : (isDark ? Colors.grey[900] : Colors.white),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: isSelected ? AppColors.orangeColor : (isDark ? Colors.grey[800]! : Colors.grey[200]!),
              width: isSelected ? 1.5 : 1,
            ),
          ),
          child: Row(
            children: [
              Icon(icon, color: isSelected ? AppColors.orangeColor : Colors.grey),
              const SizedBox(width: 15),
              Expanded(child: AppText(title, fontSize: 15, fontWeight: FontWeight.bold)),
              Icon(
                isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                color: isSelected ? AppColors.orangeColor : Colors.grey.shade300,
              ),
            ],
          ),
        ),
      );
    });
  }
}