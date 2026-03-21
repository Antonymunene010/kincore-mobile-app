import 'package:get/get.dart';

import '../relationship_path_screen.dart';

class KinshipResultController extends GetxController {
  // Path list data (Dummy data for UI)
  final List<Map<String, dynamic>> kinshipPath = [
    {"title": "Me", "isImage": true, "icon": "https://i.pravatar.cc/150?u=me"},
    {"title": "Mother", "isImage": false, "icon": null},
    {"title": "Mother", "isImage": true, "icon": "https://i.pravatar.cc/150?u=mom"},
    {"title": "Maternal Grandmother", "isImage": false, "icon": null},
  ];

  void newCalculation() {
    Get.to(RelationshipPathScreen());
  }

  void editPath() {
    Get.to(RelationshipPathScreen());
  }
}