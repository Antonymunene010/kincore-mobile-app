import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/utils/app_colors.dart';
import 'package:kincore_app/core/utils/app_fonts.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_network_image.dart';
import 'controller/k_mall_controller.dart';
import 'widget/bill_detail_section.dart';
import 'widget/payment_method_tile.dart';
import 'widget/reward_coin_section.dart';
import 'widget/shipping_address_card.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<KMallController>();
    final colors = Theme.of(context).colorScheme;
    final double maxWidth = Get.width < 600 ? Get.width : 650.0;

    // Consistent Orange Color
    const Color brandOrange = Color(0xFFFF7043);

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        title: AppText("checkout.title".tr, fontWeight: AppFonts.semiBold,fontSize: 20,),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Get.back(),
        ),
        centerTitle: false,
        backgroundColor: colors.surface,
        elevation: 0,
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _title("checkout.selectedProduct".tr),
                _buildSingleItem(controller, brandOrange),
                const SizedBox(height: 25),
                _title("checkout.shippingAddress".tr),
                ShippingAddressCard(
                  title: "checkout.addressName".tr,
                  address: "checkout.addressDetail".tr,
                  onEdit: () {},
                ),
                const SizedBox(height: 25),
                _title("checkout.paymentMethod".tr),
                PaymentMethodTile(
                  title: "checkout.payment.card".tr,
                  icon: Icons.credit_card,
                  value: "Credit Card",
                  ctrl: controller,
                  onTap: () => controller.setPayment("Credit Card"),
                ),
                PaymentMethodTile(
                  title: "checkout.payment.upi".tr,
                  icon: Icons.account_balance_wallet,
                  value: "UPI",
                  ctrl: controller,
                  onTap: () => controller.setPayment("UPI"),
                ),
                // PaymentMethodTile(
                //   title: "checkout.payment.netbanking".tr,
                //   icon: Icons.account_balance,
                //   value: "Net Banking",
                //   ctrl: controller,
                //   onTap: () => controller.setPayment("Net Banking"),
                // ),
                // const SizedBox(height: 25),
                // _title("checkout.applyRewards".tr),
                // RewardCoinsSection(ctrl: controller),
                // const SizedBox(height: 25),
                PaymentMethodTile(
                  title: "checkout.payment.netbanking".tr,
                  icon: Icons.account_balance,
                  value: "Net Banking",
                  ctrl: controller,
                  onTap: () => controller.setPayment("Net Banking"),
                ),
                const SizedBox(height: 25),

                // 👇 YAHAN SE REPLACE KAREIN 👇
                Row(
                  children: [
                    // Black Icon Background (DoorDash jaisa look dene ke liye)
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: colors.onSurface,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(Icons.wallet, color: colors.surface, size: 16),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AppText(
                        "Use KCC Credits", // Aap ise "checkout.useCredits".tr se change kar sakte ho
                        fontSize: 16,
                        fontWeight: AppFonts.semiBold,
                      ),
                    ),
                    // iOS/Android adaptive toggle switch
                    Obx(() => Switch.adaptive(
                      // Note: KMallController me 'var useCredits = false.obs;' add zaroor kar lena
                      value: controller.useCredits.value,
                      activeColor: AppColors.orangeColor,
                      onChanged: (val) {
                        controller.useCredits.value = val;
                        // TODO: Yahan discount apply karne ka function call kar lena
                      },
                    )),
                  ],
                ),
                // 👆 YAHAN TAK 👆

                const SizedBox(height: 25),
                _title("checkout.billDetails".tr),
                BillDetailsSection(ctrl: controller),
                _title("checkout.billDetails".tr),
                BillDetailsSection(ctrl: controller),
                const SizedBox(height: 120),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _buildPlaceOrderBar(controller, maxWidth, brandOrange),
    );
  }

  Widget _title(String t) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: AppText(t, fontSize: 17, fontWeight: FontWeight.bold),
  );

  Widget _buildSingleItem(KMallController ctrl, Color orange) {
    final item = ctrl.checkoutProduct;
    if (item == null) return const SizedBox();
    return Row(
      children: [
        CustomNetworkImage(
          imageUrl: item.image,
          width: 75,
          height: 75,
          borderRadius: 12,
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(item.name, fontSize: 16, fontWeight: FontWeight.bold),
              const SizedBox(height: 4),
              AppText(
                "\$${item.price}",
                color: orange,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPlaceOrderBar(KMallController ctrl, double width, Color orange) {
    final colors = Theme.of(Get.context!).colorScheme;

    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.1))),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Obx(
                  () => Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    "checkout.total".tr.toUpperCase(),
                    fontSize: 12,
                    color: colors.onSurface.withOpacity(0.6),
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 2),
                  AppText(
                    "\$${ctrl.checkoutTotal.toStringAsFixed(2)}",
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: AppColors.orangeColor,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orangeColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () => ctrl.placeOrder(),
                child: AppText(
                  "checkout.placeOrder".tr,
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
