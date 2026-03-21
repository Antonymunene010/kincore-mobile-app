import 'package:get/get.dart';

class IdentityStatusController extends GetxController {
  // 0: Submitted, 1: In Progress, 2: Final Decision
  var currentStep = 1.obs;
}