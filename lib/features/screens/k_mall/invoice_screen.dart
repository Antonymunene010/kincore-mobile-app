import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_button.dart';

class InvoiceScreen extends StatelessWidget {
  final String orderId;
  final dynamic orderData;

  const InvoiceScreen({super.key, required this.orderId, required this.orderData});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        title: AppText('invoice.title'.tr, fontWeight: AppFonts.semiBold, fontSize: 18),
        backgroundColor: colors.surface,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, size: 20, color: colors.onSurface),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.download_outlined, color: AppColors.orangeColor),
            onPressed: () => Get.snackbar('invoice.downloadingTitle'.tr, 'invoice.downloadingMsg'.tr),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              // Invoice Card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: colors.surface,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: colors.outlineVariant.withOpacity(0.3)),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: AppText("KINCORE MALL", fontSize: 20, fontWeight: AppFonts.bold, color: AppColors.orangeColor),
                    ),
                    const SizedBox(height: 5),
                    Center(child: AppText('invoice.taxInvoice'.tr, fontSize: 12, color: colors.onSurfaceVariant)),

                    const Divider(height: 30),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _infoColumn('invoice.orderId'.tr, "#$orderId", colors),
                        // Date ko dummy rakha hai (API se replace karna hoga)
                        _infoColumn('invoice.orderDate'.tr, "20 Oct 2026", colors, isRight: true),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Payment mode dummy
                        _infoColumn('invoice.paymentMode'.tr, "Credit Card", colors),
                        _infoColumn('invoice.status'.tr, 'invoice.paid'.tr, colors, isRight: true, valColor: Colors.green),
                      ],
                    ),

                    const Divider(height: 30),

                    AppText('invoice.shippingDetails'.tr, fontSize: 14, fontWeight: AppFonts.bold),
                    const SizedBox(height: 5),
                    // Address dummy
                    AppText("John Doe\n123 Family Street, New York, NY 10001", fontSize: 13, color: colors.onSurfaceVariant),

                    const Divider(height: 30),

                    // Items List
                    AppText('invoice.orderSummary'.tr, fontSize: 14, fontWeight: AppFonts.bold),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Item name dummy
                        AppText("1x Nike Shoes", fontSize: 13, fontWeight: AppFonts.medium),
                        AppText("\$500.00", fontSize: 13, fontWeight: AppFonts.medium),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText('invoice.shippingFee'.tr, fontSize: 13, color: colors.onSurfaceVariant),
                        AppText("\$0.00", fontSize: 13, color: colors.onSurfaceVariant),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText('invoice.tax'.tr, fontSize: 13, color: colors.onSurfaceVariant),
                        AppText("\$50.00", fontSize: 13, color: colors.onSurfaceVariant),
                      ],
                    ),

                    const Divider(height: 30),

                    // Total
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText('invoice.totalAmount'.tr, fontSize: 16, fontWeight: AppFonts.bold),
                        AppText("\$550.00", fontSize: 18, fontWeight: AppFonts.bold, color: AppColors.orangeColor),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
              CustomButton(
                text: 'invoice.downloadPdf'.tr,
                onPressed: () => Get.snackbar('invoice.downloadingTitle'.tr, 'invoice.downloadingMsg'.tr),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoColumn(String label, String value, ColorScheme colors, {bool isRight = false, Color? valColor}) {
    return Column(
      crossAxisAlignment: isRight ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        AppText(label, fontSize: 11, color: colors.onSurfaceVariant),
        const SizedBox(height: 4),
        AppText(value, fontSize: 13, fontWeight: AppFonts.semiBold, color: valColor ?? colors.onSurface),
      ],
    );
  }
}