class SpaceModel {
  final String id;
  final String name;
  final String members;
  final String image;
  final bool isOnline;

  SpaceModel({
    required this.id,
    required this.name,
    required this.members,
    required this.image,
    this.isOnline = false,
  });

  // Jab API se data aayega, tab ye kaam aayega
  factory SpaceModel.fromJson(Map<String, dynamic> json) {
    return SpaceModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      members: json['members'] ?? '0',
      image: json['image'] ?? '',
      isOnline: json['is_online'] ?? false,
    );
  }
}