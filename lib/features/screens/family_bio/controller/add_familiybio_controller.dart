// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class AddFamilyBioController extends GetxController {
//   final nameController = TextEditingController();
//   final locationController = TextEditingController();
//   final dateController = TextEditingController();
//   final bioController = TextEditingController();
//
//   // Font size list and state
//   var selectedFontSize = 14.0.obs;
//   final List<double> fontSizes = [10, 12, 14, 16, 18, 20, 22];
//
//   // Formatting states
//   var isBold = false.obs;
//   var isItalic = false.obs;
//   var isUnderlined = false.obs;
//
//   // Toggle Logic
//   void toggleBold() => isBold.value = !isBold.value;
//   void toggleItalic() => isItalic.value = !isItalic.value;
//   void toggleUnderline() => isUnderlined.value = !isUnderlined.value;
//
//   // Bullet Points logic
//   void addBullet() {
//     final text = bioController.text;
//     final selection = bioController.selection;
//     const bullet = "• ";
//     if (selection.isValid) {
//       bioController.text = text.replaceRange(selection.start, selection.end, bullet);
//     } else {
//       bioController.text = text + bullet;
//     }
//   }
//
//   // Date Picker bina kisi package ke
//   Future<void> selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime(2100),
//     );
//     if (picked != null) {
//       dateController.text = "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
//     }
//   }
//
//   void publishBio() {
//     if (nameController.text.isEmpty) {
//       Get.snackbar("Error", "Please fill required fields", backgroundColor: Colors.redAccent, colorText: Colors.white);
//     } else {
//       Get.back();
//       Get.snackbar("Success", "Bio Published!");
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Selection range model
class TextFormatRange {
  TextRange range;
  final bool bold;
  final bool italic;
  final double fontSize;
  TextFormatRange({required this.range, required this.bold, required this.italic, required this.fontSize});
}

// Custom RichTextController
class RichTextController extends TextEditingController {
  final AddFamilyBioController controller;
  RichTextController(this.controller);

  @override
  TextSpan buildTextSpan({required BuildContext context, TextStyle? style, required bool withComposing}) {
    return controller.buildRichTextSpan(text, style);
  }
}

class AddFamilyBioController extends GetxController {
  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final dateController = TextEditingController();

  // Late initialization fix
  late final RichTextController bioController;

  // Formatting state
  final RxList<TextFormatRange> formatRanges = <TextFormatRange>[].obs;
  var selectedFontSize = 14.0.obs;
  final List<double> fontSizes = [10, 12, 14, 16, 18, 20, 22];
  var isBold = false.obs;
  var isItalic = false.obs;

  @override
  void onInit() {
    super.onInit();
    bioController = RichTextController(this);

    // Range error se bachne ke liye text change listener
    bioController.addListener(() {
      _cleanupRanges();
    });
  }

  // Text delete hone par invalid ranges hatane ke liye function
  void _cleanupRanges() {
    final textLength = bioController.text.length;
    formatRanges.removeWhere((rangeData) =>
    rangeData.range.start >= textLength || rangeData.range.end > textLength
    );
  }

  void applyFormatting({bool? bold, bool? italic, double? size}) {
    final selection = bioController.selection;
    if (selection.isValid && !selection.isCollapsed) {
      // Pehle purani range agar overlap ho rahi ho toh clean karo
      formatRanges.removeWhere((r) =>
      (selection.start >= r.range.start && selection.start < r.range.end) ||
          (selection.end > r.range.start && selection.end <= r.range.end)
      );

      formatRanges.add(TextFormatRange(
        range: TextRange(start: selection.start, end: selection.end),
        bold: bold ?? isBold.value,
        italic: italic ?? isItalic.value,
        fontSize: size ?? selectedFontSize.value,
      ));

      formatRanges.refresh();

      // UI refresh trigger
      final currentText = bioController.text;
      bioController.value = bioController.value.copyWith(
        text: currentText,
        selection: selection,
      );
    }
  }

  TextSpan buildRichTextSpan(String text, TextStyle? baseStyle) {
    if (formatRanges.isEmpty) return TextSpan(text: text, style: baseStyle);

    List<TextSpan> children = [];
    int lastIndex = 0;

    // Sort ranges
    List<TextFormatRange> sortedRanges = List.from(formatRanges);
    sortedRanges.sort((a, b) => a.range.start.compareTo(b.range.start));

    for (var rangeData in sortedRanges) {
      // Range check taaki crash na ho (RangeError fix)
      if (rangeData.range.start >= text.length) continue;
      int end = rangeData.range.end > text.length ? text.length : rangeData.range.end;

      if (rangeData.range.start > lastIndex) {
        children.add(TextSpan(text: text.substring(lastIndex, rangeData.range.start), style: baseStyle));
      }

      children.add(TextSpan(
        text: text.substring(rangeData.range.start, end),
        style: baseStyle?.copyWith(
          fontWeight: rangeData.bold ? FontWeight.bold : FontWeight.normal,
          fontStyle: rangeData.italic ? FontStyle.italic : FontStyle.normal,
          fontSize: rangeData.fontSize,
        ),
      ));
      lastIndex = end;
    }

    if (lastIndex < text.length) {
      children.add(TextSpan(text: text.substring(lastIndex), style: baseStyle));
    }

    return TextSpan(children: children, style: baseStyle);
  }

  void toggleBold() {
    isBold.value = !isBold.value;
    applyFormatting(bold: isBold.value);
  }

  void toggleItalic() {
    isItalic.value = !isItalic.value;
    applyFormatting(italic: isItalic.value);
  }

  void changeFontSize(double size) {
    selectedFontSize.value = size;
    applyFormatting(size: size);
  }

  void addBullet() {
    final text = bioController.text;
    final selection = bioController.selection;
    const bullet = "• ";
    if (selection.isValid) {
      bioController.text = text.replaceRange(selection.start, selection.end, bullet);
    } else {
      bioController.text = text + bullet;
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      dateController.text = "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
    }
  }

  void publishBio() {
    if (nameController.text.isEmpty) {
      Get.snackbar(
          'familyBio.errorTitle'.tr,
          'familyBio.nameRequired'.tr,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white
      );
    } else {
      Get.back();
      Get.snackbar(
        'familyBio.successTitle'.tr,
        'familyBio.publishedMsg'.tr,
      );
    }
  }
}