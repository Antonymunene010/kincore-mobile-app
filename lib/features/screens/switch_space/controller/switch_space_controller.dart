import 'package:get/get.dart';

class SwitchSpaceController extends GetxController {
  // Isme hum us Space ki ID rakhenge jo abhi select hui hai
  // Maan lo by default pehla wala selected hai
  var selectedSpaceId = "".obs;

  void selectSpace(String id) {
    selectedSpaceId.value = id;
  }
}