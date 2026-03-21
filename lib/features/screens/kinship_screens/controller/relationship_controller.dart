import 'package:get/get.dart';

class RelationshipController extends GetxController {
  // Top horizontal path list
  var selectedPath = <String>["Me", "Mother", "Mother"].obs;

  // Grid counters (Initial 0)
  var counts = {
    "Father": 0,
    "Mother": 2,
    "Brother": 0,
    "Sister": 0,
    "Spouse": 0,
    "Child": 0,
  }.obs;

  void increment(String relation) {
    counts[relation] = counts[relation]! + 1;
  }

  void decrement(String relation) {
    if (counts[relation]! > 0) {
      counts[relation] = counts[relation]! - 1;
    }
  }

  void calculate() {
    print("Calculating for path: $selectedPath");
    Get.back();
  }
}