// import 'package:get/get.dart';
// import '../../../../core/models/event_model.dart';
//
// class EventController extends GetxController {
//   var allEvents = <EventModel>[].obs;
//   var filteredEvents = <EventModel>[].obs;
//   var isLoading = true.obs;
//
//   // event_controller.dart ke andar
//   var selectedTab = 0.obs; // 0 for UpComing, 1 for Past
//
//   @override
//   void onInit() {
//     fetchEvents();
//     super.onInit();
//   }
//
//   void fetchEvents() async {
//     try {
//       isLoading(true);
//       // Real feel ke liye thoda delay
//       await Future.delayed(const Duration(milliseconds: 500));
//
//       var dummyData = [
//         EventModel(
//           title: "Grandma's 80th Birthday",
//           date: "29 July 2025 / 12:30 PM",
//           location: "Central Park",
//           status: 'event.status.joinnow'.tr,
//           imageUrl: "https://picsum.photos/800/400?random=1",
//           members: [
//             "https://i.pravatar.cc/150?u=1",
//             "https://i.pravatar.cc/150?u=2",
//           ],
//         ),
//         EventModel(
//           title: "Family Picnic 2026",
//           date: "15 Jan 2026 / 10:00 AM",
//           location: "Riverfront Park",
//           status:'event.status.notAttended'.tr,
//           imageUrl: "https://picsum.photos/800/400?random=2",
//           members: ["https://i.pravatar.cc/150?u=4"],
//         ),
//         EventModel(
//           title: "Diwali Celebration Night",
//           date: "12 Nov 2025 / 07:00 PM",
//           location: "Vadecha Mansion",
//           status: 'event.status.joinnow'.tr,
//           imageUrl: "https://picsum.photos/800/400?random=3",
//           members: ["https://i.pravatar.cc/150?u=5"],
//         ),
//         EventModel(
//           title: "Aryan's Graduation Ceremony",
//           date: "20 May 2025 / 11:30 AM",
//           location: "University Hall",
//           status: 'event.status.attended'.tr,
//           imageUrl: "https://picsum.photos/800/400?random=4",
//           members: ["https://i.pravatar.cc/150?u=8"],
//         ),
//         EventModel(
//           title: "Summer Beach Trip",
//           date: "05 June 2025 / 09:00 AM",
//           location: "Goa Beach Resort",
//           status: 'event.status.notAttended'.tr,
//           imageUrl: "https://picsum.photos/800/400?random=5",
//           members: ["https://i.pravatar.cc/150?u=10"],
//         ),
//         EventModel(
//           title: "Parents 25th Anniversary",
//           date: "18 Aug 2025 / 08:00 PM",
//           location: "The Grand Palace",
//           status: 'event.status.joinnow'.tr,
//           imageUrl: "https://picsum.photos/800/400?random=6",
//           members: ["https://i.pravatar.cc/150?u=12"],
//         ),
//         EventModel(
//           title: "Sunday Brunch",
//           date: "10 Feb 2026 / 11:00 AM",
//           location: "Cafe Blue Sky",
//           status: 'event.status.attended'.tr,
//           imageUrl: "https://picsum.photos/800/400?random=7",
//           members: ["https://i.pravatar.cc/150?u=15"],
//         ),
//         EventModel(
//           title: "Christmas Dinner",
//           date: "25 Dec 2025 / 08:30 PM",
//           location: "Home Sweet Home",
//           status: 'event.status.joinnow'.tr,
//           imageUrl: "https://picsum.photos/800/400?random=8",
//           members: ["https://i.pravatar.cc/150?u=16"],
//         ),
//         EventModel(
//           title: "Kite Flying Festival",
//           date: "14 Jan 2026 / 08:00 AM",
//           location: "Terrace Garden",
//           status:'event.status.notAttended'.tr,
//           imageUrl: "https://picsum.photos/800/400?random=9",
//           members: ["https://i.pravatar.cc/150?u=18"],
//         ),
//         EventModel(
//           title: "Niece's First Steps Party",
//           date: "02 April 2025 / 05:00 PM",
//           location: "Royal Garden Hall",
//           status: 'event.status.attended'.tr,
//           imageUrl: "https://picsum.photos/800/400?random=10",
//           members: ["https://i.pravatar.cc/150?u=20"],
//         ),
//       ];
//
//       allEvents.assignAll(dummyData);
//       filteredEvents.assignAll(dummyData);
//     } finally {
//       isLoading(false);
//     }
//   }
//
//   void filterEvents(String query) {
//     if (query.isEmpty) {
//       filteredEvents.assignAll(allEvents);
//     } else {
//       filteredEvents.assignAll(
//         allEvents
//             .where((e) => e.title.toLowerCase().contains(query.toLowerCase()))
//             .toList(),
//       );
//     }
//   }
// }

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../core/models/event_model.dart';

class EventController extends GetxController {
  var allEvents = <EventModel>[].obs;
  var filteredEvents = <EventModel>[].obs; // Jo UI pe dikhega
  var isLoading = true.obs;

  // 0 = Upcoming, 1 = Past
  var selectedTab = 0.obs;

  // Search query
  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchEvents();

    // Listeners: Tab ya Search change hone par list update karo
    ever(selectedTab, (_) => updateFilteredList());
    ever(searchQuery, (_) => updateFilteredList());
  }

  void fetchEvents() async {
    try {
      isLoading(true);
      await Future.delayed(const Duration(milliseconds: 500));

      // Dummy Data with Logic:
      // Upcoming events ke liye status: 'RSVP' (default) ya 'Going'
      // Past events ke liye status: 'Attended' ya 'Not Attended'
      var dummyData = [
        // --- UPCOMING EVENTS (Future Dates) ---
        EventModel(
          title: "Grandma's 80th Birthday",
          date: "29 July 2025 / 12:30 PM",
          location: "Central Park",
          status: 'RSVP', // User ne abhi respond nahi kiya
          imageUrl: "https://picsum.photos/800/400?random=1",
          members: ["https://i.pravatar.cc/150?u=1", "https://i.pravatar.cc/150?u=2"],
        ),
        EventModel(
          title: "Diwali Celebration Night",
          date: "12 Nov 2025 / 07:00 PM",
          location: "Vadecha Mansion",
          status: 'Going', // User ja raha hai
          imageUrl: "https://picsum.photos/800/400?random=3",
          members: ["https://i.pravatar.cc/150?u=5"],
        ),
        EventModel(
          title: "Family Picnic 2026",
          date: "15 Jan 2026 / 10:00 AM",
          location: "Riverfront Park",
          status: 'RSVP',
          imageUrl: "https://picsum.photos/800/400?random=2",
          members: ["https://i.pravatar.cc/150?u=4"],
        ),

        // --- PAST EVENTS (Old Dates) ---
        EventModel(
          title: "Aryan's Graduation Ceremony",
          date: "20 May 2020 / 11:30 AM",
          location: "University Hall",
          status: 'Attended', // Past event status
          imageUrl: "https://picsum.photos/800/400?random=4",
          members: ["https://i.pravatar.cc/150?u=8"],
        ),
        EventModel(
          title: "Summer Beach Trip",
          date: "05 June 2022 / 09:00 AM",
          location: "Goa Beach Resort",
          status: 'Not Attended', // Past event status
          imageUrl: "https://picsum.photos/800/400?random=5",
          members: ["https://i.pravatar.cc/150?u=10"],
        ),
      ];

      allEvents.assignAll(dummyData);
      updateFilteredList(); // Initial filter run karo

    } finally {
      isLoading(false);
    }
  }

  void updateFilteredList() {
    List<EventModel> tempEvents = List.from(allEvents);
    DateTime now = DateTime.now();
    DateFormat format = DateFormat("dd MMMM yyyy / hh:mm a");

    // 1. FILTER BY TAB (Upcoming vs Past)
    if (selectedTab.value == 0) {
      // UPCOMING: Future dates only
      tempEvents = tempEvents.where((e) {
        try {
          DateTime eventDate = format.parse(e.date);
          return eventDate.isAfter(now);
        } catch (e) {
          return true; // Parse fail ho to dikha do
        }
      }).toList();
    } else {
      // PAST: Old dates only
      tempEvents = tempEvents.where((e) {
        try {
          DateTime eventDate = format.parse(e.date);
          return eventDate.isBefore(now);
        } catch (e) {
          return false;
        }
      }).toList();
    }

    // 2. FILTER BY SEARCH
    if (searchQuery.value.isNotEmpty) {
      tempEvents = tempEvents.where((e) =>
          e.title.toLowerCase().contains(searchQuery.value.toLowerCase())
      ).toList();
    }

    filteredEvents.assignAll(tempEvents);
  }

  // UI se search text aayega
  void onSearchChanged(String query) {
    searchQuery.value = query;
  }
}