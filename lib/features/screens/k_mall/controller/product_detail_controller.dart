// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../data/product_model.dart';
//
// class ProductDetailController extends GetxController {
//   var selectedSize = "".obs;
//   var isLoading = false.obs;
//   var similarProducts = <ProductModel>[].obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     _loadSimilarProducts();
//   }
//
//   void _loadSimilarProducts() {
//     // Dummy Data for Similar List
//     similarProducts.value = [
//       ProductModel(id: "1", name: "LG TV", price: "330", image: "https://picsum.photos/200/301", category: "Electronics"),
//       ProductModel(id: "2", name: "Hoodie", price: "50", image: "https://picsum.photos/200/302", category: "Fashion"),
//       ProductModel(id: "3", name: "Jacket", price: "400", image: "https://picsum.photos/200/303", category: "Fashion"),
//     ];
//   }
//
//   bool shouldShowSize(String category) {
//     final cat = category.toLowerCase();
//     return cat.contains('fashion') || cat.contains('shoes') || cat.contains('clothing');
//   }
//
//   void selectSize(String size) {
//     selectedSize.value = size;
//   }
//
//   void addToCart(ProductModel product) {
//     if (shouldShowSize(product.category) && selectedSize.value.isEmpty) {
//       Get.rawSnackbar(
//         titleText: const Text("Select Size", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//         messageText: const Text("Please select a size first", style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.redAccent,
//       );
//       return;
//     }
//     Get.rawSnackbar(
//       titleText: const Text("Success", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//       messageText: Text("${product.name} added successfully!", style: const TextStyle(color: Colors.white)),
//       backgroundColor: Colors.green,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/k_mall_controller.dart';
import '../data/product_model.dart';

class ProductDetailController extends GetxController {
  var selectedSize = "".obs;
  var isLoading = false.obs;
  var similarProducts = <ProductModel>[].obs;

  // Main Controller ko find kiya taaki Cart sync rahe
  final KMallController mallController = Get.find<KMallController>();

  @override
  void onInit() {
    super.onInit();
    _loadSimilarProducts();
  }

  void _loadSimilarProducts() {
    // Dummy Data for Similar List
    similarProducts.value = [
      ProductModel(id: "1", name: "LG TV", price: "330", image: "https://picsum.photos/200/301", category: "Electronics"),
      ProductModel(id: "2", name: "Hoodie", price: "50", image: "https://picsum.photos/200/302", category: "Fashion"),
      ProductModel(id: "3", name: "Jacket", price: "400", image: "https://picsum.photos/200/303", category: "Fashion"),
    ];
  }

  bool shouldShowSize(String category) {
    final cat = category.toLowerCase();
    return cat.contains('fashion') || cat.contains('shoes') || cat.contains('clothing');
  }

  void selectSize(String size) {
    selectedSize.value = size;
  }

  // Pure logic for adding to shared cart
  void addToCart(ProductModel product) {
    // Agar Fashion item hai toh size check karega
    if (shouldShowSize(product.category) && selectedSize.value.isEmpty) {
      Get.rawSnackbar(
        messageText: const Text("Please select a size first",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(15),
        borderRadius: 10,
      );
      return;
    }

    // Actual Add to Cart calling the main controller
    mallController.addToCart(product);
  }
}