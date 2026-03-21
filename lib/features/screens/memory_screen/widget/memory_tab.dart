import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';

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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Row(
        children: tabs.map((tab) {
          final bool isSelected = selectedTab == tab;

          return Expanded(
            child: GestureDetector(
              onTap: () => onTabChanged(tab),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected
                      ? colorScheme.primary
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: AppText(
                  tab,
                  fontSize: 14,
                  fontWeight: AppFonts.medium,
                  color: isSelected
                      ? colorScheme.onPrimary
                      : colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
