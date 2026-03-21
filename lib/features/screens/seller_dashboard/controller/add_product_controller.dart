import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final discountController = TextEditingController();
  final descController = TextEditingController();
  final sizeController = TextEditingController();
  final brandController = TextEditingController();

  // Condition dropdown logic
  final List<String> conditions = ['New', 'Used - Like New', 'Used - Good', 'Used - Fair'];
  var selectedCondition = RxnString();

  // Categories & SubCategories dropdown logic (Configure from backend)
  final List<String> categories = ['Electronics', 'Vehicles', 'Property', 'Apparel', 'Home & Garden'];
  var selectedCategory = RxnString();

  final List<String> subCategories = ['Mobile Phones', 'Laptops', 'Cars', 'Men\'s Clothing', 'Furniture'];
  var selectedSubCategory = RxnString();

  void publishProduct() {
    Get.snackbar(
        'common.success'.tr,
        'common.productPublished'.tr,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white
    );
  }
}