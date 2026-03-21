import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
import 'controller/idedntity_approval_controller.dart';
import 'widget/identity_approval_card.dart';

class IdentityApprovalsScreen extends StatelessWidget {
  const IdentityApprovalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller initialize
    final controller = Get.put(IdentityApprovalController());
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AppText("identity.title".tr, fontSize: 20, fontWeight: AppFonts.bold),
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios, size: 20), onPressed: () => Get.back()),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800), // Laptop fix
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Obx(() => Row(
                  children: [
                    AppText("identity.pendingRequests".tr, fontSize: 18, fontWeight: AppFonts.bold),
                    AppText(" (${controller.pendingRequests.length})",
                        fontSize: 18, fontWeight: AppFonts.bold, color: Colors.orange),
                  ],
                )),
              ),
              Expanded(
                child: Obx(() {
                  if (controller.pendingRequests.isEmpty) {
                    return Center(child: AppText("identity.noRequests".tr));
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: controller.pendingRequests.length,
                    itemBuilder: (context, index) {
                      return IdentityApprovalCard(
                        request: controller.pendingRequests[index],
                        onApprove: () => controller.approveRequest(index),
                        onReject: () => controller.rejectRequest(index),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
