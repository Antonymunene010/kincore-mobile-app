import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/app_text.dart';
import '../controller/k_mall_controller.dart';

class RewardCoinsSection extends StatelessWidget {
  final KMallController ctrl;
  const RewardCoinsSection({super.key, required this.ctrl});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Expanded(
            child: TextField(
              style: TextStyle(color: isDark ? Colors.white : Colors.black), // Text Color Fix
              decoration: InputDecoration(
                hintText: "checkout.applyKcc".tr,
                hintStyle: TextStyle(color: isDark ? Colors.grey[400] : Colors.grey),
                filled: true,
                fillColor: isDark ? Colors.grey[800] : Colors.grey[100], // Background Fix
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFFEBE6), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            child: AppText("checkout.apply".tr, color: const Color(0xFFFF7043)),
          ),
        ]),
        const SizedBox(height: 8),
        Obx(() => AppText("checkout.youHaveKcc".trParams({'count': ctrl.rewardCoins.value.toString()}), fontSize: 12, color: Colors.orange)),
      ],
    );
  }
}
