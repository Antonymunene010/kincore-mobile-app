import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MallSearchBar extends StatelessWidget {
  const MallSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: colors.surfaceVariant.withOpacity(0.3),
          borderRadius: BorderRadius.circular(25),
          // Agar aapko bahar ek outline chahiye toh yahan border add kar sakte ho:
          border: Border.all(color: colors.outlineVariant.withOpacity(0.5)),
        ),
        child: TextField(
          style: TextStyle(color: colors.onSurface),
          decoration: InputDecoration(
            hintText: 'mall.searchHint'.tr,
            hintStyle: TextStyle(color: colors.onSurfaceVariant),
            prefixIcon: Icon(CupertinoIcons.search, color: colors.onSurfaceVariant),

            // [FIXED]: Teeno borders ko explicitly none karna zaroori hai
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,

            contentPadding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ),
    );
  }
}