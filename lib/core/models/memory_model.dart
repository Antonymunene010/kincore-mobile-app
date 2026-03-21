enum MemoryType { photo, video }

class MemoryModel {
  final String id;
  final String url;
  final MemoryType type;
  final String? thumbnail;

  MemoryModel({
    required this.id,
    required this.url,
    required this.type,
    this.thumbnail,
  });
}