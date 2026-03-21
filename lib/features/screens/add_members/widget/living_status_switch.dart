import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/utils/app_colors.dart';

class LivingStatusWidget extends StatelessWidget {
  // Yahan humne specific controller ki jagah RxBool liya hai
  final RxBool livingStatus;

  const LivingStatusWidget({super.key, required this.livingStatus});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), // FIXED Radius
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                'addMember.livingStatus'.tr,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                'addMember.isAlive'.tr,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
              ),
            ],
          ),
          Obx(() => Switch(
            value: livingStatus.value,
            activeColor: Colors.white,
            activeTrackColor: AppColors.orangeColor,
            onChanged: (val) => livingStatus.value = val,
          )),
        ],
      ),
    );
  }
}