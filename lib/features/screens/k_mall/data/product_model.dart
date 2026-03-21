class ProductModel {
  final String id;
  final String name;
  final String price;
  final String image;
  final String category;
  final String description;
  final List<String> sizes; // Humne iska naam 'sizes' rakha hai
  final double rating;
  final int reviews;
  bool isFavorite;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.category,
    this.description = "",
    this.sizes = const ["S", "M", "L", "XL"], // Default sizes
    this.rating = 0.0,
    this.reviews = 0,
    this.isFavorite = false,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      price: json['price'] ?? "0",
      image: json['img'] ?? "",
      category: json['category'] ?? "All",
      description: json['description'] ?? "No description available.",
      sizes: json['sizes'] != null ? List<String>.from(json['sizes']) : ["S", "M", "L", "XL"],
      rating: (json['rating'] ?? 0.0).toDouble(),
      reviews: json['reviews'] ?? 0,
      isFavorite: json['isFavorite'] ?? false,
    );
  }
}