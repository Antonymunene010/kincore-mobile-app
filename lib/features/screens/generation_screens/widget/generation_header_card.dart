import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
import '../model/generation_model.dart';

class GenerationHeaderCard extends StatelessWidget {
  final GenerationModel data;
  const GenerationHeaderCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: colors.surface,
        // 1px Grey Border
        border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1),

        // [CHANGE] Ab radius chaaron taraf (All Sides) same rahega
        borderRadius: BorderRadius.circular(35),

        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, 10))
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              // Profile Image Border
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1),
                ),
                child: CircleAvatar(radius: 55, backgroundImage: NetworkImage(data.image)),
              ),
              Positioned(
                  bottom: 0, right: 0,
                  child: CircleAvatar(
                      radius: 15, backgroundColor: Colors.white,
                      child: const Icon(Icons.camera_enhance_outlined, size: 16, color: Colors.orange)
                  )
              ),
            ],
          ),
          const SizedBox(height: 15),
          AppText(data.name, fontSize: 22, fontWeight: AppFonts.bold),
          AppText("${data.lifeSpan} / ${data.role}", fontSize: 14, color: Colors.grey),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _statItem("42", 'generation.members'.tr),
              _statItem("4", 'generation.generation'.tr),
              _statItem("75", 'generation.years'.tr),
            ],
          )
        ],
      ),
    );
  }

  Widget _statItem(String val, String label) {
    return Container(
      width: 90,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.orangeShadeColor,
        borderRadius: BorderRadius.circular(15),
        // Stat Item Border
        border: Border.all(color: AppColors.orangeColor, width: 1.5),
      ),
      child: Column(children: [
        AppText(val, fontSize: 18, fontWeight: AppFonts.bold, color: Colors.black),
        AppText(label, fontSize: 12, color: Colors.black54),
      ]),
    );
  }
}
