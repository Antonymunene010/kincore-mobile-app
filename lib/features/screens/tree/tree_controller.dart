import 'package:get/get.dart';

class TreeController extends GetxController {

  // Default selection ko bhi key se replace kiya
  var selectedCat = 'tree.allView';

  // Hardcoded text ki jagah translation keys laga di
  List<String> treeCategoryList = [
    'tree.allView',
    'tree.directLinage',
    'tree.birthday',
    'tree.anniversary'
  ];

  // Category select karne ka function
  void selectCategory(String category) {
    selectedCat = category;
    update(['sCat']);
  }
}