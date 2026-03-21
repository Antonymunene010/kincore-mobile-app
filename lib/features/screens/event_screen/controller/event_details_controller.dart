import 'package:get/get.dart';
import '../../../../core/models/event_model.dart';

class EventDetailController extends GetxController {
  // Reactive variable for selection
  var selectedResponse = "".obs;

  @override
  void onInit() {
    super.onInit();
    _initializeStatus();
  }

  void _initializeStatus() {
    final EventModel? event = Get.arguments;
    if (event != null) {
      // Agar event ka status already valid response hai to usse set karo
      if (['Going', 'Maybe', 'No'].contains(event.status)) {
        selectedResponse.value = event.status;
      } else {
        selectedResponse.value = ""; // Default no selection
      }
    }
  }

  void onResponseSelected(String response) {
    selectedResponse.value = response;

    // API Call simulation or logic here
    Get.snackbar(
        "Response Updated",
        "You selected: $response",
        snackPosition: SnackPosition.BOTTOM
    );
  }
}