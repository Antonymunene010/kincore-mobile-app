class EventModel {
  final String title;
  final String date;
  final String location;
  final String status;
  final String imageUrl;
  final List<String> members;

  EventModel({
    required this.title,
    required this.date,
    required this.location,
    required this.status,
    required this.imageUrl,
    required this.members,
  });

  // Jab API se JSON aayega tab ye kaam aayega
  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      title: json['title'] ?? '',
      date: json['date'] ?? '',
      location: json['location'] ?? '',
      status: json['status'] ?? 'Join Now',
      imageUrl: json['image_url'] ?? '',
      members: List<String>.from(json['members'] ?? []),
    );
  }
}