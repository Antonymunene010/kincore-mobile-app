import 'package:get/get.dart';
import '../../switch_space/switch_space_screen.dart'; // Apne folder structure ke hisaab se import check kar lena

class ScannerController extends GetxController {

  // Logic: Invite link UI se aayegi
  void joinSpace({required String inviteLink}) {
    if (inviteLink.isEmpty) {
      Get.snackbar("Error", "Please enter or paste an invite link");
      return;
    }
    print("Joining space with link: $inviteLink");
    goToSwitchSpace();
    // Backend API call yahan se hogi
  }

  // --- NAYA METHOD: Switch Screen par jane ke liye ---
  void goToSwitchSpace() {
    Get.to(() => const SwitchSpaceScreen());
  }

  void shareQRCode() {
    print("Sharing QR Code...");
    // Share plugin logic yahan aayega
  }
}