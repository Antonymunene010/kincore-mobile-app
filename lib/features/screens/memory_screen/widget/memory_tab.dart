import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/app_text.dart';

class MemoryTabSwitcher extends StatelessWidget {
  final List<String> tabs;
  final String selectedTab;
  final Function(String) onTabChanged;

  const MemoryTabSwitcher({
    super.key,
    required this.tabs,
    required this.selectedTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: tabs.map((tab) {
          bool isSelected = selectedTab == tab;
          return Expanded(
            child: GestureDetector(
              onTap: () => onTabChanged(tab),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.orangeColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: AppText(
                  tab,
                  color: isSelected ? Colors.white : Colors.black54,
                  fontWeight: AppFonts.medium,
                  fontSize: 14,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}