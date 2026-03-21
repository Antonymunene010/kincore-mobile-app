import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../check_out_screen.dart';
import '../data/poster_model.dart';
import '../data/product_model.dart';
import '../order_history_screen.dart';

class KMallController extends GetxController {
  final List<PosterModel> posters = [];
  final List<ProductModel> allFeaturedProducts = [];
  final List<ProductModel> allPopularProducts = [];

  final RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  final RxList<ProductModel> popularProducts = <ProductModel>[].obs;
  final RxList<ProductModel> wishlistProducts = <ProductModel>[].obs;
  final RxList<ProductModel> cartList = <ProductModel>[].obs;

  final RxList<Map<String, dynamic>> orderHistory = <Map<String, dynamic>>[].obs;

  bool isLoading = true;
  int currentBannerIndex = 0;
  String selectedCategory = "All";


  var rewardCoins = 0.obs;
  var taxPercent = 0.0.obs;
  var shippingFee = 0.0.obs;
  var useCredits = false.obs;

  var selectedPayment = "Credit Card".obs;
  ProductModel? checkoutProduct;

  double get totalCartPrice => cartList.fold(0, (sum, item) => sum + double.parse(item.price));
  double get totalWithTax => totalCartPrice + (totalCartPrice * taxPercent.value / 100) + shippingFee.value;
  double get checkoutSubtotal => checkoutProduct != null ? double.parse(checkoutProduct!.price) : totalCartPrice;
  double get checkoutTotal => checkoutSubtotal + (checkoutSubtotal * taxPercent.value / 100) + shippingFee.value;

  @override
  void onInit() {
    super.onInit();
    // Flow: Pehle data load hoga, fir UI fetch hoga
    fetchKmallData();
    fetchCheckoutDetails();
  }

  void fetchKmallData() async {
    isLoading = true;
    update(['loading']);

    // --- STEP 1: Add Dummy Data to main lists ---

    // Posters data
    // posters.assignAll([
    //   PosterModel(id: "1", imageUrl: "https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da?w=800", title: "Get Winter Discount", discount: "20% Off"),
    //   PosterModel(id: "2", imageUrl: "https://images.unsplash.com/photo-1544441893-675973e31d85?w=800", title: "Get Winter Discount", discount: "20% Off"),
    //   PosterModel(id: "3", imageUrl: "https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da?w=800", title: "Get Winter Discount", discount: "20% Off"),
    //   PosterModel(id: "4", imageUrl: "https://images.unsplash.com/photo-1544441893-675973e31d85?w=800", title: "Get Winter Discount", discount: "20% Off"),
    // ]);

    posters.assignAll([
      // Banner 1: Fashion / Winter Sale
      PosterModel(
          id: "1",
          imageUrl: "https://images.unsplash.com/photo-1483985988355-763728e1935b?auto=format&fit=crop&w=800&q=80",
          title: "Winter Collection",
          discount: "Up to 50% Off"
      ),

      // Banner 2: Electronics / Gadgets
      PosterModel(
          id: "2",
          imageUrl: "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=800&q=80",
          title: "Tech Week Sale",
          discount: "Flat 30% Off"
      ),

      // Banner 3: Footwear / Sneakers
      PosterModel(
          id: "3",
          imageUrl: "https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=800&q=80",
          title: "Exclusive Kicks",
          discount: "New Arrivals"
      ),

      // Banner 4: Accessories / Watches
      PosterModel(
          id: "4",
          imageUrl: "https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&w=800&q=80",
          title: "Smart Wearables",
          discount: "Buy 1 Get 1"
      ),
    ]);
    // Featured Products load karo
    allFeaturedProducts.assignAll([
      ProductModel(
          id: "1",
          name: "Modern Chair",
          price: "120",
          image: "https://images.unsplash.com/photo-1592078615290-033ee584e267?w=400",
          category: "Furniture",
          rating: 4.5,
          reviews: 10
      ),
      ProductModel(
          id: "2",
          name: "iPhone 15 Pro",
          price: "999",
          image: "https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=400",
          category: "Electronics",
          rating: 4.9,
          reviews: 85
      ),
    ]);

    // Popular Products load karo
    allPopularProducts.assignAll([
      ProductModel(
          id: "3",
          name: "Nike Sneakers",
          price: "150",
          image: "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400",
          category: "Fashion",
          rating: 4.3,
          reviews: 45
      ),
      ProductModel(
          id: "4",
          name: "Classic Watch",
          price: "200",
          image: "https://images.unsplash.com/photo-1524592094714-0f0654e20314?w=400",
          category: "Accessories",
          rating: 4.7,
          reviews: 30
      ),
    ]);

    // --- STEP 2: Sync to Reactive Lists ---
    featuredProducts.assignAll(allFeaturedProducts);
    popularProducts.assignAll(allPopularProducts);

    isLoading = false;

    // --- STEP 3: Update all UI IDs ---
    update(['loading', 'featured_section', 'popular_section', 'product_grid', 'posters', 'products']);
  }

  void placeOrder() {
    if (checkoutProduct == null) return;

    orderHistory.insert(0, {
      "id": "OD - ${1000 + orderHistory.length}",
      "product": checkoutProduct,
      "date": "Feb 06, 2026",
      "status": "Processing",
      "total": checkoutTotal.toStringAsFixed(2),
    });

    cartList.removeWhere((item) => item.id == checkoutProduct!.id);
    _showSnack("Order Placed via ${selectedPayment.value}", Colors.green);
    Get.to(() => const OrderHistoryScreen());
    update(['cart_screen', 'cart_count', 'order_history']);
  }

  void changeBanner(int index) {
    currentBannerIndex = index;
    update(['banner_dots']);
  }

  void changeCategory(String category) {
    selectedCategory = category;
    if (category == "All") {
      featuredProducts.assignAll(allFeaturedProducts);
      popularProducts.assignAll(allPopularProducts);
    } else {
      featuredProducts.assignAll(allFeaturedProducts.where((e) => e.category == category).toList());
      popularProducts.assignAll(allPopularProducts.where((e) => e.category == category).toList());
    }
    update(['category_list', 'product_grid', 'featured_section', 'popular_section']);
  }

  void setPayment(String method) {
    selectedPayment.value = method;
    update(['checkout_screen']);
  }

  void fetchCheckoutDetails() async {
    await Future.delayed(const Duration(milliseconds: 500));
    rewardCoins.value = 546;
    taxPercent.value = 10.0;
    shippingFee.value = 0.0;
    update(['checkout_logic', 'cart_screen', 'checkout_screen']);
  }

  void setCheckoutProduct(ProductModel product) {
    checkoutProduct = product;
    update(['checkout_screen']);
    Get.to(() => const CheckoutScreen());
  }

  void addToCart(ProductModel product) {
    if (!cartList.any((item) => item.id == product.id)) {
      cartList.add(product);
      _showSnack("${product.name} added to cart", const Color(0xFFFF7043));
    } else {
      _showSnack("Already in cart", Colors.grey);
    }
    update(['cart_screen', 'cart_count']);
  }

  void removeFromCart(String productId) {
    cartList.removeWhere((item) => item.id == productId);
    update(['cart_screen']);
  }

  void toggleFavorite(ProductModel product) {
    int index = wishlistProducts.indexWhere((item) => item.id == product.id);
    if (index == -1) {
      product.isFavorite = true;
      wishlistProducts.add(product);
      _showSnack("${product.name} added ❤️", Colors.green);
    } else {
      product.isFavorite = false;
      wishlistProducts.removeAt(index);
      _showSnack("Removed from wishlist", Colors.redAccent);
    }
    update(['products', 'wishlist', 'product_grid', 'featured_section', 'popular_section']);
  }

  void _showSnack(String message, Color bgColor) {
    Get.rawSnackbar(
      messageText: Text(message, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      backgroundColor: bgColor.withOpacity(0.9),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(15),
      borderRadius: 10,
      duration: const Duration(seconds: 2),
    );
  }
}