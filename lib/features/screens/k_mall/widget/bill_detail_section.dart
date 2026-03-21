import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/app_text.dart';
import '../controller/k_mall_controller.dart';

class BillDetailsSection extends StatelessWidget {
  final KMallController ctrl;
  const BillDetailsSection({super.key, required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      double currentSubtotal = ctrl.checkoutSubtotal;
      double taxAmount = (currentSubtotal * ctrl.taxPercent.value) / 100;
      double finalTotal = currentSubtotal + taxAmount + ctrl.shippingFee.value;

      return Column(
        children: [
          _buildRow("checkout.subtotal".tr, "\$${currentSubtotal.toStringAsFixed(2)}"),
          _buildRow("checkout.shippingFee".tr, "\$${ctrl.shippingFee.value.toStringAsFixed(2)}"),
          _buildRow("checkout.tax".trParams({'percent': ctrl.taxPercent.value.toString()}), "\$${taxAmount.toStringAsFixed(2)}"),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText("checkout.totalAmount".tr, fontSize: 16, fontWeight: FontWeight.bold),
              AppText(
                  "\$${finalTotal.toStringAsFixed(2)}",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFFF7043)
              ),
            ],
          ),
        ],
      );
    });
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(label, fontSize: 14, color: Colors.grey),
          AppText(value, fontSize: 14, fontWeight: FontWeight.w600),
        ],
      ),
    );
  }
}
