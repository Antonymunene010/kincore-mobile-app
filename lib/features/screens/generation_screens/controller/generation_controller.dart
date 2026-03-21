import 'package:get/get.dart';
import '../model/generation_model.dart';

class GenerationController extends GetxController {
  var isLoading = true.obs;
  var generationData = Rxn<GenerationModel>();

  @override
  void onInit() {
    fetchGenerationData();
    super.onInit();
  }

  void fetchGenerationData() async {
    try {
      isLoading(true);
      await Future.delayed(const Duration(seconds: 1)); // API simulation

      var response = {
        "id": "1",
        "name": "Arthur Pendragon",
        "life_span": "1920-1995",
        "role": "Root Ancestor",
        "image": "https://i.pravatar.cc/150?u=root",
        "members": [
          {"name": "Arthur Harrison", "relation": "Existing Family Member", "image": "https://i.pravatar.cc/150?u=a1", "gen_level": 1},
          {"name": "Arthur Harrison", "relation": "Existing Family Member", "image": "https://i.pravatar.cc/150?u=a2", "gen_level": 1},
          {"name": "Arthur Harrison", "relation": "Existing Family Member", "image": "https://i.pravatar.cc/150?u=a3", "gen_level": 2},
          {"name": "Arthur Harrison", "relation": "Existing Family Member", "image": "https://i.pravatar.cc/150?u=a4", "gen_level": 2},
        ]
      };

      generationData.value = GenerationModel.fromJson(response);
    } finally {
      isLoading(false);
    }
  }
}