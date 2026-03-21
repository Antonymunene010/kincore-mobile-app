// import 'package:get/get.dart';
//
// class SwitchSpaceController extends GetxController {
//   // Isme hum us Space ki ID rakhenge jo abhi select hui hai
//   // Maan lo by default pehla wala selected hai
//   var selectedSpaceId = "".obs;
//
//   void selectSpace(String id) {
//     selectedSpaceId.value = id;
//   }
// }

import 'package:get/get.dart';

class SwitchSpaceController extends GetxController {
  // Dummy spaces ko observable list me convert kar diya
  var spaces = <Map<String, dynamic>>[
    {"name": "The Anderson Family", "members": "12", "online": true, "image": "assets/images/Ellipse.png"},
    {"name": "The Niva Family", "members": "10", "online": false, "image": "https://images.unsplash.com/photo-1511895426328-dc8714191300"},
    {"name": "The Saddon Family", "members": "8", "online": true, "image": "https://images.unsplash.com/photo-1544005313-94ddf0286df2"},
    {"name": "The Mahajan Family", "members": "6", "online": false, "image": "https://images.unsplash.com/photo-1529333166437-7750a6dd5a70"},
  ].obs;

  var selectedIndex = 0.obs;

  void selectSpace(int index) {
    selectedIndex.value = index;
  }

  // Naya family space add karne ka function
  void addNewSpace({required String name, String? imagePath}) {
    // List ke sabse upar (top pe) naya space add karega
    spaces.insert(0, {
      "name": name,
      "members": "1", // Naya create hua hai to pehla member aap hi hoge
      "online": true,
      "image": imagePath ?? "https://images.unsplash.com/photo-1511895426328-dc8714191300" // Default placeholder
    });

    // Naye wale ko by default select kar lega
    selectedIndex.value = 0;
  }
}