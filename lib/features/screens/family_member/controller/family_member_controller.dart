import 'package:get/get.dart';

class FamilyMember {
  final String name;
  final String relation;
  final String image;
  final String years;

  FamilyMember({
    required this.name,
    required this.relation,
    required this.image,
    required this.years,
  });
}

class FamilyController extends GetxController {
  // --- NEW: Tab State ---
  var selectedTab = "Families".obs;
  var isLoading = false.obs;

  // --- NEW: Alag-alag Lists API data ke liye ---
  var familyMembers = <FamilyMember>[].obs; // Families tab ka data
  var peopleMembers = <FamilyMember>[].obs; // People tab ka data

  @override
  void onInit() {
    super.onInit();
    fetchAllData();
  }

  // --- NEW: Tab Badalane ka Function ---
  void changeTab(String tab) {
    selectedTab.value = tab;
    // Agar tab change hone par naya data fetch karna ho toh yahan call kar sakte hain
  }

  void fetchAllData() {
    isLoading.value = true;

    // 1. Simulation for Families Tab
    var familyData = [
      FamilyMember(name: "Arthur Harrison", relation: "Father", image: "https://i.pravatar.cc/150?u=1", years: "1995 - Present"),
      FamilyMember(name: "Arthur Harrison", relation: "Brother", image: "https://i.pravatar.cc/150?u=2", years: "1995 - Present"),
      FamilyMember(name: "Arthur Harrison", relation: "Son", image: "https://i.pravatar.cc/150?u=3", years: "1995 - Present"),
      FamilyMember(name: "Arthur Harrison", relation: "Daughter", image: "https://i.pravatar.cc/150?u=4", years: "1995 - Present"),
      FamilyMember(name: "Arthur Harrison", relation: "Mother", image: "https://i.pravatar.cc/150?u=5", years: "1995 - Present"),
    ];

    // 2. Simulation for People Tab (Alg data)
    var peopleData = [
      FamilyMember(name: "Mary Rigby", relation: "Friend", image: "https://i.pravatar.cc/150?u=10", years: "1990 - Present"),
      FamilyMember(name: "John Rigby", relation: "Neighbor", image: "https://i.pravatar.cc/150?u=11", years: "1985 - Present"),
      FamilyMember(name: "Emily", relation: "Colleague", image: "https://i.pravatar.cc/150?u=12", years: "1998 - Present"),
      FamilyMember(name: "Paul", relation: "Classmate", image: "https://i.pravatar.cc/150?u=13", years: "1995 - Present"),
    ];

    familyMembers.assignAll(familyData);
    peopleMembers.assignAll(peopleData);

    isLoading.value = false;
  }
}