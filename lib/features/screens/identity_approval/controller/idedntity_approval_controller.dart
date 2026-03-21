import 'package:get/get.dart';
import '../../../../core/models/approval_request_model.dart';

class IdentityApprovalController extends GetxController {
  var pendingRequests = <ApprovalRequest>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadRequests();
  }

  void loadRequests() {
    // Online dummy data for testing
    pendingRequests.assignAll([
      ApprovalRequest(
        userName: "Arthur Harrison",
        userImage: "https://i.pravatar.cc/150?u=1",
        requestTime: "2h Ago",
        claimingName: "Grandma Miller",
        claimingDetails: "1940-2020. ID#8492",
      ),
      ApprovalRequest(
        userName: "Arthur Harrison",
        userImage: "https://i.pravatar.cc/150?u=2",
        requestTime: "2h Ago",
        claimingName: "Grandma Miller",
        claimingDetails: "1940-2020. ID#8492",
      ),
    ]);
  }

  void approveRequest(int index) => pendingRequests.removeAt(index);
  void rejectRequest(int index) => pendingRequests.removeAt(index);
}