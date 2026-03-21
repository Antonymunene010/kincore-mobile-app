import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';

class CustomDropdownField extends StatelessWidget {
  final String label;
  final String hint;
  final RxnString selectedValue;
  final List<String> options;

  const CustomDropdownField({
    super.key,
    required this.label,
    required this.hint,
    required this.selectedValue,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(label, fontSize: 13, fontWeight: AppFonts.semiBold, color: colors.onSurface),
          const SizedBox(height: 8),
          Obx(() => DropdownButtonFormField<String>(
            value: selectedValue.value,
            hint: AppText(hint, color: colors.outline),
            icon: const Icon(Icons.keyboard_arrow_down_rounded),
            decoration: InputDecoration(
              filled: true,
              fillColor: colors.surface,
              contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: colors.outlineVariant.withOpacity(0.5)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: colors.outlineVariant.withOpacity(0.5)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Color(0xFFFF6433)),
              ),
            ),
            items: options.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: AppText(value, fontSize: 14),
              );
            }).toList(),
            onChanged: (newValue) {
              selectedValue.value = newValue;
            },
          )),
        ],
      ),
    );
  }
}