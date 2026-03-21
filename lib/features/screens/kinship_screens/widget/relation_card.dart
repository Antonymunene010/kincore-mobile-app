import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/relationship_controller.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/utils/app_fonts.dart';

class RelationCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final String countKey;

  const RelationCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.countKey
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RelationshipController>();
    final theme = Theme.of(context);
    final double screenW = Get.width;

    return Column(
      children: [
        // --- Responsive Main Card ---
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: color.withOpacity(0.05),
              borderRadius: BorderRadius.circular(screenW * 0.05), // Responsive radius
              border: Border.all(color: color.withOpacity(0.4), width: 1.5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: screenW * 0.12, color: color), // Responsive Icon size
                SizedBox(height: screenW * 0.02),
                AppText(title, color: color, fontWeight: AppFonts.bold, fontSize: 16),
              ],
            ),
          ),
        ),
        SizedBox(height: screenW * 0.025),

        // --- Responsive Counter Buttons ---
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _counterBtn(Icons.remove, Colors.redAccent.withOpacity(0.6), () => controller.decrement(countKey), screenW),
            Obx(() => _counterBtnText("+${controller.counts[countKey]}", Colors.green, screenW)),
            _counterBtn(Icons.add, Colors.green, () => controller.increment(countKey), screenW, isAdd: true),
          ],
        )
      ],
    );
  }

  Widget _counterBtn(IconData icon, Color bg, VoidCallback onTap, double screenW, {bool isAdd = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: screenW * 0.04, vertical: 8),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }

  Widget _counterBtnText(String text, Color bg, double screenW) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenW * 0.035, vertical: 8),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: AppText(text, color: Colors.white, fontWeight: AppFonts.bold, fontSize: 14),
    );
  }
}