import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import 'controller/request_history_controller.dart';
import 'widget/request_expantable_card.dart';
import 'widget/status_filter_tabs.dart';

class RequestHistoryScreen extends StatelessWidget {
  const RequestHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RequestHistoryController());
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        title: AppText('requestHistory.title'.tr, fontSize: 18, fontWeight: AppFonts.semiBold),
        centerTitle: true,
        backgroundColor: colors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, size: 20, color: colors.onSurface),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'addMember.findFamilyMember'.tr,
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: colors.surface,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: colors.outlineVariant),
                ),
              ),
            ),
          ),

          // 2. Filter Tabs
          const StatusFilterTabs(),

           Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: AppText('requestHistory.thisMonth'.tr, fontSize: 16, fontWeight: AppFonts.bold),
          ),

          // 3. Expandable List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: 3,
              itemBuilder: (context, index) {
                return RequestExpandableCard(index: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}