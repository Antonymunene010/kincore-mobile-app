import 'package:get/get.dart';
import 'package:kincore_app/features/screens/gift_and_draw_screens/gift_swap_screen.dart';
import 'package:kincore_app/features/screens/profle_security_locking/profile_security_screen.dart';

import '../model/notification_model.dart';

class NotificationController extends GetxController {
  var allNotifications = <NotificationModel>[].obs;
  var filteredNotifications = <NotificationModel>[].obs;
  var selectedFilter = "All".obs;
  var searchQuery = "".obs;

  @override
  void onInit() {
    super.onInit();
    loadNotifications();
  }

  void loadNotifications() {
    // Dummy Data based on client requirements
    var data = [
      NotificationModel(
        id: 1,
        title: "Identity Verified",
        body: "Your claim for 'Arthur Harrison' has been approved.",
        time: "2m ago",
        type: NotificationType.identity,
        isRead: false,
      ),
      NotificationModel(
        id: 2,
        title: "New Event Invite",
        body: "Grandma's 80th Birthday: You are invited!",
        time: "1h ago",
        type: NotificationType.event,
        isRead: false,
      ),
      NotificationModel(
        id: 3,
        title: "Security Alert",
        body: "New login detected from Mumbai, India.",
        time: "3h ago",
        type: NotificationType.security,
        isRead: true,
      ),
      NotificationModel(
        id: 4,
        title: "Gift Exchange",
        body: "Draw deadline is approaching for Diwali Gift Swap.",
        time: "5h ago",
        type: NotificationType.gift,
        isRead: false,
      ),
      NotificationModel(
        id: 5,
        title: "Relationship Update",
        body: "Sarah Smith added you as 'Cousin'. Confirm now.",
        time: "1d ago",
        type: NotificationType.relationship,
        isRead: true,
      ),
      NotificationModel(
        id: 6,
        title: "Admin Message",
        body: "System maintenance scheduled for tonight at 2 AM.",
        time: "2d ago",
        type: NotificationType.admin,
        isRead: true,
      ),
    ];
    allNotifications.assignAll(data);
    applyFilter();
  }

  // --- FILTER LOGIC ---
  void changeFilter(String filter) {
    selectedFilter.value = filter;
    applyFilter();
  }

  // --- SEARCH LOGIC ---
  void search(String query) {
    searchQuery.value = query;
    applyFilter();
  }

  void applyFilter() {
    var temp = allNotifications.toList();

    // 1. Apply Type/Category Filter
    if (selectedFilter.value == "Unread") {
      temp = temp.where((n) => !n.isRead).toList();
    } else if (selectedFilter.value != "All") {
      // Map string to Enum if needed, or simple keyword match
      if (selectedFilter.value == "Events") {
        temp = temp.where((n) => n.type == NotificationType.event).toList();
      } else if (selectedFilter.value == "Security") {
        temp = temp.where((n) => n.type == NotificationType.security).toList();
      } else if (selectedFilter.value == "Gifts") {
        temp = temp.where((n) => n.type == NotificationType.gift).toList();
      }
    }

    // 2. Apply Search
    if (searchQuery.value.isNotEmpty) {
      temp = temp.where((n) =>
      n.title.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
          n.body.toLowerCase().contains(searchQuery.value.toLowerCase())).toList();
    }

    filteredNotifications.assignAll(temp);
  }

  // --- ACTIONS ---
  void markAsRead(int id) {
    var index = allNotifications.indexWhere((n) => n.id == id);
    if (index != -1) {
      allNotifications[index].isRead = true;
      allNotifications.refresh();
      applyFilter(); // Refresh UI
    }
  }

  void markAllRead() {
    for (var n in allNotifications) {
      n.isRead = true;
    }
    allNotifications.refresh();
    applyFilter();
  }

  // --- NAVIGATION LOGIC (Click Action) ---
  void handleNotificationTap(NotificationModel notification) {
    // 1. Mark as read
    if (!notification.isRead) markAsRead(notification.id);

    // 2. Navigate based on Type
    switch (notification.type) {
      case NotificationType.gift:
        Get.to(() => const GiftSwapScreen());
        break;
      case NotificationType.security:
        Get.to(() => const ProfileSecurityScreen()); // Navigation to Security
        break;
      case NotificationType.event:
      // Get.to(() => const EventDetailScreen(), arguments: notification.payload);
      // Example: Navigate to feed or event list
        break;
      case NotificationType.identity:
      // Get.to(() => const IdentityStatusScreen());
        break;
      case NotificationType.relationship:
      // Get.to(() => const RelationshipRequestScreen());
        break;
      default:
      // Just open details or do nothing
        break;
    }
  }
}