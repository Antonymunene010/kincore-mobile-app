import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/app_text.dart';
import 'widget/migration_history_card.dart';
import 'widget/migration_history_timeline_line.dart';

class MigrationHistoryScreen extends StatefulWidget {
  const MigrationHistoryScreen({super.key});

  @override
  State<MigrationHistoryScreen> createState() => _MigrationHistoryScreenState();
}

class _MigrationHistoryScreenState extends State<MigrationHistoryScreen> {
  double _currentYear = 2021;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        title: AppText("migration.historyTitle".tr, fontWeight: AppFonts.bold, fontSize: 20),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Get.back(),
        ),
        backgroundColor: colors.surface,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "migration.findMember".tr,
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: colors.surfaceVariant.withOpacity(0.3),
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 15),

            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network("https://i.stack.imgur.com/HIL43.png", height: 200, width: double.infinity, fit: BoxFit.cover),
            ),

            Column(
              children: [
                const SizedBox(height: 10),
                AppText("${_currentYear.toInt()}", fontSize: 24, fontWeight: AppFonts.bold),
                Slider(
                  value: _currentYear,
                  min: 2004,
                  max: 2026,
                  activeColor: AppColors.orangeColor,
                  inactiveColor: Colors.grey.withOpacity(0.2),
                  onChanged: (value) => setState(() => _currentYear = value),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [AppText("2004"), AppText("2015"), AppText("2023"), AppText("2026")],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) {
                return IntrinsicHeight(
                  child: Row(
                    children: [
                      HistoryTimelineLine(
                        imageUrl: "https://i.pravatar.cc/150?u=$index",
                        isLast: index == 1,
                      ),
                      Expanded(
                        child: MigrationHistoryCard(
                          from: "Hamburg, India",
                          to: "New york, USA",
                          date: "11/02/2025 : 20:30 PM",
                          isCurrent: index == 1,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
