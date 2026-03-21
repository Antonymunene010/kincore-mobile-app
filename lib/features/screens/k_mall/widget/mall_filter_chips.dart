import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import '../../../../core/widgets/app_text.dart';
import '../controller/k_mall_controller.dart';

class MallFilterChips extends StatelessWidget {
  final ColorScheme colors;
  final KMallController controller;

  const MallFilterChips({
    super.key,
    required this.colors,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    List<String> filters = [
      'common.all'.tr,
      'mall.filterPrice'.tr,
      'mall.filterColor'.tr,
      'mall.filterGender'.tr
    ];    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 15),
        itemCount: filters.length,
        itemBuilder: (context, i) {
          return GetBuilder<KMallController>(
            id: 'category_list',
            builder: (controller) {
              bool isSelected = controller.selectedCategory == filters[i];
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: () => controller.changeCategory(filters[i]),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.orangeColor : colors.surfaceVariant.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected ? Colors.transparent : colors.outlineVariant.withOpacity(0.3),
                      ),
                    ),
                    child: AppText(
                      filters[i],
                      fontSize: 13,
                      color: isSelected ? Colors.white : colors.onSurfaceVariant,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}