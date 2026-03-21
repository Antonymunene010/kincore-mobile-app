import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import 'package:kincore_app/features/screens/migration_map_screen/migration_history_screen.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_button.dart';
import '../find_family_member/controller/search_family_member_controller.dart';
import 'controller/migration_controller.dart';
import 'widget/migration_member_tile.dart';

class MigrationMapScreen extends StatelessWidget {
  const MigrationMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MigrationController());
    final controller2 = Get.put(FamilySearchController());
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        title: AppText("migration.mapTitle".tr, fontWeight: AppFonts.bold, fontSize: 20),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Get.back(),
        ),
        centerTitle: false,
        backgroundColor: colors.surface,
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator(color: Colors.orange));
        }

        final data = controller.migrationData.value;
        if (data == null) return Center(child: AppText("generation.noData".tr));

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              TextField(
                onChanged: (v) => controller2.filterMembers(v),
                decoration: InputDecoration(
                  hintText: "migration.findMember".tr,
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: colors.surfaceVariant.withOpacity(0.3),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 15),

              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  // Yahan naya dummy map link daal diya hai
                  "https://images.unsplash.com/photo-1524661135-423995f22d0b?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80",
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  // Agar internet slow ho toh loading aur error handle karne ke liye:
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const SizedBox(
                      height: 250,
                      child: Center(child: CircularProgressIndicator(color: Colors.orange)),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 250,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.map, size: 50, color: Colors.grey),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.orangeColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: AppText("migration.arrivalYear".trParams({'year': data.arrivalYear}), color: AppColors.orangeColor, fontSize: 12, fontWeight: AppFonts.bold),
              ),

              const SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppColors.orangeColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.orangeColor.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                      child: const Icon(Icons.home_outlined, color: Colors.orange),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText("migration.reason".tr, fontWeight: AppFonts.bold, fontSize: 16),
                          AppText(data.reason, fontSize: 13, color: Colors.black54),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),
              AppText("migration.familyMemberCount".trParams({'count': data.members.length.toString()}), fontWeight: AppFonts.bold, fontSize: 18),
              const SizedBox(height: 15),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.members.length,
                itemBuilder: (context, index) => MigrationMemberTile(member: data.members[index]),
              ),

              const SizedBox(height: 20),

              CustomButton(
                text: "migration.viewHistory".tr,
                onPressed: () => Get.to(()=> const MigrationHistoryScreen()),
              ),
              const SizedBox(height: 40),
            ],
          ),
        );
      }),
    );
  }
}
