import 'package:get/get.dart';
import '../../../../core/models/product_model.dart';

class KMallController extends GetxController {
  var posters = <PosterModel>[].obs;
  var featuredProducts = <ProductModel>[].obs;
  var popularProducts = <ProductModel>[].obs;
  var isLoading = true.obs;
  var currentBannerIndex = 0.obs;

  @override
  void onInit() {
    fetchKmallData();
    super.onInit();
  }

  void fetchKmallData() async {
    try {
      isLoading(true);

      // 1. Posters Data (Banners)
      posters.assignAll([
        PosterModel(id: "1", title: "Get Winter Discount", discount: "20% Off", imageUrl: "https://images.unsplash.com/photo-1483985988355-763728e1935b"),
        PosterModel(id: "2", title: "New Year Sale", discount: "50% Off", imageUrl: "https://images.unsplash.com/photo-1544441893-675973e31985"),
      ]);

      // 2. Featured Products (Electronics/Gadgets) - Unique Data
      var featuredData = [
        {"id": "f1", "name": "Apple Watch S9", "price": "399", "img": "https://images.unsplash.com/photo-1523275335684-37898b6baf30"},
        {"id": "f2", "name": "Sony Headphones", "price": "299", "img": "https://images.unsplash.com/photo-1505740420928-5e560c06d30e"},
        {"id": "f3", "name": "Alexa Echo Dot", "price": "49", "img": "https://images.unsplash.com/photo-1589003077984-894e133dabab"},
      ];

      // 3. Most Popular Products (Shoes & Clothing) - Different IDs and Names
      var popularData = [
        {"id": "p1", "name": "Nike Air Max", "price": "120", "img": "https://images.unsplash.com/photo-1542291026-7eec264c27ff"},
        {"id": "p2", "name": "Denim Jacket", "price": "85", "img": "https://images.unsplash.com/photo-1551028719-00167b16eac5"},
        {"id": "p3", "name": "Grey Hoodie", "price": "45", "img": "https://images.unsplash.com/photo-1556821840-3a63f95609a7"},
        {"id": "p4", "name": "Casual Sneakers", "price": "60", "img": "https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77"},
      ];

      featuredProducts.assignAll(featuredData.map((e) => ProductModel.fromJson(e)).toList());
      popularProducts.assignAll(popularData.map((e) => ProductModel.fromJson(e)).toList());

    } finally {
      isLoading(false);
    }
  }

  void toggleFavorite(ProductModel product) {
    product.isFavorite = !product.isFavorite;
    featuredProducts.refresh();
    popularProducts.refresh();
  }
}