import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import 'controller/generation_controller.dart';
import 'widget/generation_header_card.dart';
import 'widget/member_list_tile.dart';
import 'widget/time_line_line.dart';

class GenerationScreen extends StatelessWidget {
  const GenerationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GenerationController());
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        title: AppText('generation.title'.tr, fontWeight: AppFonts.semiBold, color: colors.onSurface,fontSize: 20,),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, size: 20, color: colors.onSurface),
          onPressed: () => Get.back(),
        ),
        backgroundColor: colors.surface,
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator(color: colors.primary));
        }

        final data = controller.generationData.value;
        if (data == null) return Center(child: AppText('generation.noData'.tr, color: colors.onSurface));

        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: GenerationHeaderCard(data: data),
              ),
              const SizedBox(height: 10),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: data.members.length,
                itemBuilder: (context, index) {
                  final member = data.members[index];
                  bool isGenStart = index == 0 ||
                      data.members[index - 1].generationLevel != member.generationLevel;

                  bool isDashed = false;
                  double branchOffset = isGenStart ? 55.0 : 40.0;

                  return IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Line Component
                        TimelineLine(
                          isFirst: index == 0,
                          isLast: index == data.members.length - 1,
                          isGenerationStart: isGenStart,
                          isDashed: isDashed,
                          branchOffset: branchOffset,
                        ),

                        const SizedBox(width: 5),

                        // Label + Card Column
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 1. Generation Label (Capsule)
                              if (isGenStart)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8, top: 10),
                                  child:_buildGenLabel(context, 'generation.genSuffix'.trParams({'level': '${member.generationLevel}${_getSuffix(member.generationLevel)}'})),
                                ),

                              // 2. Member Card
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: MemberListTile(
                                  member: member,
                                  isExpanded: false, // Expansion logic controller se handle karein
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 50),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildGenLabel(BuildContext context, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
          color: AppColors.orangeColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20)
      ),
      child: AppText(label, color: AppColors.orangeColor, fontSize: 11, fontWeight: AppFonts.bold),
    );
  }

  String _getSuffix(int level) {
    if (level == 1) return "ST";
    if (level == 2) return "ND";
    if (level == 3) return "RD";
    return "TH";
  }
}
