import 'package:get/get.dart';
import '../model/migration_model.dart';

class MigrationController extends GetxController {
  var isLoading = true.obs;
  var migrationData = Rxn<MigrationModel>();

  @override
  void onInit() {
    fetchMigrationData();
    super.onInit();
  }

  void fetchMigrationData() async {
    try {
      isLoading(true);
      await Future.delayed(const Duration(seconds: 1)); // Simulation

      var response = {
        "arrival_year": "1947",
        "reason": "Partition / Resettlement Following Independence",
        "members": [
          {"name": "Arthur Harrison", "relation": "Existing Family Member", "image": "https://i.pravatar.cc/150?u=m1"},
          {"name": "Arthur Harrison", "relation": "Existing Family Member", "image": "https://i.pravatar.cc/150?u=m2"},
          {"name": "Arthur Harrison", "relation": "Existing Family Member", "image": "https://i.pravatar.cc/150?u=m3"},
        ]
      };
      migrationData.value = MigrationModel.fromJson(response);
    } finally {
      isLoading(false);
    }
  }
}