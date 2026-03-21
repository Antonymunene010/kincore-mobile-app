enum NotificationType { identity, relationship, admin, gift, event, security }

class NotificationModel {
  final int id;
  final String title;
  final String body;
  final String time;
  final NotificationType type;
  bool isRead;
  final dynamic payload; // Extra data for navigation (e.g., eventId)

  NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.time,
    required this.type,
    this.isRead = false,
    this.payload,
  });
}