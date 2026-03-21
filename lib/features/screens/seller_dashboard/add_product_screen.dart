// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../core/utils/app_fonts.dart';
// import '../../../core/widgets/app_text.dart';
// import '../../../core/widgets/custom_input_field.dart';
//
// class AddProductScreen extends StatelessWidget {
//   const AddProductScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(AddProductController());
//
//     final theme = Theme.of(context);
//     final colors = theme.colorScheme;
//     final double screenW = Get.width;
//     final double screenH = Get.height;
//
//     return Scaffold(
//       backgroundColor: theme.scaffoldBackgroundColor,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios_new_rounded, color: colors.onSurface, size: 20),
//           onPressed: () => Get.back(),
//         ),
//         title: AppText('addProduct.title'.tr, fontSize: 18, fontWeight: AppFonts.semiBold, color: colors.onSurface),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: screenW * 0.05),
//         physics: const BouncingScrollPhysics(),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 10),
//             AppText('addProduct.detailsPrompt'.tr, fontSize: 16, fontWeight: AppFonts.bold),
//             const SizedBox(height: 20),
//             AppText('addProduct.uploadImagesTitle'.tr, fontSize: 15, fontWeight: AppFonts.semiBold),
//             const SizedBox(height: 5),
//             AppText('addProduct.uploadImagesDesc'.tr, fontSize: 13, color: colors.onSurface.withOpacity(0.6)),
//             const SizedBox(height: 20),
//             Container(
//               width: double.infinity,
//               height: screenH * 0.2,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(25),
//                 border: Border.all(color: colors.outlineVariant, style: BorderStyle.solid),
//                 color: colors.surfaceVariant.withOpacity(0.3),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   AppText('addProduct.addMedia'.tr, fontSize: 16, fontWeight: AppFonts.semiBold),
//                   const SizedBox(height: 5),
//                   AppText('addProduct.dragAndDrop'.tr, fontSize: 13, color: colors.onSurface.withOpacity(0.5)),
//                   const SizedBox(height: 15),
//                   ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xffFFE5E0),
//                       elevation: 0,
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                     ),
//                     child: Text('common.addFile'.tr, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//                   )
//                 ],
//               ),
//             ),
//             const SizedBox(height: 25),
//             AppText('addProduct.basicInfo'.tr, fontSize: 18, fontWeight: AppFonts.bold),
//             CustomInputField(label: 'addProduct.productNameLabel'.tr, hint: 'common.add'.tr, controller: controller.nameController),
//             CustomInputField(label: 'addProduct.priceLabel'.tr, hint: 'common.add'.tr, controller: controller.priceController),
//             CustomInputField(label: 'addProduct.discountLabel'.tr, hint: 'common.add'.tr, controller: controller.discountController),
//             CustomInputField(label: 'addProduct.descriptionLabel'.tr, hint: 'common.add'.tr, controller: controller.descController, maxLines: 4),
//             CustomInputField(label: 'addProduct.sizeLabel'.tr, hint: 'common.add'.tr, controller: controller.sizeController),
//             CustomInputField(label: 'addProduct.conditionsLabel'.tr, hint: 'common.add'.tr, controller: controller.conditionController),
//             CustomInputField(label: 'addProduct.brandNameLabel'.tr, hint: 'common.add'.tr, controller: controller.brandController),
//             CustomInputField(label: 'addProduct.profileLabel'.tr, hint: 'common.select'.tr, suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded)),
//             CustomInputField(label: 'addProduct.categoryLabel'.tr, hint: 'common.select'.tr, suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded)),
//             CustomInputField(label: 'addProduct.subCategoryLabel'.tr, hint: 'common.select'.tr, suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded)),
//             CustomInputField(label: 'addProduct.quantityLabel'.tr, hint: 'common.select'.tr, suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded)),
//             const SizedBox(height: 30),
//             SizedBox(
//               width: double.infinity,
//               height: 55,
//               child: ElevatedButton(
//                 onPressed: () => controller.publishProduct(),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFFFF6433),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//                 ),
//                 child: AppText('addProduct.publishButton'.tr, color: Colors.white, fontSize: 16, fontWeight: AppFonts.bold),
//               ),
//             ),
//             const SizedBox(height: 40),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class AddProductController extends GetxController {
//   final nameController = TextEditingController();
//   final priceController = TextEditingController();
//   final discountController = TextEditingController();
//   final descController = TextEditingController();
//   final sizeController = TextEditingController();
//   final conditionController = TextEditingController();
//   final brandController = TextEditingController();
//
//   void publishProduct() {
//     Get.snackbar('common.success'.tr, 'common.productPublished'.tr,
//         snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green, colorText: Colors.white);
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_input_field.dart';
import 'controller/add_product_controller.dart';
import 'widget/drop_down_field.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddProductController());

    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final double screenW = Get.width;
    final double screenH = Get.height;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: colors.onSurface, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText('addProduct.title'.tr, fontSize: 18, fontWeight: AppFonts.semiBold, color: colors.onSurface),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenW * 0.05),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            AppText('addProduct.detailsPrompt'.tr, fontSize: 16, fontWeight: AppFonts.bold),
            const SizedBox(height: 20),
            AppText('addProduct.uploadImagesTitle'.tr, fontSize: 15, fontWeight: AppFonts.semiBold),
            const SizedBox(height: 5),
            AppText('addProduct.uploadImagesDesc'.tr, fontSize: 13, color: colors.onSurface.withOpacity(0.6)),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: screenH * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: colors.outlineVariant, style: BorderStyle.solid),
                color: colors.surfaceVariant.withOpacity(0.3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText('addProduct.addMedia'.tr, fontSize: 16, fontWeight: AppFonts.semiBold),
                  const SizedBox(height: 5),
                  AppText('addProduct.dragAndDrop'.tr, fontSize: 13, color: colors.onSurface.withOpacity(0.5)),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffFFE5E0),
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text('common.addFile'.tr, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
            const SizedBox(height: 25),
            AppText('addProduct.basicInfo'.tr, fontSize: 18, fontWeight: AppFonts.bold),
            CustomInputField(label: 'addProduct.productNameLabel'.tr, hint: 'common.add'.tr, controller: controller.nameController),
            CustomInputField(label: 'addProduct.priceLabel'.tr, hint: 'common.add'.tr, controller: controller.priceController),
            CustomInputField(label: 'addProduct.discountLabel'.tr, hint: 'common.add'.tr, controller: controller.discountController),
            CustomInputField(label: 'addProduct.descriptionLabel'.tr, hint: 'common.add'.tr, controller: controller.descController, maxLines: 4),
            CustomInputField(label: 'addProduct.sizeLabel'.tr, hint: 'common.add'.tr, controller: controller.sizeController),
            CustomInputField(label: 'addProduct.brandNameLabel'.tr, hint: 'common.add'.tr, controller: controller.brandController),

            // [NEW]: Separate Class Dropdowns Used Here
            CustomDropdownField(
              label: 'addProduct.conditionsLabel'.tr,
              hint: 'common.select'.tr,
              selectedValue: controller.selectedCondition,
              options: controller.conditions,
            ),

            CustomInputField(label: 'addProduct.profileLabel'.tr, hint: 'common.select'.tr, suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded)),

            CustomDropdownField(
              label: 'addProduct.categoryLabel'.tr,
              hint: 'common.select'.tr,
              selectedValue: controller.selectedCategory,
              options: controller.categories,
            ),

            CustomDropdownField(
              label: 'addProduct.subCategoryLabel'.tr,
              hint: 'common.select'.tr,
              selectedValue: controller.selectedSubCategory,
              options: controller.subCategories,
            ),

            CustomInputField(label: 'addProduct.quantityLabel'.tr, hint: 'common.select'.tr, suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded)),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () => controller.publishProduct(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6433),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: AppText('addProduct.publishButton'.tr, color: Colors.white, fontSize: 16, fontWeight: AppFonts.bold),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

