import 'package:get/get.dart';
import '../../../../core/models/family_member_model.dart';

class ProfileController extends GetxController {
  // --- Naya Added Data (Header ke liye) ---
  var profileImageUrl = "https://picsum.photos/200/300".obs;
  var userName = "Arthur Pendragon".obs;
  var lifeSpan = "1920-1995".obs;
  var relationBadge = "GREAT AUNT".obs;

  // --- Coin Balance for Wallet ---
  var coinBalance = "1,234".obs; // API se yahan value update hogi

  // --- Aapka Purana Data ---
  var familyMembers = <FamilyMember>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchFamilyMembers();
  }

  void fetchFamilyMembers() {
    var dummyData = [
      FamilyMember(name: "Mary Rigby", relation: "Mother", image: "assets/images/user_avatar.png"),
      FamilyMember(name: "John Doe", relation: "Father", image: "assets/images/user_avatar.png"),
      FamilyMember(name: "Sarah Parker", relation: "Sister", image: "assets/images/user_avatar.png"),
      FamilyMember(name: "Robert Fox", relation: "Brother", image: "assets/images/user_avatar.png"),
      FamilyMember(name: "Emily Blunt", relation: "Cousin", image: "assets/images/user_avatar.png"),
    ];
    familyMembers.assignAll(dummyData);
  }

  void updateProfile(String name, String life) {
    userName.value = name;
    lifeSpan.value = life;
  }
}