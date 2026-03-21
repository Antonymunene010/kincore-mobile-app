// import 'package:get/get.dart';
//
// class SecurityController extends GetxController {
//   var isLoading = true.obs;
//   var profileImage = "".obs;
//
//   var isProfileLocked = true.obs;
//   var hideEmail = true.obs;
//   var hidePhoneNumber = true.obs;
//
//   var searchVisibility = "Everyone".obs;
//
//   @override
//   void onInit() {
//     fetchSecurityData();
//     super.onInit();
//   }
//
//   void fetchSecurityData() async {
//     try {
//       isLoading(true);
//       await Future.delayed(const Duration(seconds: 1));
//
//       profileImage.value = "https://i.pravatar.cc/150?u=alex";
//       isProfileLocked.value = true;
//       hideEmail.value = true;
//       hidePhoneNumber.value = true;
//       searchVisibility.value = "Everyone";
//     } finally {
//       isLoading(false);
//     }
//   }
// }

import 'package:get/get.dart';

class SecurityController extends GetxController {
  var isLoading = true.obs;
  var profileImage = "".obs;

  // Radio selection state
  var searchVisibility = "Everyone".obs;

  // Switch states
  var isProfileLocked = true.obs;
  var hideEmail = true.obs;
  var hidePhoneNumber = true.obs;

  @override
  void onInit() {
    fetchSecurityData();
    super.onInit();
  }

  void fetchSecurityData() async {
    try {
      isLoading(true);
      await Future.delayed(const Duration(seconds: 1)); // API call simulation
      profileImage.value = "https://i.pravatar.cc/150?u=vishal"; // API se aayegi photo
    } finally {
      isLoading(false);
    }
  }
}