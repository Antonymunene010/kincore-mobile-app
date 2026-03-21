import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import 'controller/search_family_member_controller.dart';
// Apne folder structure ke hisab se import karein
import 'widget/family_member_tile.dart';

class FindMemberScreen extends StatelessWidget {
  const FindMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FamilySearchController());
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        backgroundColor: colors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: colors.onSurface, size: 20),
          onPressed: () => Get.back(),
        ),
        title: AppText('findMember.title'.tr, fontSize: 20, fontWeight: AppFonts.bold),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            /// --- SEARCH FIELD ---
            TextField(
              onChanged: (v) => controller.filterMembers(v),
              decoration: InputDecoration(
                hintText:'findMember.searchHint'.tr,
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

            const SizedBox(height: 25),

            /// --- BEST MATCHES HEADER ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText('findYourself.bestMatches'.tr, fontSize: 16, color: colors.onSurface.withOpacity(0.6)),
                Obx(() => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: AppText('findYourself.foundCount'.trParams({'count': controller.foundMembers.length.toString()}), fontSize: 12, color: Colors.red),
                )),
              ],
            ),

            /// --- SEARCH RESULTS ---
            Expanded(
              child: Obx(() => ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(height: 15),

                  // Using the new separate class
                  ...controller.foundMembers.map((member) => FamilyMemberTile(
                    member: member,
                    onTap: () {
                      // Detail page pe jane ka logic yahan likhein
                    },
                  )),

                  const Divider(height: 40),

                  /// --- LAST VIEWED ---
                  AppText('findMember.lastViewed'.tr, fontSize: 16, color: colors.onSurface.withOpacity(0.6)),
                  const SizedBox(height: 15),

                  ...controller.lastViewed.map((member) => FamilyMemberTile(
                    member: member,
                    onTap: () {},
                  )),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}