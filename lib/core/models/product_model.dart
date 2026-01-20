class ProductModel {
  final String id;
  final String name;
  final String price;
  final String image;
  bool isFavorite;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    this.isFavorite = false,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      price: json['price'] ?? "0",
      image: json['img'] ?? "",
    );
  }
}

class PosterModel {
  final String id;
  final String imageUrl;
  final String title;
  final String discount;

  PosterModel({required this.id, required this.imageUrl, required this.title, required this.discount});
}