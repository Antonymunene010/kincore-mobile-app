import 'package:flutter/material.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
import '../controller/k_mall_controller.dart';
import 'package:get/get.dart';

class MallCategoryIcons extends StatelessWidget {
  final ColorScheme colors;
  final KMallController controller;

  const MallCategoryIcons({
    super.key,
    required this.colors,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final Color darkOrange = AppColors.orangeColor;
    final Color lightOrangeShade = darkOrange.withOpacity(0.12);

    List<Map<String, dynamic>> cats = [
      {"name": 'mall.category.fashion'.tr, "icon": Icons.checkroom},
      {"name": 'mall.category.electronics'.tr, "icon": Icons.laptop},
      {"name": 'mall.category.appliances'.tr, "icon": Icons.kitchen},
      {"name": 'mall.category.beauty'.tr, "icon": Icons.face},
      {"name": 'mall.category.furniture'.tr, "icon": Icons.weekend},
    ];

    return Container(
      height: 110,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 15),
        physics: const BouncingScrollPhysics(),
        itemCount: cats.length,
        itemBuilder: (context, i) => InkWell(
          onTap: () => controller.changeCategory(cats[i]['name']),
          child: Padding(
            padding: const EdgeInsets.only(right: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: lightOrangeShade,
                    shape: BoxShape.circle,
                    border: Border.all(color: darkOrange.withOpacity(0.2), width: 1),
                  ),
                  child: Icon(cats[i]['icon'], color: darkOrange, size: 28),
                ),
                const SizedBox(height: 10),
                AppText(
                  cats[i]['name'],
                  fontSize: 12,
                  fontWeight: AppFonts.medium,
                  color: colors.onSurface.withOpacity(0.8),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}