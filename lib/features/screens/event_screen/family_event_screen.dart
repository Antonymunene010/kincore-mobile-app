import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/features/screens/event_screen/create_event_screen.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_text.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../../../core/widgets/custom_input_field.dart';
import 'controller/event_controller.dart';
import 'event_detail_screen.dart';
import 'widget/event_card.dart';

class FamilyEventScreen extends StatelessWidget {
  const FamilyEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EventController());
    final double screenW = Get.width;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.to(() => CreateEventScreen()),
        backgroundColor: AppColors.orangeColor,
        elevation: 4,
        icon: const Icon(Icons.add, color: AppColors.whiteColor, size: 28),
        label: AppText("Create Event", color: AppColors.whiteColor, fontWeight: AppFonts.medium),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      body: SafeArea(
        child: Column(
          children: [
            // --- FIXED HEADER ---
            Container(
              padding: EdgeInsets.fromLTRB(screenW * 0.05, 10, screenW * 0.05, 15),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                // Isse scroll ke waqt header alag dikhega
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText("Family Events", fontSize: 20, fontWeight: AppFonts.semiBold),
                      CustomIconButton(iconName: 'bell.svg', onTap: () {}),
                    ],
                  ),
                  const SizedBox(height: 15),
                  CustomInputField(
                    hint: "Find Event",
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    label: '',
                    onChanged: (val) => controller.filterEvents(val),
                  ),
                ],
              ),
            ),

            // --- SMOOTH SCROLLABLE LIST ---
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ListView.builder(
                  // --- PERFORMANCE OPTIMIZATIONS ---
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  cacheExtent: 1500, // Pre-renders cards for smooth experience
                  addAutomaticKeepAlives: true,
                  addRepaintBoundaries: true,
                  // ----------------------------------
                  padding: EdgeInsets.fromLTRB(screenW * 0.05, 0, screenW * 0.05, 100),
                  itemCount: controller.filteredEvents.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: AppText("All Events", fontSize: 16, color: Colors.grey.shade600, fontWeight: AppFonts.medium),
                      );
                    }

                    final event = controller.filteredEvents[index - 1];
                    return EventCard(
                      key: ValueKey(index),
                      title: event.title,
                      imageUrl: event.imageUrl,
                      date: event.date,
                      location: event.location,
                      status: event.status,
                      memberAvatars: event.members,
                      onTap: () => Get.to(() => const EventDetailScreen(), arguments: event),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}